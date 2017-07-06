import UIKit

protocol SearchWireFrameProtocol: class {
    static func createSearchModule() -> UIViewController
    
    func presentDetailScreen(from view: SearchViewProtocol, with movie: MovieViewModel)
    
    func dismissDetailInterface(from view: SearchViewProtocol)
}

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
    
    func reloadMovieInterface(with movies: [MovieViewModel])
    
    func reloadTvShowsInterface(with tvShows: [MovieViewModel])
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireFrame: SearchWireFrameProtocol? { get set }
    
    func search(type: MovieType, name: String)
    
    func backAction()
    
    func detail(from view: SearchViewProtocol, with movie: MovieViewModel)
}

protocol SearchInteractorOutputProtocol: class {
    func didRetrieveMovies(_ movies: [Movie])
    
    func didRetrieveShows(_ tvShows: [TvShow])
}

protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var dataManager: SearchDataManagerInputProtocol? { get set }
    
    func retrieveMovies(movieName: String)
    
    func retrieveTvShows(tvShowName: String)
}

protocol SearchDataManagerInputProtocol: class {
    
    func retrieveSearchedMovies(query: String, completationHandler:@escaping MovieSearchCompletionHandler)
    
    func retrieveSearchedTvShows(query: String, completationHandler: @escaping TvShowSearchCompletionHandler)
}
