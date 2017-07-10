import UIKit

class FavoriteWireFrame: FavoriteWireFrameProtocol {
    
    static func createFavoriteModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"FavoritesNavigationController") as! UINavigationController
        navController.navigationBar.barTintColor = UIColor.gray
        if let view = navController.childViewControllers.first as? FavoriteView {
            let presenter = FavoritePresenter()
            let interactor = FavoriteInteractor()
            let dataManager = FavoriteLocalDataManager()
            let wireFrame = FavoriteWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = dataManager
            return navController
        }
        return navController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailScreen(from view: FavoriteViewProtocol, with movie: MovieViewModel){
        let module = DetailWireFrame.createDetailModule(movie: movie)
        if let sourceView = view as? UIViewController {
            sourceView.present(module, animated: true, completion: nil)
        }
    }
}
