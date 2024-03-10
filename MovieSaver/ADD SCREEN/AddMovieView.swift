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
    private let youtubeLinkLabel = UILabel()
    private let youtubeChangeButton = UIButton()

    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    private var descriptionTextViewBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureBindigs()
        configureGestures()
        notificationCenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(addImageView, addImageButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, descriptionTextView)
        nameStackView.addArrangedSubviews(nameTitleLabel, nameLabel, nameChangeButton)
        ratingStackView.addArrangedSubviews(ratingLabel, ratingValueLabel, ratingChangeButton)
        releaseStackView.addArrangedSubviews(releaseLabel, releaseDateLabel, releaseChangeButton)
        youtubeStackView.addArrangedSubviews(youtubeLabel, youtubeLinkLabel, youtubeChangeButton)
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
        addImageButton.heightAnchor.constraint(equalTo: addImageView.heightAnchor, multiplier: 0.4).isActive = true
        addImageButton.widthAnchor.constraint(equalTo: addImageView.widthAnchor, multiplier: 0.4).isActive = true

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

        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundAddScreen

        // MARK: TITLE:

        title = "Add new film"

        // MARK: NAVIGATION CONTROLLER:

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            self?.saveMovie()
        }))
        navigationItem.backButtonTitle = ""

        // MARK: IMAGE VIEW:

        addImageView.backgroundColor = .circleAddScreen
        addImageView.layer.masksToBounds = true
        addImageView.layer.cornerRadius = 75
        addImageView.contentMode = .scaleAspectFill

        // MARK: SELECT IMAGE BUTTON:

        addImageButton.backgroundColor = .clear
        addImageButton.setImage(UIImage(named: "addImageMovieView"), for: .normal)
        addImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)

        // MARK: NAME STACK VIEW:

        nameStackView.axis = .vertical
        nameStackView.alignment = .center

        // MARK: TITLE NAME LABEL:

        nameTitleLabel.text = "Name"
        nameTitleLabel.textColor = .colorLinks

        // MARK: NAME LABEL:

        nameLabel.text = "-"
        nameLabel.textColor = .colorLinks
        nameLabel.font = UIFont(name: "manrope-bold", size: 18)

        // MARK: NAME CHANGE BUTTON:

        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        nameChangeButton.addTarget(self, action: #selector(tapOnNameChangeButton), for: .touchUpInside)

        // MARK: RATING STACK VIEW:

        ratingStackView.axis = .vertical
        ratingStackView.alignment = .center

        // MARK: RATING LABEL:

        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .colorLinks
        ratingLabel.font = UIFont(name: "manrope-regular", size: 18)

        // MARK: RATING VALUES:

        ratingValueLabel.text = "-"
        ratingValueLabel.textColor = .colorLinks
        ratingValueLabel.font = UIFont(name: "manrope-bold", size: 18)

        // MARK: RATING CHANGE BUTTON:

        ratingChangeButton.setTitle("Change", for: .normal)
        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
        ratingChangeButton.addTarget(self, action: #selector(tapOnRatingChangeButton), for: .touchUpInside)

        // MARK: RELEASE STACK VIEW:

        releaseStackView.axis = .vertical
        releaseStackView.alignment = .center

        // MARK: RELEASE LABEL:

        releaseLabel.text = "Release Date"
        releaseLabel.textColor = .colorLinks
        releaseLabel.font = UIFont(name: "manrope-regular", size: 18)

        // MARK: RELEASE DATE LABEL:

        releaseDateLabel.text = "-"
        releaseDateLabel.textColor = .colorLinks
        releaseDateLabel.font = UIFont(name: "manrope-bold", size: 18)

        // MARK: RELEASE CHANGE BUTTON:

        releaseChangeButton.setTitle("Change", for: .normal)
        releaseChangeButton.setTitleColor(.systemBlue, for: .normal)
        releaseChangeButton.addTarget(self, action: #selector(tapOnReleaseChangeButton), for: .touchUpInside)

        // MARK: YOUTUBE STACK VIEW:

        youtubeStackView.axis = .vertical
        youtubeStackView.alignment = .center

        // MARK: YOUTUBE LABEL:

        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .colorLinks
        youtubeLabel.font = UIFont(name: "manrope-regular", size: 18)

        // MARK: YOUTUBE LINK:

        youtubeLinkLabel.text = "-"
        youtubeLinkLabel.textColor = .colorLinks
        youtubeLinkLabel.font = UIFont(name: "manrope-bold", size: 18)

        // MARK: YOUTUBE CHANGE BUTTON:

        youtubeChangeButton.setTitle("Change", for: .normal)
        youtubeChangeButton.setTitleColor(.systemBlue, for: .normal)
        youtubeChangeButton.addTarget(self, action: #selector(tapOnYoutubeChangeButton), for: .touchUpInside)

        // MARK: DESCRIPTION LABEL:

        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "manrope-regular", size: 18)

        // MARK: TEXT VIEW:

        descriptionTextView.text = ""
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.font = UIFont(name: "manrope-light", size: 14)
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.masksToBounds = true
        descriptionTextView.layer.cornerRadius = 15
    }

    // MARK: - NOTIFICATION CENTER:

    private func notificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y = -keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardHide() {
        view.frame.origin.y = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - CONFIGURE GESTURES:

    private func configureGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: TAP ON FREE SPACE FOR CLOSE ALL VIEWS ACTION:

    @objc func tapGestureDone() {
        view.endEditing(true)
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
            nameScreenView.viewModel.setNameClosure = { [weak self] name in
                self?.nameLabel.text = name
            }
        }

        viewModel.transitionRatingScreenView = { [weak self] ratingScreenView in
            self?.navigationController?.pushViewController(ratingScreenView, animated: true)
            ratingScreenView.viewModel.setRatingClosure = { [weak self] rating in
                self?.ratingValueLabel.text = rating
            }
        }

        viewModel.transitionReleaseScreenView = { [weak self] releaseScreenView in
            self?.navigationController?.pushViewController(releaseScreenView, animated: true)
            releaseScreenView.viewModel.setReleaseClosure = { [weak self] release in
                self?.releaseDateLabel.text = release
            }
        }

        viewModel.transitionYoutubeScreenView = { [weak self] youScreenView in
            self?.navigationController?.pushViewController(youScreenView, animated: true)
            youScreenView.viewModel.setYoutubeClosure = { [weak self] youtube in
                self?.youtubeLinkLabel.text = youtube
            }
        }

        viewModel.saveNewMovieClosure = { [weak self] alert in
            self?.present(alert, animated: true)
            self?.viewModel.popTransition = { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
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

    private func setupImage(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.addImageView.image = image
                self.addImageButton.setImage(UIImage(), for: .normal)
            }
        }
    }

    // MARK: - SAVE NEW MOVIE:

    private func saveMovie() {
        guard let imageMovie = addImageView.image?.jpegData(compressionQuality: 1.0), let nameMovie = nameLabel.text, let ratingMovie = ratingValueLabel.text, let releaseDateMovie = releaseDateLabel.text, let youTubeLinkMovie = youtubeLinkLabel.text, let descriptionMovie = descriptionTextView.text else { return }

        viewModel.saveNewMovie(imageMovie: imageMovie, nameMovie: nameMovie, ratingMovie: ratingMovie, releaseDateMovie: releaseDateMovie, youTubeLinkMovie: youTubeLinkMovie, descriptionMovie: descriptionMovie)
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
