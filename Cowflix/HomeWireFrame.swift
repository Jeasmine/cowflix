import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"HomeNavigationController")
        if let view = navController.childViewControllers.first as? HomeView {
            let presenter = HomePresenter()
            let interactor = HomeInteractor()
            let dataManager = HomeDataManager()
            let wireFrame = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
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
