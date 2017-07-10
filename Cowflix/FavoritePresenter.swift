
class FavoritePresenter: FavoritePresenterProtocol {
    var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var wireFrame: FavoriteWireFrameProtocol?
    
    var movies: [MovieEntity] = []
    
    func viewDidLoad(){
        print("view did load presenter")
        interactor?.retrieveMovies()
    }
    
    func detail(from view: FavoriteViewProtocol, with movie: MovieViewModel){
    }
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [MovieEntity]) {
        print("a ver si paso por el presenter")
        view?.reloadInterface(with: movies.map() {
            return MovieViewModel(id: Int($0.apiId), type: .movie, title: $0.title, imagePath: $0.imagePath, overview: $0.synopsis, image: nil)
        })
    }
}
