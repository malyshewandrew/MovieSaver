import PhotosUI
import UIKit

protocol AddMovieViewModel {
    func tapOnALertButton()
    func openGalery()
    func openCamera()
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPHPicker: ((PHPickerViewController) -> Void)? { get set }
    var setupUIImagePicker: ((UIImagePickerController) -> Void)? { get set }
    var popTransition: (() -> Void)? { get set }
    
    func transitionNameScreen()
    func transitionRatingScreen()
    func transitionReleaseScreen()
    func transitionYoutubeScreen()
    
    var transitionNameScreenView: ((DefaultNameScreenView) -> Void)? { get set }
    var transitionRatingScreenView: ((DefaultRatingScreenView) -> Void)? { get set }
    var transitionReleaseScreenView: ((DefaultReleaseScreenView) -> Void)? { get set }
    var transitionYoutubeScreenView: ((DefaultYoutubeScreenView) -> Void)? { get set }
    
    func saveNewMovie(imageMovie: Data?, nameMovie: String?, ratingMovie: String?, releaseDateMovie: String?, youTubeLinkMovie: String?, descriptionMovie: String?)
    var saveNewMovieClosure: ((UIAlertController) -> Void)? { get set }
}

final class DefaultAddMoviewViewModel: AddMovieViewModel {
    var popTransition: (() -> Void)?
    
    var transitionRatingScreenView: ((DefaultRatingScreenView) -> Void)?
    
    var transitionReleaseScreenView: ((DefaultReleaseScreenView) -> Void)?
    
    var transitionYoutubeScreenView: ((DefaultYoutubeScreenView) -> Void)?
    
    var transitionNameScreenView: ((DefaultNameScreenView) -> Void)?
    
    func transitionNameScreen() {
        let nameScreenView = DefaultNameScreenView()
        let nameScreenViewModel = NameScreenViewModel()
        nameScreenView.viewModel = nameScreenViewModel
        transitionNameScreenView?(nameScreenView)
    }
    
    func transitionRatingScreen() {
        let ratingScreenView = DefaultRatingScreenView()
        let ratingScreenViewModel = RatingScreenViewModel()
        ratingScreenView.viewModel = ratingScreenViewModel
        transitionRatingScreenView?(ratingScreenView)
    }
    
    func transitionReleaseScreen() {
        let releaseScreenView = DefaultReleaseScreenView()
        let releaseScreenViewModel = ReleaseScreenViewModel()
        releaseScreenView.viewModel = releaseScreenViewModel
        transitionReleaseScreenView?(releaseScreenView)
    }
    
    func transitionYoutubeScreen() {
        let youtubeScreenView = DefaultYoutubeScreenView()
        let youtubeScreenViewModel = YoutubeScreenViewModel()
        youtubeScreenView.viewModel = youtubeScreenViewModel
        transitionYoutubeScreenView?(youtubeScreenView)
    }
    
    var setupUIImagePicker: ((UIImagePickerController) -> Void)?
    
    var setupPHPicker: ((PHPickerViewController) -> Void)?
    
    var setupAlert: ((UIAlertController) -> Void)?
    
    func tapOnALertButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galery", style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        }))
        setupAlert?(alert)
    }
    
    func openGalery() {
        var configurator = PHPickerConfiguration(photoLibrary: .shared())
        configurator.filter = .images
        configurator.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configurator)
        setupPHPicker?(picker)
    }
    
    func openCamera() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            print("Камера не доступна")
        }
        setupUIImagePicker?(imagePicker)
    }
    
    var saveNewMovieClosure: ((UIAlertController) -> Void)?
    
    func saveNewMovie(imageMovie: Data?, nameMovie: String?, ratingMovie: String?, releaseDateMovie: String?, youTubeLinkMovie: String?, descriptionMovie: String?) {
        guard let imageMovie = imageMovie, imageMovie.count > 0,
              let nameMovie = nameMovie, nameMovie != "-",
              let ratingMovie = ratingMovie, ratingMovie != "-",
              let releaseDateMovie = releaseDateMovie, releaseDateMovie != "-",
              let youTubeLinkMovie = youTubeLinkMovie, youTubeLinkMovie != "-",
              let descriptionMovie = descriptionMovie, descriptionMovie != ""
        else {
            let alertEmpty = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { _ in
            }))
            saveNewMovieClosure?(alertEmpty)
            return
        }
                
        let result = CoreDataManager.instance.saveMovie(imageMovie: imageMovie, nameMovie: nameMovie, ratingMovie: ratingMovie, releaseDateMovie: releaseDateMovie, youTubeLinkMovie: youTubeLinkMovie, descriptionMovie: descriptionMovie)
        
        switch result {
        case .success:
            print("Saved")
            let alertSuccess = UIAlertController(title: "Done", message: "The movie has been added", preferredStyle: .alert)
            alertSuccess.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.popTransition?()
            }))
            saveNewMovieClosure?(alertSuccess)
        case .failure(let failure):
            print(failure)
            let alertError = UIAlertController(title: "Error", message: "An error has occurred", preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { _ in
            }))
            saveNewMovieClosure?(alertError)
        }
    }
}
