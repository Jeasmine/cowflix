
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
}
