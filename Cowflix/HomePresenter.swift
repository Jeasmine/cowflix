
class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?

    
    func viewDidLoad() {
    
    }

    func search(from view: HomeViewProtocol) {
        wireFrame?.presentSearchScreen(from: view)
    }
}
