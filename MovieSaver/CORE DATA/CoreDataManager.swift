import CoreData
import UIKit.UIApplication

enum CoreDataError: Error {
    case error(String)
}

final class CoreDataManager {
    static let instance = CoreDataManager()
    private init() {}

    // MARK: - SAVE MOVIE:

    func saveMovie(imageMovie: UIImage, nameMovie: String, ratingMovie: String, releaseDateMovie: String, youTubeLinkMovie: String, descriptionMovie: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)!

        let movie = NSManagedObject(entity: entity, insertInto: managedContext)

        if let imageData = imageMovie.pngData() {
            movie.setValue(imageData, forKey: "imageMovie")
        }

        movie.setValue(nameMovie, forKey: "nameMovie")
        movie.setValue(ratingMovie, forKey: "ratingMovie")
        movie.setValue(releaseDateMovie, forKey: "releaseDateMovie")
        movie.setValue(youTubeLinkMovie, forKey: "youTubeLinkMovie")
        movie.setValue(descriptionMovie, forKey: "descriptionMovie")

        do {
            try managedContext.save()
        } catch {
            return .failure(.error("Could not save. \(error)"))
        }

        return .success(())
    }

    // MARK: - GET MOVIES:

    func getMovies() -> Result<[Movie], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")

        do {
            let objects = try managedContext.fetch(fetchRequest)
            return .success(objects)
        } catch {
            return .failure(.error("Could not fetch \(error)"))
        }
    }
}
