import UIKit

protocol MainViewModel {
    func loadMovies()
    var setupMovies: (([Movie]) -> Void)? { get set }
}

final class DefaultMainViewModel: MainViewModel {
    var setupMovies: (([Movie]) -> Void)?

    // MARK: - LOAD MOVIES:

    func loadMovies() {
        let operationResult = CoreDataManager.instance.getMovies()
        switch operationResult {
        case .success(let movies):
            setupMovies?(movies)
        case .failure(let failure):
            print(failure)
        }
    }
}
