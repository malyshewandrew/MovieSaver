import UIKit

final class DefaultReleaseScreenView: UIViewController {
    // MARK: - PROPERTIES:

    private let releaseDateLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(releaseDateLabel, datePicker, saveButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // MARK: RELEASE DATE LABEL:
        
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        // MARK: DATE PICKER:
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 32).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        // MARK: SAVE BUTTON:
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func configureUI() {
        // MARK: VIEW:
        
        view.backgroundColor = .backgroundAddScreen
        
        // MARK: YOUR RATING LABEL:

        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textColor = .black
        releaseDateLabel.textAlignment = .center
        
        // MARK: PICKER VIEW:
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .wheels

        // MARK: SAVE BUTTON:
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
    }
}

// MARK: EXTENSION:

