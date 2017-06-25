import ObjectMapper

class Movie: Mappable {

    var id: Int?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Int?
    var title = ""
    var popularity: Double?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["location"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        backdropPath <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }
}

public struct MovieViewModel {
    var title = ""
}

public func <(lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
    return lhs.title.lowercased() < rhs.title.lowercased()
}

public func >(lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
    return lhs.title.lowercased() > rhs.title.lowercased()
}
