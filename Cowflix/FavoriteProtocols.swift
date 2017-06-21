import UIKit

protocol FavoriteRouterProtocol: class {
    static func createFavoriteModule() -> UIViewController
}

protocol FavoriteViewProtocol: class {
    var presenter: FavoritePresenterProtocol? { get set }
}

protocol FavoritePresenterProtocol: class {
    var view: FavoriteViewProtocol? { get set }
    var interactor: FavoriteInteractorInputProtocol? { get set }
    var router: FavoriteRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol FavoriteInteractorOutputProtocol: class {}

protocol FavoriteInteractorInputProtocol: class {
    var presenter: FavoriteInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteLocalDataManagerInputProtocol? { get set }
}

protocol FavoriteDataManagerInputProtocol: class {
}

protocol FavoriteLocalDataManagerInputProtocol: class {
}
