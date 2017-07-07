
class RandomInteractor: RandomInteractorInputProtocol {
    
    weak var presenter: RandomInteractorOutputProtocol?
    var dataManager: RandomDataManagerInputProtocol?
    
    func retrieveMovieGenres() {
        dataManager?.retrieveMovieGenres() { (result) in
            if let genres = result.result.value?.genres {
                self.presenter?.didRetrieveMovieGenres(genres)
            } else {
                self.presenter?.didRetrieveMovieGenres([])
            }
        }
    }
    
    func retrieveTvShowGenres() {
        dataManager?.retrieveTvShowGenres() { (result) in
            if let genres = result.result.value?.genres {
                self.presenter?.didRetrieveTvShowGenres(genres)
            } else {
                self.presenter?.didRetrieveTvShowGenres([])
            }
        }
    }
}
