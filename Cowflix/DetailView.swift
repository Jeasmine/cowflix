import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var favorite: UIBarButtonItem!
    
    var movie: MovieViewModel? = nil
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        self.navigationItem.leftItemsSupplementBackButton = true
        if let viewModel = movie {
            presenter?.loadDetail(with: viewModel.id)
            presenter?.findFavorite(id: viewModel.id)
            
            image.image = viewModel.image ?? UIImage(named: "image_placeholder")!
            movieDescription.text = viewModel.overview
            movieName.text = viewModel.title
        }
    }
    
    @IBAction func didClickFavoriteButton(_ sender: Any) {
        if let viewModel = movie {
            presenter?.saveFavorite(movie: viewModel)
        }
    }
    
    @IBAction func didClickOnBackButton(_ sender: Any) {
        presenter?.backAction()
    }
}

extension DetailView: DetailViewProtocol {
    
    func reloadInterface(with detail: MovieDetailViewModel) {
        genre.text = detail.genres
    }
    
    func showFavoriteIcon() {
        favorite.image = UIImage(named: "favorite")!
    }
}
