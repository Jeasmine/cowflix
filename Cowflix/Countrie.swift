import ObjectMapper

class Countrie: Mappable {
    
    var iso = 0
    var name = ""
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        iso <- map["iso_3166_1"]
        name <- map["name"]
    }
}
