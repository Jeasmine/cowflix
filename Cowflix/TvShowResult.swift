import ObjectMapper

class TvShowResult: Mappable {
    
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    var data: [TvShow]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
        data <- map["results"]
    }
}
