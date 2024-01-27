import UIKit

protocol ReleaseScreenView {
    func setRelease(release: String)
    var setReleaseClosure: ((String) -> Void)? { get set }
}

final class ReleaseScreenViewModel: ReleaseScreenView {
    var setReleaseClosure: ((String) -> Void)?
    
    func setRelease(release: String) {
        setReleaseClosure?(release)
    }
}
