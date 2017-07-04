import UIKit

class FavoriteView: UIViewController {
    var presenter: FavoritePresenterProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favoriteSwitch: UISegmentedControl!
    
    var favoriteMovies: [MovieDataCell] = []
    var favoriteSeries: [MovieDataCell] = []
    
    @IBAction func movieSerieSwitch(_ sender: UISegmentedControl) {
    // Si toco el switch debo cambiar la collection que muestro
        
        print(favoriteSwitch.titleForSegment(at: favoriteSwitch.selectedSegmentIndex)!)
        
    }
}

extension FavoriteView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                    for: indexPath)
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

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath){
        
        var list: [MovieDataCell] = []
        if (favoriteSwitch.selectedSegmentIndex == 0) {
            list = favoriteMovies
        } else {
            list = favoriteSeries
        }
//        presenter?.detail(from: self, with: list[indexPath.row])
        presenter?.detail(with: list[indexPath.row])
    }
    
}

