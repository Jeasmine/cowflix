import UIKit

protocol FavoriteWireFrameProtocol: class {
    static func createFavoriteModule() -> UIViewController
    
    func presentDetailScreen(from view: FavoriteViewProtocol, with movie: MovieViewModel)
}

protocol FavoriteViewProtocol: class {
    var presenter: FavoritePresenterProtocol? { get set }
}

protocol FavoritePresenterProtocol: class {
    var view: FavoriteViewProtocol? { get set }
    var interactor: FavoriteInteractorInputProtocol? { get set }
    var wireFrame: FavoriteWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func detail(from view: FavoriteViewProtocol, with movie: MovieViewModel)
}

protocol FavoriteInteractorOutputProtocol: class {}

protocol FavoriteInteractorInputProtocol: class {
    var presenter: FavoriteInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteLocalDataManagerInputProtocol? { get set }
}

protocol FavoriteLocalDataManagerInputProtocol: class {
    
    func retrieveFavoriteList() throws -> [MovieEntity]
}
