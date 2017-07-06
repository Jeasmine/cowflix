import UIKit

class SearchView: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    let nibFileName = "MovieCustomCell"
    let reuseIdentifier = "movieCustomCell"
    
    var movieList: [MovieViewModel] = []
    let searchBar = UISearchBar()
    var presenter: SearchPresenterProtocol?
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        makeBackButton()
        
        searchBar.placeholder = "Search..."
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
        
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        presenter?.search(name: "Woman")
    }
    
    func makeBackButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didClickOnBackButton))
    }
    
    func didClickOnBackButton() {
        presenter?.backAction()
    }
}

extension SearchView: SearchViewProtocol {
    
    func reloadInterface(with movies: [MovieViewModel]) {
        movieList = movies
        collectionView.reloadData()
    }
}

extension SearchView: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:nil, style:UIBarButtonItemStyle.plain, target:self, action:nil)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        
        self.navigationItem.hidesBackButton = false
        makeBackButton()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            presenter?.search(name: text)
        }
    }
}

extension SearchView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCustomCell
        let movie = movieList[indexPath.row]
        if let image = movie.image {
            cell.movieImage.image = image
        } else {
            let url = URL(string: APIConstants.imageBaseUrl + movie.imagePath)!
            let placeholderImage = UIImage(named: "image_placeholder")!
            
            cell.movieImage.af_setImage(withURL: url, placeholderImage: placeholderImage, completion: { data in
                if let image = data.value {
                    self.movieList[indexPath.row].image = image
                }
            })
        }
        return cell
    }
}

extension SearchView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.detail(from: self, with: movieList[indexPath.row])
    }
}

extension SearchView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem + widthPerItem / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
