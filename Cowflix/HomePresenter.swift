import AlamofireImage

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveMovies()
    }
    
    func search(from view: HomeViewProtocol) {
        wireFrame?.presentSearchScreen(from: view)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [Movie]) {
        view?.reloadInterface(with: movies.map() {
            return MovieViewModel(title: $0.title, imagePath: $0.posterPath, image: nil)
        })
    }
}
