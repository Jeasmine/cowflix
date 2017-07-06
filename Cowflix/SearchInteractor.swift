
class SearchInteractor: SearchInteractorInputProtocol {
    
    var presenter: SearchInteractorOutputProtocol?
    var dataManager: SearchDataManagerInputProtocol?
    
    func retrieveMovies(movieName: String) {
        dataManager?.retrieveSearchedMovies(query: movieName) { (result) in
            if let movies = result.result.value?.data {
                self.presenter?.didRetrieveMovies(movies)
            } else {
                self.presenter?.didRetrieveMovies([])
            }
        }
    }

    func retrieveTvShows(tvShowName: String) {
        dataManager?.retrieveSearchedTvShows(query: tvShowName) { (result) in
            if let tvShows = result.result.value?.data {
                self.presenter?.didRetrieveShows(tvShows)
            } else {
                self.presenter?.didRetrieveShows([])
            }
        }
    }
}
