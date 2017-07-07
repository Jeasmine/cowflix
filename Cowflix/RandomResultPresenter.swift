import AlamofireImage

class RandomResultPresenter: RandomResultPresenterProtocol {
    
    weak var view: RandomResultViewProtocol?
    var interactor: RandomResultInteractorInputProtocol?
    var wireFrame: RandomResultWireFrameProtocol?
    
    func search(from view: RandomResultViewProtocol, with genres: [String], type: MovieType) {
        switch type {
        case .tvshow:
            interactor?.retrieveTvShows(with: mapToString(list: genres))
        default:
            interactor?.retrieveMovies(with: mapToString(list: genres))
        }
    }
    
    func mapToString(list: [String]) -> String {
        return list.joined(separator: ",")
    }
    
    func detail(from view: RandomResultViewProtocol, with movie: MovieViewModel) {
        wireFrame?.presentDetailScreen(from: view, with: movie)
    }
}

extension RandomResultPresenter: RandomResultInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [Movie]) {
        view?.reloadInterface(with: movies.map() {
            return MovieViewModel(id: $0.id, type: .movie, title: $0.title, imagePath: $0.imagePath, overview: $0.overview, image: nil)
        })

    }
    
    func didRetrieveTvShows(_ shows: [TvShow]) {
        view?.reloadInterface(with: shows.map() {
            return MovieViewModel(id: $0.id, type: .movie, title: $0.name, imagePath: $0.imagePath, overview: $0.overview, image: nil)
        })

    }
}
