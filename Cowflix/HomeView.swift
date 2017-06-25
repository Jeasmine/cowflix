import UIKit

class HomeView: UIViewController {
    
    var presenter: HomePresenterProtocol?
    var movieList: [MovieViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func onSearchClick(_ sender: UIBarButtonItem) {
        presenter?.search(from: self)
    }
}

extension HomeView: HomeViewProtocol {
    
    func reloadInterface(with movies: [MovieViewModel]) {
        movieList = movies
        print(movieList)
    }
}
