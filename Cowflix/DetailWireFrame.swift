import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
    static func createDetailModule(movie: MovieViewModel) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"DetailNavigationController")
        if let view = navController.childViewControllers.first as? DetailView {
            let presenter = DetailPresenter()
            let interactor = DetailInteractor()
            let dataManager = DetailDataManager()
            let localDataManager = DetailLocalDataManager()
            let wireFrame = DetailWireFrame()
            
            view.movie = movie
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            interactor.localDataManager = localDataManager
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func dismissDetailInterface(from view: DetailViewProtocol) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true) {}
        }
    }
}
