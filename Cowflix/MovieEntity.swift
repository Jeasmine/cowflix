import CoreData

@objc(Movie)
class MovieEntity: NSManagedObject {
    
    @NSManaged var apiId: Int32
    @NSManaged var type: Int16
    @NSManaged var title: String
    @NSManaged var imagePath: String
    @NSManaged var synopsis: String

}
