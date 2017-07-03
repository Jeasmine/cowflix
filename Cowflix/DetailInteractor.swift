
class DetailInteractor: DetailInteractorInputProtocol {
    
    weak var presenter: DetailInteractorOutputProtocol?
    var dataManager: DetailDataManagerInputProtocol?
    
    func retrieveDetail(movieId: Int) {
        dataManager?.retrieveMovieDetail(id: movieId) { (result) in
            if let movie = result.result.value {
                self.presenter?.didRetrieveDetail(movie)
            } else {
                self.presenter?.didRetrieveDetail(MovieDetail())
            }
        }
    }
}
