import UIKit
import AlamofireObjectMapper

protocol HomeWireFrameProtocol: class {
    static func createHomeModule() -> UIViewController
    
    func presentSearchScreen(from view: HomeViewProtocol)
    
    func presentDetailScreen(from view: HomeViewProtocol, with movie: MovieViewModel)
}

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func reloadInterface(with movies: [MovieViewModel])
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()

    func search(from view: HomeViewProtocol)
    
    func detail(from view: HomeViewProtocol, with movie: MovieViewModel)
}

protocol HomeInteractorOutputProtocol: class {
    func didRetrieveMovies(_ movies: [Movie])
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var dataManager: HomeDataManagerInputProtocol? { get set }
    
    func retrieveMovies()
}

protocol HomeDataManagerInputProtocol: class {
    
    func retrieveNowPlayingMovies(completationHandler: @escaping MovieResultCompletionHandler)
}
