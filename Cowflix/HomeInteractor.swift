
class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    var dataManager: HomeDataManagerInputProtocol?
    
    func retrieveMovies() {
        dataManager?.retrieveNowPlayingMovies() { (result) in
            if let movies = result.result.value?.data {
                self.presenter?.didRetrieveMovies(movies)
            } else {
                self.presenter?.didRetrieveMovies([])
            }
        }
    }
}
