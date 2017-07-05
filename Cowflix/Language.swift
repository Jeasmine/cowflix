import ObjectMapper

class Language: Mappable {
    
    var iso = 0
    var name = ""
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        iso <- map["iso_639_1"]
        name <- map["name"]
    }
}
