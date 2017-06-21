import UIKit

class HomeWireFrame: HomeRouterProtocol {
    
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"HomeNavigationController")
        return navController
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
