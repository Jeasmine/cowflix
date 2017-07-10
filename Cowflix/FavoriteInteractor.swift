
class FavoriteInteractor: FavoriteInteractorInputProtocol {
    
    var presenter: FavoriteInteractorOutputProtocol?
    var localDatamanager: FavoriteLocalDataManagerInputProtocol?
    
    func retrieveMovies() {
        do {
            try self.presenter?.didRetrieveMovies((localDatamanager?.retrieveFavoriteList())!)
        } catch {
            print("HUBO CATCH")
        }
        
    }
}
