import UIKit

protocol NameScreenView {
    func setName(name: String)
    var setNameClosure: ((String) -> Void)? { get set }
}

final class NameScreenViewModel: NameScreenView {
    var setNameClosure: ((String) -> Void)?
    
    func setName(name: String) {
        setNameClosure?(name)
    }
}
