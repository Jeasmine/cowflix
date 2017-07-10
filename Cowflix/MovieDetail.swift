import ObjectMapper

class MovieDetail: Mappable {
    
    var adult = false
    var backdropPath = ""
    var belongsToCollection = ""
    var budge = 0
    var genres: [IdName] = []
    var homepage = ""
    var id = 0
    var imdbId = ""
    var originalLanguage = ""
    var originalTitle = ""
    var overview = ""
    var popularity = 0.0
    var posterPath = ""
    var productionCompanies: [IdName]?
    var productionCountries: [Countrie]?
    var releaseDate = ""
    var revenue = 0
    var runtime = 0
    var spokenLanguages: [Language]?
    var status = ""
    var tagline = ""
    var title = ""
    var video = false
    var voteAverage = 0.0
    var voteCount = 0

    init(){
    }
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        belongsToCollection <- map["belongs_to_collection"]
        budge <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdbId <- map["imdb_id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        productionCompanies <- map["production_companies"]
        productionCountries <- map["production_countries"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spokenLanguages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
}

public struct MovieDetailViewModel {
    var title = ""
    var genres = ""
}
