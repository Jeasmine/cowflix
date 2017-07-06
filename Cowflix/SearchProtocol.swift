import UIKit

protocol SearchWireFrameProtocol: class {
    static func createSearchModule() -> UIViewController
    
    func presentDetailScreen(from view: SearchViewProtocol, with movie: MovieViewModel)
    
    func dismissDetailInterface(from view: SearchViewProtocol)
}

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    
    func reloadInterface(with movies: [MovieViewModel])
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireFrame: SearchWireFrameProtocol? { get set }
    
    func search(name: String)
    
    func backAction()
    
    func detail(from view: SearchViewProtocol, with movie: MovieViewModel)
}

protocol SearchInteractorOutputProtocol: class {
     func didRetrieveMovies(_ movies: [Movie])
}

protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var dataManager: SearchDataManagerInputProtocol? { get set }
    
    func retrieveMovies(movieName: String)
}

protocol SearchDataManagerInputProtocol: class {
    
    func retrieveSearchedMovies(query: String, completationHandler:@escaping MovieSearchCompletionHandler)
}
