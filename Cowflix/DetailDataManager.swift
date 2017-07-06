import Alamofire
import AlamofireObjectMapper

typealias MovieDetailCompletionHandler = (DataResponse<MovieDetail>) -> Void

class DetailDataManager: DetailDataManagerInputProtocol {
    
    var baseUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrlMovie
    }
    
    func retrieveMovieDetail(id: Int, completationHandler: @escaping MovieDetailCompletionHandler) {
        Alamofire
            .request(URL(string: baseUrl + String(id))!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US"])
            .responseObject { (response: DataResponse<MovieDetail>) in
                completationHandler(response)
        }
    }
}
