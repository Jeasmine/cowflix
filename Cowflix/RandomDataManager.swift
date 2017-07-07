import Alamofire
import AlamofireObjectMapper

typealias GenresCompletionHandler = (DataResponse<GenreResult>) -> Void

class RandomDataManager: RandomDataManagerInputProtocol {
    
    var baseMovieUrl : String!
    var baseTvShowUrl : String!
    
    init() {
        self.baseMovieUrl = APIConstants.baseUrlMovieGenre
        self.baseTvShowUrl = APIConstants.baseUrlTvShowGenre
    }
    
    func retrieveMovieGenres(completationHandler: @escaping GenresCompletionHandler) {
        Alamofire
            .request(URL(string: baseMovieUrl + "list")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US"])
            .responseObject { (response: DataResponse<GenreResult>) in
                completationHandler(response)
        }
    }
    
    func retrieveTvShowGenres(completationHandler: @escaping GenresCompletionHandler) {
        Alamofire
            .request(URL(string: baseTvShowUrl + "list")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US"])
            .responseObject { (response: DataResponse<GenreResult>) in
                completationHandler(response)
        }
    }
}
