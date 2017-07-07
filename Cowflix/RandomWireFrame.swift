import UIKit

class RandomWireFrame: RandomWireFrameProtocol {
    
    static func createRandomModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier:"RandomNavigationController")
        if let view = navController.childViewControllers.first as? RandomView {
            let presenter = RandomPresenter()
            let interactor = RandomInteractor()
            let dataManager = RandomDataManager()
            let wireFrame = RandomWireFrame()
            
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
    
    func presentRandomResultScreen(from view: RandomViewProtocol, with genres: [String], type: MovieType) {
        let module = RandomResultWireFrame.createRandomResultModule(genres: genres, type: type)
        if let sourceView = view as? UIViewController {
            sourceView.present(module, animated: true, completion: nil)
        }
    }
}
