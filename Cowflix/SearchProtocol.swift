import UIKit

protocol SearchModuleDelegate: class {
    func didCancelSearchContact()
}

protocol SearchWireFrameProtocol: class {
    static func createSearchModule() -> UIViewController
}

protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }
}

protocol SearchPresenterProtocol: class {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SearchInteractorOutputProtocol: class {}

protocol SearchInteractorInputProtocol: class {
    var presenter: SearchInteractorOutputProtocol? { get set }
    var localDatamanager: SearchLocalDataManagerInputProtocol? { get set }
}

protocol SearchDataManagerInputProtocol: class {
}

protocol SearchLocalDataManagerInputProtocol: class {
}
