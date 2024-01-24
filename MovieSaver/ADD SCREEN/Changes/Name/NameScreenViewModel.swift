import UIKit

protocol NameScreenView {
    func setName(string: String)
    var setNameCLosure: ((String) -> Void)? { get set }
}

final class NameScreenViewModel: NameScreenView {
    var setNameCLosure: ((String) -> Void)?
    
    func setName(string: String) {
        setNameCLosure?(string)
    }
}
