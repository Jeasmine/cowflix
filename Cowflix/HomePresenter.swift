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
    
    func detail(from view: HomeViewProtocol, with movie: MovieViewModel) {
        wireFrame?.presentDetailScreen(from: view, with: movie)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [Movie]) {
        view?.reloadInterface(with: movies.map() {
            return MovieViewModel(id: $0.id, type: .movie, title: $0.title, imagePath: $0.imagePath, overview: $0.overview, image: nil)
        })
    }
}
