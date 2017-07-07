import UIKit
import AlamofireObjectMapper

protocol RandomWireFrameProtocol: class {
    static func createRandomModule() -> UIViewController
    
    func presentRandomResultScreen(from view: RandomViewProtocol, with genres: [String], type: MovieType)
}

protocol RandomViewProtocol: class {
    var presenter: RandomPresenterProtocol? { get set }
    
    func reloadMovieGenreInterface(with genres: [GenreViewModel])
    
    func reloadTvShowGenreInterface(with genres: [GenreViewModel])
}

protocol RandomPresenterProtocol: class {
    var view: RandomViewProtocol? { get set }
    var interactor: RandomInteractorInputProtocol? { get set }
    var wireFrame: RandomWireFrameProtocol? { get set }
    
    func loadMovieGenres()
    
    func loadTvShowGenres()
    
    func search(from view: RandomViewProtocol, with genres: [String], type: MovieType)
}

protocol RandomInteractorOutputProtocol: class {
    func didRetrieveMovieGenres(_ genres: [IdName])
    
    func didRetrieveTvShowGenres(_ genres: [IdName])
}

protocol RandomInteractorInputProtocol: class {
    var presenter: RandomInteractorOutputProtocol? { get set }
    var dataManager: RandomDataManagerInputProtocol? { get set }
    
    func retrieveMovieGenres()
    
    func retrieveTvShowGenres()
}

protocol RandomDataManagerInputProtocol: class {
    
    func retrieveMovieGenres(completationHandler: @escaping GenresCompletionHandler)
    
    func retrieveTvShowGenres(completationHandler: @escaping GenresCompletionHandler)
}
