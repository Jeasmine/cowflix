import UIKit

protocol HomeRouterProtocol: class {
    static func createHomeModule() -> UIViewController
}

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomePresenterProtocol: class {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
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
