import UIKit
import AlamofireImage

class HomeView: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    let nibFileName = "MovieCustomCell"
    let reuseIdentifier = "movieCustomCell"
    
    var presenter: HomePresenterProtocol?
    var movieList: [MovieViewModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        collectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    @IBAction func onSearchClick(_ sender: UIBarButtonItem) {
        presenter?.search(from: self)
    }
}

extension HomeView: HomeViewProtocol {
    
    func reloadInterface(with movies: [MovieViewModel]) {
        movieList = movies
        collectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDataSource {
    
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

extension HomeView: UICollectionViewDelegate {
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    
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
