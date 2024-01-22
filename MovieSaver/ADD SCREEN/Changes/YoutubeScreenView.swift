import UIKit

final class DefaultYoutubeScreenView: UIViewController {
    // MARK: - PROPERTIES:

    private let youtubeLinkLabel = UILabel()
    private let textField = UITextField()
    private let lineTextFieldLabel = UILabel()
    private let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }

    // MARK: - ADD SUBVIEWS:

    func addSubviews() {
        view.addSubviews(youtubeLinkLabel, textField, lineTextFieldLabel, saveButton)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    func configureConstraints() {
        // MARK: YOUTUBE LINK LABEL:

        youtubeLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeLinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        youtubeLinkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        youtubeLinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        youtubeLinkLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true

        // MARK: TEXT FIELD:

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: youtubeLinkLabel.bottomAnchor, constant: 42).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        // MARK: LINE TEXT FIELD:

        lineTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineTextFieldLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0).isActive = true
        lineTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineTextFieldLabel.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1).isActive = true

        // MARK: SAVE BUTTON:

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 42).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    // MARK: - CONFIGURE UI:

    func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundAddScreen

        // MARK: MOVIE NAME LABEL:

        youtubeLinkLabel.text = "YouTube Link"
        youtubeLinkLabel.textAlignment = .center

        // MARK: TEXT FIELD:

        textField.placeholder = "Name"
        
        // MARK: LINE TEXT FIELD:

        lineTextFieldLabel.backgroundColor = .systemGray4

        // MARK: SAVE BUTTON:

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
    }
}
