import Alamofire
import AlamofireObjectMapper

typealias MovieResultCompletionHandler = (DataResponse<MovieResult>) -> Void

class HomeDataManager: HomeDataManagerInputProtocol {
    
    var baseUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrlMovie
    }
    
    func retrieveNowPlayingMovies(completationHandler: @escaping MovieResultCompletionHandler) {
        Alamofire
            .request(URL(string: baseUrl + "now_playing")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US", "page": 1])
            .responseObject { (response: DataResponse<MovieResult>) in
                completationHandler(response)
        }
    }
}
