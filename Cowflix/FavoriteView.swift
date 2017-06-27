import UIKit

class FavoriteView: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var favoriteSwitch: UISegmentedControl!
    
    var favoriteMovies: [String] = ["Avengers", "Mr. & Mrs. Smith"]
    var favoriteSeries: [String] = ["Pasion de gavilanes", "Grey's anatomy"]
    
    @IBAction func movieSerieSwitch(_ sender: UISegmentedControl) {
    // Si toco el switch debo cambiar la collection que muestro
        
        print(favoriteSwitch.titleForSegment(at: favoriteSwitch.selectedSegmentIndex)!)
        
        
    }
}
