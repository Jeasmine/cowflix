import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    var movie: MovieViewModel? = nil
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        self.navigationItem.leftItemsSupplementBackButton = true
        if let viewModel = movie {
            image.image = viewModel.image ?? UIImage(named: "image_placeholder")!
            presenter?.loadDetail(with: viewModel.id)
        }
    }
    
    @IBAction func didClickOnBackButton(_ sender: Any) {
        presenter?.backAction()
    }
}

extension DetailView: DetailViewProtocol {

    func reloadInterface(with detail: MovieDetailViewModel) {
        movieName.text = detail.title
    }
}
