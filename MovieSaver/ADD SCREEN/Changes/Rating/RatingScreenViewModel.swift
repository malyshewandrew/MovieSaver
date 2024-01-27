import UIKit

protocol RatingScreenView {
    func setRating(rating: String)
    var setRatingClosure: ((String) -> Void)? { get set }
}

final class RatingScreenViewModel: RatingScreenView {
    var setRatingClosure: ((String) -> Void)?
    
    func setRating(rating: String) {
        setRatingClosure?(rating)
    }
}
