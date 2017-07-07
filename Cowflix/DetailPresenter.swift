
class DetailPresenter: DetailPresenterProtocol {
    
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    func viewDidLoad() {
    }
    
    func loadDetail(with movieId: Int) {
        interactor?.retrieveDetail(movieId: movieId)
    }
    
    func backAction() {
        if let view = view {
            wireFrame?.dismissDetailInterface(from: view)
        }
    }
    
    func saveFavorite(movie: MovieViewModel) {
        showFavoriteIcon(show: interactor?.saveFavorite(movie: movie) ?? false)
    }
    
    func findFavorite(id: Int) {
        showFavoriteIcon(show: interactor?.findFavorite(id: id) ?? false)
    }
    
    func showFavoriteIcon(show: Bool){
        if(show) {
            view?.showFavoriteIcon()
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {

    func didRetrieveDetail(_ movie: MovieDetail) {
        view?.reloadInterface(with: MovieDetailViewModel(title: movie.title))
    }
}
