import UIKit

class FavoriteWireFrame: FavoriteRouterProtocol {
    
    static func createFavoriteModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"FavoritesNavigationController") as! UINavigationController
        navController.navigationBar.barTintColor = UIColor.gray
        return navController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
