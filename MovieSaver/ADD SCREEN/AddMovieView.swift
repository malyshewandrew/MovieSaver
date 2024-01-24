import PhotosUI
import UIKit

final class DefaultAddMovieView: UIViewController, UIImagePickerControllerDelegate {
    // MARK: - PROPERTIES:

    var viewModel: AddMovieViewModel!

    private let addImageView = UIImageView()
    private let addImageButton = UIButton()

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
        configureBindigs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(addImageView, addImageButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, textView)
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

        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.centerXAnchor.constraint(equalTo: addImageView.centerXAnchor).isActive = true
        addImageButton.centerYAnchor.constraint(equalTo: addImageView.centerYAnchor).isActive = true
        addImageButton.heightAnchor.constraint(equalTo: addImageView.heightAnchor, multiplier: 1).isActive = true
        addImageButton.widthAnchor.constraint(equalTo: addImageView.widthAnchor, multiplier: 1).isActive = true

        // MARK: NAME STACK VIEW:

        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 32).isActive = true
        nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        nameStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true

        // MARK: RATING STACK VIEW:

        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 32).isActive = true
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
        navigationItem.backButtonTitle = ""

        // MARK: IMAGE VIEW:

        addImageView.backgroundColor = .circleAddScreen
        addImageView.layer.masksToBounds = true
        addImageView.layer.cornerRadius = 75

        // MARK: SELECT IMAGE BUTTON:

        addImageButton.backgroundColor = .clear
        addImageButton.setImage(UIImage(named: "addImageMovieView"), for: .normal)
        addImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)

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
        nameChangeButton.addTarget(self, action: #selector(tapOnNameChangeButton), for: .touchUpInside)

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
        ratingChangeButton.addTarget(self, action: #selector(tapOnRatingChangeButton), for: .touchUpInside)

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
        releaseChangeButton.addTarget(self, action: #selector(tapOnReleaseChangeButton), for: .touchUpInside)

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
        youtubeChangeButton.addTarget(self, action: #selector(tapOnYoutubeChangeButton), for: .touchUpInside)

        // MARK: DESCRIPTION LABEL:

        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center

        // MARK: TEXT VIEW:

        textView.text = "Description"
    }
    
    // MARK: TRANSITIONS:
    @objc func tapOnNameChangeButton() {
        viewModel.transitionNameScreen()
    }
    
    @objc func tapOnRatingChangeButton() {
        viewModel.transitionRatingScreen()
    }
    
    @objc func tapOnReleaseChangeButton() {
        viewModel.transitionReleaseScreen()
    }
    
    @objc func tapOnYoutubeChangeButton() {
        viewModel.transitionYoutubeScreen()
    }
    
    // MARK: - CONFIGURE BINDINGS:

    private func configureBindigs() {
        viewModel.setupAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        
        viewModel.setupPHPicker = { [weak self] picker in
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        
        viewModel.setupUIImagePicker = { [weak self] imagePicker in
            imagePicker.delegate = self
            self?.present(imagePicker, animated: true, completion: nil)
        }
        
        viewModel.transitionNameScreenView = { [weak self] nameScreenView in
            self?.navigationController?.pushViewController(nameScreenView, animated: true)
            nameScreenView.viewModel.setNameCLosure = { [weak self] name in
                self?.nameLabel.text = name
            }
        }
        
        viewModel.transitionRatingScreenView = { [weak self] ratingScreenView in
            self?.navigationController?.pushViewController(ratingScreenView, animated: true)
        }
        
        viewModel.transitionReleaseScreenView = { [weak self] releaseScreenView in
            self?.navigationController?.pushViewController(releaseScreenView, animated: true)
        }
        
        viewModel.transitionYoutubeScreenView = { [weak self] youScreenView in
            self?.navigationController?.pushViewController(youScreenView, animated: true)
        }
    }
    
    // MARK: - ALERT BUTTON:

    @objc func tapOnAlertButton() {
        viewModel?.tapOnALertButton()
    }

    // MARK: OPEN GALERY:

    @objc func openGalery() {
        viewModel.openGalery()
    }

    // MARK: OPEN CAMERA:

    @objc func openCamera() {
        viewModel.openCamera()
    }
    
    private func setupImage(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.addImageView.image = image
                self.addImageButton.setImage(UIImage(), for: .normal)
            }
        }
    }
}


// MARK: - EXTENSION:

extension DefaultAddMovieView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                self.setupImage(image: image as? UIImage)
            }
        }
        dismiss(animated: true)
    }
}

extension DefaultAddMovieView: UINavigationControllerDelegate {}
