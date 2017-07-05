import Alamofire
import AlamofireObjectMapper

typealias MovieDetailCompletionHandler = (DataResponse<MovieDetail>) -> Void

class DetailDataManager: DetailDataManagerInputProtocol {
    
    var baseUrl : String!
    
    init() {
        self.baseUrl = APIConstants.baseUrlMovie
    }
    
    func retrieveMovieDetail(id: Int, completationHandler: @escaping MovieDetailCompletionHandler) {
        //        Alamofire.request("https://api.themoviedb.org/3/movie/297762?api_key=3a18f87c0a7a9134fa7e96eb58ef1622&language=en-US").responseJSON { response in
        //            print("Request: \(String(describing: response.request))")   // original url request
        //            print("Response: \(String(describing: response.response))") // http url response
        //            print("Result: \(response.result)")                         // response serialization result
        //
        //            if let json = response.result.value {
        //                print("JSON: \(json)") // serialized json response
        //            }
        //
        //            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        //                print("Data: \(utf8Text)") // original server data as UTF8 string
        //            }
        //        }
        Alamofire
            .request(URL(string: baseUrl + String(id))!,
                     method: .get,
                     parameters: ["api_key": APIConstants.key, "language": "en-US"])
            .responseObject { (response: DataResponse<MovieDetail>) in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")
                completationHandler(response)
        }
    }
}
