import UIKit

class SearchView: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    let nibFileName = "MovieCustomCell"
    let reuseIdentifier = "movieCustomCell"
    
    var movieList: [MovieViewModel] = []
    var tvShowList: [MovieViewModel] = []
    let searchBar = UISearchBar()
    var presenter: SearchPresenterProtocol?
    
    @IBOutlet weak var categorySelection: UISegmentedControl!
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
    }
    
    @IBAction func onChangeCategory(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    
    func makeBackButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didClickOnBackButton))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.orange
    }
    
    func didClickOnBackButton() {
        presenter?.backAction()
    }
    
    func getSegmentType() -> MovieType {
        return categorySelection.selectedSegmentIndex == 0 ? MovieType.movie : MovieType.tvshow
    }
    
    func getMovie(position: Int) -> MovieViewModel {
        return getSegmentType() == MovieType.movie ? movieList[position] : tvShowList[position]
    }
    
    func setImage(position: Int, image: UIImage) {
        if (getSegmentType() == MovieType.movie) {
            movieList[position].image = image
        } else {
            tvShowList[position].image = image
        }
    }
}

extension SearchView: SearchViewProtocol {
    
    func reloadMovieInterface(with movies: [MovieViewModel]) {
        movieList = movies
        collectionView.reloadData()
    }
    
    func reloadTvShowsInterface(with tvShows: [MovieViewModel]) {
        tvShowList = tvShows
        collectionView.reloadData()
    }
}

extension SearchView: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:nil, style:UIBarButtonItemStyle.plain, target:self, action:nil)
        searchBar.tintColor = UIColor.orange
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
            presenter?.search(type: getSegmentType(), name: text)
        }
    }
}

extension SearchView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getSegmentType() == MovieType.movie ? movieList.count : tvShowList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCustomCell
        let movie = getMovie(position: indexPath.row)
        if let image = movie.image {
            cell.movieImage.image = image
        } else {
            downloadImage(cell: cell, movie: movie, indexPath: indexPath)
        }
        return cell
    }
    
    private func downloadImage(cell: MovieCustomCell, movie: MovieViewModel, indexPath: IndexPath) {
        let url = URL(string: APIConstants.imageBaseUrl + movie.imagePath)!
        let placeholderImage = UIImage(named: "image_placeholder")!
        
        cell.movieImage.af_setImage(withURL: url, placeholderImage: placeholderImage, completion: { data in
            if let image = data.value {
                self.setImage(position: indexPath.row, image: image)
            }
        })
    }
}

extension SearchView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.detail(from: self, with: getMovie(position: indexPath.row))
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
