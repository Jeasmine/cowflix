import UIKit
import CoreData

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotCreateObject
    case objectNotFound
}

class CoreDataPersistent {
    
    static var managedObjectContext: NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}

class MovieListLocalDataManager: FavoriteDataManagerInputProtocol {
    
    func createFavorite(movie: Movie) throws -> Bool {
        guard let context = CoreDataPersistent.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        if let newFavorite = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: context) as? Movie {
            newFavorite.apiId = movie.apiId
            newFavorite.backdropPath = movie.backdropPath
            newFavorite.imagePath = movie.imagePath
            newFavorite.synopsis = movie.synopsis
            try context.save()
            return true
        }
        throw PersistenceError.couldNotCreateObject
    }
    
    func retrieveFavoriteList() throws -> [Movie] {
        guard let context = CoreDataPersistent.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let caseInsensitiveSelector = #selector(NSString.caseInsensitiveCompare(_:))
        let sortDescriptorFirstName = NSSortDescriptor(key: "title", ascending: true, selector: caseInsensitiveSelector)
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [sortDescriptorFirstName]
        
        return try context.fetch(request) as! [Movie]
    }
}
