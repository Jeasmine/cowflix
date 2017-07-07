import CoreData

class DetailLocalDataManager: DetailLocalDataManagerInputProtocol {
    
    func createFavorite(movie: MovieViewModel) throws -> Bool {
        guard let context = CoreDataPersistent.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        if let newFavorite = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: context) as? MovieEntity {
            newFavorite.apiId = Int32(movie.id)
            newFavorite.type = movie.type == .movie ? 0 : 1
            newFavorite.title = movie.title
            newFavorite.imagePath = movie.imagePath
            newFavorite.synopsis = movie.overview
            try context.save()
            return true
        }
        throw PersistenceError.couldNotCreateObject
    }
    
    func findFavorite(apiId: Int) throws -> Bool {
        guard let context = CoreDataPersistent.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let predicate = NSPredicate(format: "apiId == \(Int32(apiId))")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        request.predicate = predicate
        
        var result = false
        do {
            let entityList = try context.fetch(request)
            result = entityList.count > 0
        } catch {
        }
        return result
    }
}
