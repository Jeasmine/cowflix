import UIKit
import AlamofireObjectMapper

protocol RandomResultWireFrameProtocol: class {
    static func createRandomResultModule(genres: [String], type: MovieType) -> UIViewController
    
    func presentDetailScreen(from view: RandomResultViewProtocol, with movie: MovieViewModel)
}

protocol RandomResultViewProtocol: class {
    var presenter: RandomResultPresenterProtocol? { get set }
    
    func reloadInterface(with movies: [MovieViewModel])
}

protocol RandomResultPresenterProtocol: class {
    var view: RandomResultViewProtocol? { get set }
    var interactor: RandomResultInteractorInputProtocol? { get set }
    var wireFrame: RandomResultWireFrameProtocol? { get set }
    
    func search(from view: RandomResultViewProtocol, with genres: [String], type: MovieType)
    
    func detail(from view: RandomResultViewProtocol, with movie: MovieViewModel)
}

protocol RandomResultInteractorOutputProtocol: class {
    func didRetrieveMovies(_ movies: [Movie])
    
    func didRetrieveTvShows(_ shows: [TvShow])
}

protocol RandomResultInteractorInputProtocol: class {
    var presenter: RandomResultInteractorOutputProtocol? { get set }
    var dataManager: RandomResultDataManagerInputProtocol? { get set }
    
    func retrieveMovies(with genres: String)
    
    func retrieveTvShows(with genres: String)
}

protocol RandomResultDataManagerInputProtocol: class {
    
    func retrieveMovies(with genres: String, completationHandler: @escaping MovieSearchCompletionHandler)
    
    func retrieveTvShows(with genres: String, completationHandler: @escaping TvShowSearchCompletionHandler)
}
