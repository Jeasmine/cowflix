import ObjectMapper
import AlamofireImage
import CoreData

@objc(Movie)
class Movie: NSManagedObject, Mappable {
    
    @NSManaged var apiId: Int16
    @NSManaged var type: Int16
    @NSManaged var title: String
    @NSManaged var imagePath: String?
    @NSManaged var synopsis: String?
    
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Int?
    var popularity: Double?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adult: Bool?
    var releaseDate: String?
    
    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    required init?(map: Map) {
        let ctx = CoreDataPersistent.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: ctx!)
        super.init(entity: entity!, insertInto: ctx)
        
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        apiId <- map["id"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        imagePath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        backdropPath <- map["backdrop_path"]
        adult <- map["adult"]
        synopsis <- map["overview"]
        releaseDate <- map["release_date"]
    }
}

public struct MovieViewModel {
    var id = 0
    var title = ""
    var imagePath = ""
    var image: Image? = nil
}

public func <(lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
    return lhs.title.lowercased() < rhs.title.lowercased()
}

public func >(lhs: MovieViewModel, rhs: MovieViewModel) -> Bool {
    return lhs.title.lowercased() > rhs.title.lowercased()
}
