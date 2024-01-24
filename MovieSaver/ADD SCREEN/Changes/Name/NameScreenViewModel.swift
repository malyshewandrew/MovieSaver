import UIKit

protocol NameScreenView {
    func setName()
    var setNameCLosure: ((String) -> Void)? { get set }
}

final class NameScreenViewModel: NameScreenView {
    var setNameCLosure: ((String) -> Void)?
    
    func setName() {
        var name = ""
        setNameCLosure?(name)
    }
    
    
}
