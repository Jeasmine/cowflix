
class SearchPresenter: SearchPresenterProtocol {
    
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var wireFrame: SearchWireFrameProtocol?
    
    func search(type: MovieType,name: String) {
        switch type {
        case .tvshow:
            interactor?.retrieveTvShows(tvShowName: name)
        default:
            interactor?.retrieveMovies(movieName: name)
        }
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
        view?.reloadMovieInterface(with: movies.map() {
            return MovieViewModel(id: $0.id, type: .movie, title: $0.title, imagePath: $0.imagePath, overview: $0.overview, image: nil)
        })
    }
    
    func didRetrieveShows(_ tvShows: [TvShow]) {
        view?.reloadTvShowsInterface(with: tvShows.map() {
            return MovieViewModel(id: $0.id, type: .tvshow, title: $0.name, imagePath: $0.imagePath, overview: $0.overview, image: nil)
        })
    }
}
