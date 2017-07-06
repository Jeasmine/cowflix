import Alamofire
import AlamofireObjectMapper

typealias MovieSearchCompletionHandler = (DataResponse<MovieResult>) -> Void

class SearchDataManager: SearchDataManagerInputProtocol {
    
    var baseUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrlSearch
    }
    
    func retrieveSearchedMovies(query: String, completationHandler: @escaping MovieSearchCompletionHandler) {
        Alamofire
            .request(URL(string: baseUrl + "movie")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US",
                                  "query" : query, "page": 1, "include_adult": "false"])
            .responseObject { (response: DataResponse<MovieResult>) in
                completationHandler(response)
        }
    }
}

