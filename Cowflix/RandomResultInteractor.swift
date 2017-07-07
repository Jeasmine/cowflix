
class RandomResultInteractor: RandomResultInteractorInputProtocol {
    
    weak var presenter: RandomResultInteractorOutputProtocol?
    var dataManager: RandomResultDataManagerInputProtocol?
    
    func retrieveMovies(with genres: String) {
        dataManager?.retrieveMovies(with: genres) { (result) in
            if let movies = result.result.value?.data {
                self.presenter?.didRetrieveMovies(movies)
            } else {
                self.presenter?.didRetrieveMovies([])
            }
        }
    }
    
    func retrieveTvShows(with genres: String) {
        dataManager?.retrieveTvShows(with: genres) { (result) in
            if let movies = result.result.value?.data {
                self.presenter?.didRetrieveTvShows(movies)
            } else {
                self.presenter?.didRetrieveTvShows([])
            }
        }
    }
}
