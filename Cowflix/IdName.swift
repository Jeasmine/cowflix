import ObjectMapper

class IdName: Mappable {
    
    var id = 0
    var name = ""
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
