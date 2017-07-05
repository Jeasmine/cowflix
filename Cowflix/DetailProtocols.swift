import UIKit

protocol DetailWireFrameProtocol: class {
    static func createDetailModule(movie: MovieViewModel) -> UIViewController
    
    func dismissDetailInterface(from view: DetailViewProtocol)
}

protocol DetailViewProtocol: class {
    var presenter: DetailPresenterProtocol? { get set }
    
    func reloadInterface(with detail: MovieDetailViewModel)
}

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    
    func backAction()
    
    func loadDetail(with movieId: Int)
}

protocol DetailInteractorOutputProtocol: class {
    func didRetrieveDetail(_ movie: MovieDetail)
}

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    var dataManager: DetailDataManagerInputProtocol? { get set }
    
    func retrieveDetail(movieId: Int)
}

protocol DetailDataManagerInputProtocol: class {
    
    func retrieveMovieDetail(id: Int, completationHandler:@escaping MovieDetailCompletionHandler)
}
