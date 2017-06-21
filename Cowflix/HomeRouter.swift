import UIKit

class HomeRouter: HomeRouterProtocol {
    
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"HomeNavigationController")
        if let view = navController.childViewControllers.first as? HomeView {
            return navController
        }
        return UIViewController()

    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
