import ObjectMapper
import AlamofireImage

class TvShow: Mappable {
    
    var id = 0
    var originalName = ""
    var name = ""
    var voteCount = 0
    var voteAverage = 0
    var imagePath = ""
    var firstAirDate = ""
    var popularity = 0.0
    var genreIds: [Int]?
    var originalLanguage = ""
    var backdropPath = ""
    var overview = ""
    var originCountry: [String]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        originalName <- map["original_name"]
        name <- map["name"]
        voteCount <- map["vote_count"]
        voteAverage <- map["vote_average"]
        imagePath <- map["poster_path"]
        firstAirDate <- map["first_air_date"]
        popularity <- map["popularity"]
        genreIds <- map["genre_ids"]
        originalLanguage <- map["original_language"]
        backdropPath <- map["backdrop_path"]
        overview <- map["overview"]
        originCountry <- map["origin_country"]
    }
}
