import UIKit

class SearchWireFrame: SearchWireFrameProtocol {

    static func createSearchModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"SearchNavigationController")
        return navController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
