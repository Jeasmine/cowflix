
class DetailInteractor: DetailInteractorInputProtocol {
    
    weak var presenter: DetailInteractorOutputProtocol?
    var dataManager: DetailDataManagerInputProtocol?
    var localDataManager: DetailLocalDataManagerInputProtocol?
    
    func retrieveDetail(movieId: Int) {
        dataManager?.retrieveMovieDetail(id: movieId) { (result) in
            if let movie = result.result.value {
                self.presenter?.didRetrieveDetail(movie)
            } else {
                self.presenter?.didRetrieveDetail(MovieDetail())
            }
        }
    }
    
    func saveFavorite(movie: MovieViewModel) -> Bool {
        var result = false
        do {
            let tryResult = try localDataManager?.createFavorite(movie: movie)
            result = tryResult ?? false
        } catch {
        }
        return result
    }
    
    func findFavorite(id: Int) -> Bool {
        var result = false
        do {
            let tryResult = try localDataManager?.findFavorite(apiId: id)
            result = tryResult ?? false
        } catch {
        }
        return result
    }
}
