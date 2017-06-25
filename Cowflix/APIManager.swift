import Alamofire
import AlamofireObjectMapper

class APIManager {
    
    static let sharedInstance = APIManager()
    
    var baseUrl : String!
    
    private init() {
        self.baseUrl = APIConstants.baseUrl
    }
}

