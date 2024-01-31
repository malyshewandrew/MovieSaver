import UIKit

final class DefaultNameScreenView: UIViewController {
    // MARK: - PROPERTIES:

    var viewModel: NameScreenViewModel!

    private let movieNameLabel = UILabel()
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

    private func addSubviews() {
        view.addSubviews(movieNameLabel, textField, lineTextFieldLabel, saveButton)
    }

    // MARK: - CONFIGURE CONSTRAINS:

    private func configureConstraints() {
        // MARK: MOVIE NAME LABEL:

        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true

        // MARK: TEXT FIELD:

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 42).isActive = true
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

    private func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundAddScreen

        // MARK: MOVIE NAME LABEL:

        movieNameLabel.text = "Film Name"
        movieNameLabel.textAlignment = .center

        // MARK: TEXT FIELD:

        textField.placeholder = "Name"

        // MARK: LINE TEXT FIELD:

        lineTextFieldLabel.backgroundColor = .systemGray4

        // MARK: SAVE BUTTON:

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(tapOnSave), for: .touchUpInside)
    }
    
    // MARK: - CONFIGURE BINDINGS:
    
    private func configureBingings() {
        viewModel.setNameClosure = { [weak self] name in
            self?.textField.text = name
        }
    }
    
    // MARK: - HELPERS:

    private func getText() -> String? {
        let text = self.textField.text
        return text
    }

    @objc func tapOnSave() {
        if let name = getText() {
            viewModel.setName(name: name)
            navigationController?.popViewController(animated: true)
        }
    }
}
