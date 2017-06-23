import UIKit

class HomeView: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func onSearchClick(_ sender: UIBarButtonItem) {
        presenter?.search(from: self)
    }
}

extension HomeView: HomeViewProtocol {
}
