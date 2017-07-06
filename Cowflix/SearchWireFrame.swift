import UIKit

class SearchWireFrame: SearchWireFrameProtocol {

    static func createSearchModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"SearchNavigationController")
        if let view = navController.childViewControllers.first as? SearchView {
            let presenter = SearchPresenter()
            let interactor = SearchInteractor()
            let dataManager = SearchDataManager()
            let wireFrame = SearchWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            return navController
        }
        return navController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailScreen(from view: SearchViewProtocol, with movie: MovieViewModel) {
        let module = DetailWireFrame.createDetailModule(movie: movie)
        if let sourceView = view as? UIViewController {
            sourceView.present(module, animated: true, completion: nil)
        }
    }
    
    func dismissDetailInterface(from view: SearchViewProtocol) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true) {}
        }
    }
}
