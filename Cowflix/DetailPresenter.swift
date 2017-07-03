
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
}

extension DetailPresenter: DetailInteractorOutputProtocol {

    func didRetrieveDetail(_ movie: MovieDetail) {
        view?.reloadInterface(with: MovieDetailViewModel(title: movie.title))
    }
}
