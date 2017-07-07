import Alamofire
import AlamofireObjectMapper

class RandomResultDataManager: RandomResultDataManagerInputProtocol {
    
    var baseUrl : String!
    var baseTvShowUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrlDiscover
    }
    
    func retrieveMovies(with genres: String, completationHandler: @escaping MovieSearchCompletionHandler) {
        Alamofire
            .request(URL(string: baseUrl + "movie")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US", "sort_by": "popularity.desc",
                                  "include_adult": "false", "include_video": "false", "page": 1, "with_genres": genres])
            .responseObject { (response: DataResponse<MovieResult>) in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")
                completationHandler(response)
        }
    }
    
    func retrieveTvShows(with genres: String, completationHandler: @escaping TvShowSearchCompletionHandler) {
        Alamofire
            .request(URL(string: baseUrl + "tv")!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US", "sort_by": "popularity.desc",
                                  "include_null_first_air_dates": "false", "page": 1, "with_genres": genres])
            .responseObject { (response: DataResponse<TvShowResult>) in
                completationHandler(response)
        }
    }
}
