import Alamofire
import AlamofireObjectMapper

typealias MovieResultCompletionHandler = (DataResponse<Result>) -> Void

class HomeDataManager: HomeDataManagerInputProtocol {
    
    var baseUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrl
    }

    func retrieveNowPlayingMovies(completationHandler: @escaping MovieResultCompletionHandler) {
        Alamofire.request(URL(string: baseUrl + "now_playing")!, method: .get,
                          parameters: ["api_key": APIConstants.key, "language": "en-US", "page": 1])
            .responseObject { (response: DataResponse<Result>) in completationHandler(response)
        }
    }
}
