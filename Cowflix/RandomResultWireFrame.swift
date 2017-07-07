import UIKit

class RandomResultWireFrame: RandomResultWireFrameProtocol {
    
    static func createRandomResultModule(genres: [String], type: MovieType) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"RandomResultNavigationController")
        if let view = navController.childViewControllers.first as? RandomResultView {
            let presenter = RandomResultPresenter()
            let interactor = RandomResultInteractor()
            let dataManager = RandomResultDataManager()
            let wireFrame = RandomResultWireFrame()
            
            view.genres = genres
            view.type = type
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
    
    func presentDetailScreen(from view: RandomResultViewProtocol, with movie: MovieViewModel) {
        let module = DetailWireFrame.createDetailModule(movie: movie)
        if let sourceView = view as? UIViewController {
            sourceView.present(module, animated: true, completion: nil)
        }
    }
}
