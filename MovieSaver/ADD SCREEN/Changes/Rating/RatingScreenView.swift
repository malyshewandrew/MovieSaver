import UIKit

final class DefaultRatingScreenView: UIViewController {
    // MARK: - PROPERTIES:
    
    var viewModel: RatingScreenViewModel!

    private let yourRatingLabel = UILabel()
    private let pickerView = UIPickerView()
    private let saveButton = UIButton()
    
    private let ratings: [Float] = Array(stride(from: 0.0, through: 10.0, by: 0.1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(yourRatingLabel, pickerView, saveButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // MARK: YOUR RATING LABEL:
        
        yourRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        yourRatingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        yourRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        yourRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        yourRatingLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        // MARK: PICKER VIEW:
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: yourRatingLabel.bottomAnchor, constant: 32).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true
        
        // MARK: SAVE BUTTON:
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func configureUI() {
        // MARK: VIEW:
        
        view.backgroundColor = .backgroundAddScreen
        
        // MARK: YOUR RATING LABEL:

        yourRatingLabel.text = "Your Rating"
        yourRatingLabel.textColor = .colorLinks
        yourRatingLabel.textAlignment = .center

        // MARK: SAVE BUTTON:
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(tapOnSaveButton), for: .touchUpInside)
    }
    
    // MARK: - CONFIGURE BINDINGS:
    
    private func configureBindings() {
        viewModel.setRatingClosure = { [weak self] rating in
            self?.yourRatingLabel.text = rating
        }
    }
    
    // MARK: - HELPERS:

    private func getRating() -> String? {
        let row = pickerView.selectedRow(inComponent: 0)
        let rating = Double(row) / 10.0
        return String(rating)
    }
    
    @objc func tapOnSaveButton() {
        if let rating = getRating() {
            viewModel.setRating(rating: rating)
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: EXTENSION:

extension DefaultRatingScreenView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratings.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.1f", ratings[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = ratings[row]
        print("Selected value: \(selectedValue)")
    }
}
