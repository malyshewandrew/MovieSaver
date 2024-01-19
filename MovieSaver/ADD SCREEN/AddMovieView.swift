import PhotosUI
import UIKit

final class DefaultAddMovieView: UIViewController, UIImagePickerControllerDelegate {
    // MARK: - PROPERTIES:

    private let addImageView = UIImageView()
    private let openAlertButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(addImageView, openAlertButton)
    }

    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        addImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        addImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        openAlertButton.translatesAutoresizingMaskIntoConstraints = false
        openAlertButton.centerXAnchor.constraint(equalTo: addImageView.centerXAnchor).isActive = true
        openAlertButton.centerYAnchor.constraint(equalTo: addImageView.centerYAnchor).isActive = true
        openAlertButton.heightAnchor.constraint(equalTo: addImageView.heightAnchor, multiplier: 1).isActive = true
        openAlertButton.widthAnchor.constraint(equalTo: addImageView.widthAnchor, multiplier: 1).isActive = true
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
    }

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

    @objc func openGalery() {
        var configurator = PHPickerConfiguration(photoLibrary: .shared())
        configurator.filter = .images
        configurator.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configurator)
        picker.delegate = self
        present(picker, animated: true)
    }

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
