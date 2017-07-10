
class FavoritePresenter: FavoritePresenterProtocol {
    var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var wireFrame: FavoriteWireFrameProtocol?
    
    var movies: [MovieEntity] = []
    
    func viewDidLoad(){
        interactor?.retrieveMovies()
    }
    
    func detail(from view: FavoriteViewProtocol, with movie: MovieViewModel){
        wireFrame?.presentDetailScreen(from: view, with: movie)
    }
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    
    func didRetrieveMovies(_ movies: [MovieEntity]) {
        
        var favoriteMovie: [MovieViewModel] = []
        var favoriteSerie: [MovieViewModel] = []

        movies.forEach{ movie in
            if movie.type == 0 {
                favoriteMovie.append(MovieViewModel(id: Int(movie.apiId), type: .movie, title: movie.title, imagePath: movie.imagePath, overview: movie.synopsis, image: nil))
            } else {
                favoriteSerie.append(MovieViewModel(id: Int(movie.apiId), type: .movie, title: movie.title, imagePath: movie.imagePath, overview: movie.synopsis, image: nil))
            }
        }
        
        view?.reloadInterface(movies: favoriteMovie, series: favoriteSerie)
    }
}
