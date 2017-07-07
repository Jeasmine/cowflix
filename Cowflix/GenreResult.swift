import ObjectMapper

class GenreResult: Mappable {
    
    var genres: [IdName]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        genres <- map["genres"]
    }
}
