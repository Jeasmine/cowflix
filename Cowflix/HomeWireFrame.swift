import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"HomeNavigationController")
        if let view = navController.childViewControllers.first as? HomeView {
            let presenter = HomePresenter()
            let wireFrame = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            
            return navController
        }
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentSearchScreen(from view: HomeViewProtocol) {
        let module = SearchWireFrame.createSearchModule()
        if let sourceView = view as? UIViewController {
            sourceView.present(module, animated: true, completion: nil)
        }
    }
}
