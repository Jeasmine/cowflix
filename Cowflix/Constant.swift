
struct APIConstants {
    
    static let key = "3a18f87c0a7a9134fa7e96eb58ef1622"
    static let baseUrl = "https://api.themoviedb.org/3/"
    
    static let baseUrlMovie = "\(baseUrl)movie/"
    static let baseUrlGenre = "\(baseUrl)genre/"
    static let baseUrlMovieGenre = "\(baseUrlGenre)movie/"
    static let baseUrlTvShowGenre = "\(baseUrlGenre)tv/"
    static let baseUrlSearch = "\(baseUrl)search/"
    static let baseUrlDiscover = "\(baseUrl)discover/"
    
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w600/"
}

enum MovieType {
    case movie
    case tvshow
}

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotCreateObject
    case objectNotFound
}
