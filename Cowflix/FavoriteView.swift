import UIKit

class FavoriteView: UIViewController {
    var presenter: FavoritePresenterProtocol?
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favoriteSwitch: UISegmentedControl!
    
    var favoriteMovies: [MovieViewModel] = []
    var favoriteSeries: [MovieViewModel] = []
    let nibFileName = "MovieCustomCell"
    let reuseIdentifier = "movieCustomCell"
    
    @IBAction func movieSerieSwitch(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        collectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidLoad()
        collectionView.reloadData()
    }
}

extension FavoriteView: FavoriteViewProtocol {
    func reloadInterface(movies: [MovieViewModel], series: [MovieViewModel]){
        favoriteMovies = movies
        favoriteSeries = series
        collectionView.reloadData()
    }
}

extension FavoriteView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var moviesToShow: [MovieViewModel] = []
        
        if favoriteSwitch.selectedSegmentIndex == 0 {
            moviesToShow = favoriteMovies
        } else {
            moviesToShow = favoriteSeries
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCustomCell
        let movie = moviesToShow[indexPath.row]
        if let image = movie.image {
            cell.movieImage.image = image
        } else {
            let url = URL(string: APIConstants.imageBaseUrl + movie.imagePath)!
            let placeholderImage = UIImage(named: "image_placeholder")!
            
            cell.movieImage.af_setImage(withURL: url, placeholderImage: placeholderImage, completion: { data in
                if let image = data.value {
                    moviesToShow[indexPath.row].image = image
                }
            })
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
    
        if favoriteSwitch.selectedSegmentIndex == 0 {
            return favoriteMovies.count
        } else {
            return favoriteSeries.count
        }
    }
}

extension FavoriteView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var list: [MovieViewModel] = []
        if (favoriteSwitch.selectedSegmentIndex == 0) {
            list = favoriteMovies
        } else {
            list = favoriteSeries
        }
        
        presenter?.detail(from: self, with: list[indexPath.row])
    }
}

extension FavoriteView: UICollectionViewDelegateFlowLayout {
    
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

