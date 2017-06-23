import UIKit

protocol HomeWireFrameProtocol: class {
    static func createHomeModule() -> UIViewController
    
    func presentSearchScreen(from view: HomeViewProtocol)
}

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func search(from view: HomeViewProtocol)
}

protocol HomeInteractorOutputProtocol: class {}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
}

protocol HomeDataManagerInputProtocol: class {
}

protocol HomeLocalDataManagerInputProtocol: class {
}
