import UIKit

protocol MainViewModel {
    func loadMovies()
    func transitionAddNewMovie()
    var setupMovies: (([Movie]) -> Void)? { get set }
    var transition: ((DefaultAddMovieView) -> Void)? { get set }
}

final class DefaultMainViewModel: MainViewModel {
    var transition: ((DefaultAddMovieView) -> Void)?
    

    var setupMovies: (([Movie]) -> Void)?

    // MARK: LOAD MOVIES:

    func loadMovies() {
        let operationResult = CoreDataManager.instance.getMovies()
        switch operationResult {
        case .success(let movies):
            setupMovies?(movies)
        case .failure(let failure):
            print(failure)
        }
    }
    
    // MARK: TRANSITION ADD NEW MOVIE:
    func transitionAddNewMovie() {
        let addMovieView = DefaultAddMovieView()
        let addMoviewViewModel = DefaultAddMoviewViewModel()
        addMovieView.viewModel = addMoviewViewModel
        transition?(addMovieView)
    }
}
