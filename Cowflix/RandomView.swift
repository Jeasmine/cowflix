import UIKit
import Eureka

class RandomView: FormViewController {
    
    var presenter: RandomPresenterProtocol?
    var movieGenreList: [GenreViewModel]?
    var tvShowGenreList: [GenreViewModel]?
    
    @IBOutlet weak var categorySelection: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadMovieGenres()
    }
    
    @IBAction func onSearchClick(_ sender: UIBarButtonItem) {
        let section = form.allSections
        if (section.count > 0) {
            let selectableRows = (section[0] as! SelectableSection<ImageCheckRow<String>>).selectedRows()
            let values = selectableRows.map({ imageRow in
                return imageRow.value!
            })
            if (values.count > 0){
                presenter?.search(from: self, with: values, type: getSegmentType())
            } else {
                MessageBuilder.showWarningMessage(titleMessage: "Selection needed", bodyMessage: "You must select at least one")
            }
        }
    }
    
    @IBAction func onChangeCategory(_ sender: UISegmentedControl) {
        if (getSegmentType() == .movie) {
            if let genres = movieGenreList {
                loadRows(genres: genres)
            } else {
                presenter?.loadMovieGenres()
            }
        } else {
            if let genres = tvShowGenreList {
                loadRows(genres: genres)
            } else {
                presenter?.loadTvShowGenres()
            }
        }
    }
    
    func getSegmentType() -> MovieType {
        return categorySelection.selectedSegmentIndex == 0 ? MovieType.movie : MovieType.tvshow
    }
}

extension RandomView: RandomViewProtocol {
    
    func loadRows(genres: [GenreViewModel]) {
        let section = form.allSections
        if (section.count > 0) {
            section[0].removeAll()
        } else {
            form +++ SelectableSection<ImageCheckRow<String>>("Which of the following genres would you like to see?", selectionType: .multipleSelection)
        }
        
        for option in genres {
            form.last! <<< ImageCheckRow<String>(option.name) { lrow in
                lrow.title = option.name
                lrow.selectableValue = String(option.id)
                lrow.value = nil
            }
        }
    }
    
    func reloadMovieGenreInterface(with genres: [GenreViewModel]) {
        movieGenreList = genres
        loadRows(genres: genres)
    }
    
    func reloadTvShowGenreInterface(with genres: [GenreViewModel]) {
        tvShowGenreList = genres
        loadRows(genres: genres)
    }
}
