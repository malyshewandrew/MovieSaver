import UIKit

protocol YoutubeScreenView {
    func setYoutube(youtube: String)
    var setYoutubeClosure: ((String) -> Void)? { get set }
}

final class YoutubeScreenViewModel: YoutubeScreenView {
    var setYoutubeClosure: ((String) -> Void)?
    
    func setYoutube(youtube: String) {
        setYoutubeClosure?(youtube)
    }
}
