import UIKit

class MainViewCell: UITableViewCell {
    // MARK: - PROPERTIES:
    
    // MARK: - LIFECYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ADD SUBVIEWS:

    private func addSubviews() {
        
    }
    
    // MARK: CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        
    }
    
    private func configureUI() {
        
    }
}
