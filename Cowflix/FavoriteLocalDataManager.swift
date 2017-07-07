import UIKit
import CoreData

class FavoriteLocalDataManager: FavoriteLocalDataManagerInputProtocol {
    
    func retrieveFavoriteList() throws -> [MovieEntity] {
        guard let context = CoreDataPersistent.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let caseInsensitiveSelector = #selector(NSString.caseInsensitiveCompare(_:))
        let sortDescriptorFirstName = NSSortDescriptor(key: "title", ascending: true, selector: caseInsensitiveSelector)
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [sortDescriptorFirstName]
        
        return try context.fetch(request) as! [MovieEntity]
    }
}
