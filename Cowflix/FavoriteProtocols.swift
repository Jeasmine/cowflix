import UIKit

protocol FavoriteWireFrameProtocol: class {
    static func createFavoriteModule() -> UIViewController
    
    func presentDetailScreen(from view: FavoriteViewProtocol, with movie: MovieViewModel)
}

protocol FavoriteViewProtocol: class {
    var presenter: FavoritePresenterProtocol? { get set }
    
    func reloadInterface(movies: [MovieViewModel],series: [MovieViewModel])
}

protocol FavoritePresenterProtocol: class {
    var view: FavoriteViewProtocol? { get set }
    var interactor: FavoriteInteractorInputProtocol? { get set }
    var wireFrame: FavoriteWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func detail(from view: FavoriteViewProtocol, with movie: MovieViewModel)
}

protocol FavoriteInteractorOutputProtocol: class {
    func didRetrieveMovies(_ movies: [MovieEntity])
}

protocol FavoriteInteractorInputProtocol: class {
    var presenter: FavoriteInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteLocalDataManagerInputProtocol? { get set }
    
    func retrieveMovies()
}

protocol FavoriteLocalDataManagerInputProtocol: class {
    
    func retrieveFavoriteList() throws -> [MovieEntity]
}
