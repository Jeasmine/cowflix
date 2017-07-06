
class SearchPresenter: SearchPresenterProtocol {
    
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var wireFrame: SearchWireFrameProtocol?
    
    func search(name: String) {
        interactor?.retrieveMovies(movieName: name)
    }
    
    func backAction() {
        if let view = view {
            wireFrame?.dismissDetailInterface(from: view)
        }
    }
    
    func detail(from view: SearchViewProtocol, with movie: MovieViewModel) {
        wireFrame?.presentDetailScreen(from: view, with: movie)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [Movie]) {
        view?.reloadInterface(with: movies.map() {
            return MovieViewModel(id: $0.id, title: $0.title, imagePath: $0.posterPath, image: nil)
        })
    }
}
