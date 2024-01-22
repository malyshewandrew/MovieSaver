import PhotosUI
import UIKit

final class DefaultAddMovieView: UIViewController, UIImagePickerControllerDelegate {
    // MARK: - PROPERTIES:

    private let addImageView = UIImageView()
    private let openAlertButton = UIButton()

    private let nameStackView = UIStackView()
    private let nameTitleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameChangeButton = UIButton()
    
    private let ratingStackView = UIStackView()
    private let ratingLabel = UILabel()
    private let ratingValueLabel = UILabel()
    private let ratingChangeButton = UIButton()
    
    private let releaseStackView = UIStackView()
    private let releaseLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let releaseChangeButton = UIButton()
    
    private let youtubeStackView = UIStackView()
    private let youtubeLabel = UILabel()
    private let youtubeLink = UILabel()
    private let youtubeChangeButton = UIButton()
    
    private let descriptionLabel = UILabel()
    private let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(addImageView, openAlertButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, textView)
        nameStackView.addArrangedSubviews(nameTitleLabel, nameLabel, nameChangeButton)
        ratingStackView.addArrangedSubviews(ratingLabel, ratingValueLabel, ratingChangeButton)
        releaseStackView.addArrangedSubviews(releaseLabel, releaseDateLabel, releaseChangeButton)
        youtubeStackView.addArrangedSubviews(youtubeLabel, youtubeLink, youtubeChangeButton)
    }

    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // MARK: ADD IMAGE:

        addImageView.translatesAutoresizingMaskIntoConstraints = false
        addImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        addImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        // MARK: OPEN ALERT:

        openAlertButton.translatesAutoresizingMaskIntoConstraints = false
        openAlertButton.centerXAnchor.constraint(equalTo: addImageView.centerXAnchor).isActive = true
        openAlertButton.centerYAnchor.constraint(equalTo: addImageView.centerYAnchor).isActive = true
        openAlertButton.heightAnchor.constraint(equalTo: addImageView.heightAnchor, multiplier: 1).isActive = true
        openAlertButton.widthAnchor.constraint(equalTo: addImageView.widthAnchor, multiplier: 1).isActive = true

        // MARK: NAME STACK VIEW:

        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.topAnchor.constraint(equalTo: openAlertButton.bottomAnchor, constant: 32).isActive = true
        nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        nameStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        // MARK: RATING STACK VIEW:

        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.topAnchor.constraint(equalTo: openAlertButton.bottomAnchor, constant: 32).isActive = true
        ratingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        ratingStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        ratingStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        // MARK: RELEASE STACK VIEW:

        releaseStackView.translatesAutoresizingMaskIntoConstraints = false
        releaseStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32).isActive = true
        releaseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        releaseStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        releaseStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        // MARK: YOUTUBE STACK VIEW:

        youtubeStackView.translatesAutoresizingMaskIntoConstraints = false
        youtubeStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 32).isActive = true
        youtubeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        youtubeStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        youtubeStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        // MARK: DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: releaseStackView.bottomAnchor, constant: 36).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        
        // MARK: TEXT VIEW:
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundAddScreen

        // MARK: TITLE:

        title = "Add new"

        // MARK: NAVIGATION CONTROLLER:

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)

        // MARK: IMAGE VIEW:

        addImageView.backgroundColor = .circleAddScreen
        addImageView.layer.masksToBounds = true
        addImageView.layer.cornerRadius = 75

        // MARK: SELECT IMAGE BUTTON:

        openAlertButton.backgroundColor = .clear
        openAlertButton.setImage(UIImage(named: "addImageMovieView"), for: .normal)
        openAlertButton.addTarget(self, action: #selector(tapOnALertButton), for: .touchUpInside)

        // MARK: NAME STACK VIEW:

        nameStackView.axis = .vertical
        nameStackView.alignment = .center

        // MARK: TITLE NAME LABEL:

        nameTitleLabel.text = "Name"
        nameTitleLabel.textColor = .black
        
        // MARK: NAME LABEL:

        nameLabel.text = "-"
        nameLabel.textColor = .black
        
        // MARK: NAME CHANGE BUTTON:

        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // MARK: RATING STACK VIEW:

        ratingStackView.axis = .vertical
        ratingStackView.alignment = .center
        
        // MARK: RATING LABEL:

        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .black
        
        // MARK: RATING VALUES:

        ratingValueLabel.text = "-"
        ratingValueLabel.textColor = .black
        
        // MARK: RATING CHANGE BUTTON:

        ratingChangeButton.setTitle("Change", for: .normal)
        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // MARK: RELEASE STACK VIEW:

        releaseStackView.axis = .vertical
        releaseStackView.alignment = .center
        
        // MARK: RELEASE LABEL:

        releaseLabel.text = "Release Date"
        releaseLabel.textColor = .black
        
        // MARK: RELEASE DATE LABEL:

        releaseDateLabel.text = "-"
        releaseDateLabel.textColor = .black
        
        // MARK: RELEASE CHANGE BUTTON:

        releaseChangeButton.setTitle("Change", for: .normal)
        releaseChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // MARK: YOUTUBE STACK VIEW:

        youtubeStackView.axis = .vertical
        youtubeStackView.alignment = .center
        
        // MARK: YOUTUBE LABEL:

        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .black
        
        // MARK: YOUTUBE LINK:

        youtubeLink.text = "-"
        youtubeLink.textColor = .black
        
        // MARK: YOUTUBE CHANGE BUTTON:

        youtubeChangeButton.setTitle("Change", for: .normal)
        youtubeChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        // MARK: DESCRIPTION LABEL:
        
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        
        // MARK: TEXT VIEW:
        textView.text = "Description"
    }

    // MARK: ALERT BUTOON:

    @objc func tapOnALertButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in

        }))
        present(alert, animated: true)
    }

    // MARK: OPEN GALERY:

    @objc func openGalery() {
        var configurator = PHPickerConfiguration(photoLibrary: .shared())
        configurator.filter = .images
        configurator.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configurator)
        picker.delegate = self
        present(picker, animated: true)
    }

    // MARK: OPEN CAMERA:

    @objc func openCamera() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Камера не доступна")
        }
    }
}

// MARK: EXTENSION:

extension DefaultAddMovieView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.addImageView.image = image
                        self.openAlertButton.setImage(UIImage(), for: .normal)
                    }
                }
            }
        }
        dismiss(animated: true)
    }
}

extension DefaultAddMovieView: UINavigationControllerDelegate {}
