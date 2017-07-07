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

public struct GenreViewModel {
    var id = 0
    var name = ""
}

public func <(lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
    return lhs.name.lowercased() < rhs.name.lowercased()
}

public func >(lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
    return lhs.name.lowercased() > rhs.name.lowercased()
}
