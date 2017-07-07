import AlamofireImage

class RandomPresenter: RandomPresenterProtocol {
    
    weak var view: RandomViewProtocol?
    var interactor: RandomInteractorInputProtocol?
    var wireFrame: RandomWireFrameProtocol?
    
    func loadMovieGenres() {
        interactor?.retrieveMovieGenres()
    }
    
    func loadTvShowGenres() {
        interactor?.retrieveTvShowGenres()
    }
    
    func search(from view: RandomViewProtocol, with genres: [String], type: MovieType) {
        wireFrame?.presentRandomResultScreen(from: view, with: genres, type: type)
    }
}

extension RandomPresenter: RandomInteractorOutputProtocol {
    
    func didRetrieveMovieGenres(_ genres: [IdName]) {
        view?.reloadMovieGenreInterface(with: genres.map() {
            return GenreViewModel(id: $0.id, name: $0.name)
        })
    }
    
    func didRetrieveTvShowGenres(_ genres: [IdName]) {
        view?.reloadTvShowGenreInterface(with: genres.map() {
            return GenreViewModel(id: $0.id, name: $0.name)
        })
    }
}
