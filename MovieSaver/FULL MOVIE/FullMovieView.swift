import UIKit
import WebKit

final class DefaulFullMovieView: UIViewController {
    // MARK: - PROPERTIES:

    private let imageView = UIImageView()
    private let infoView = UIView()
    private let movieNameLabel = UILabel()
    private let ratingMovieLabel = UILabel()
    private let defaultRatingMovieLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let descriptionLabel = UILabel()
    private let youtubeWebView = WKWebView()
    private let starImageView = UIImageView()
    private let dateFormatter = DateFormatter()

    // MARK: - LIFECYCLE:

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(imageView, infoView)
        infoView.addSubviews(movieNameLabel, starImageView, ratingMovieLabel, defaultRatingMovieLabel, releaseDateLabel, descriptionTextView, youtubeWebView)
    }

    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // MARK: IMAGE VIEW:

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 296).isActive = true

        // MARK: INFO VIEW:

        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 257).isActive = true
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // MARK: MOVIE NAME LABEl:

        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 29).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -18).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true

        // MARK: STAR:

        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: RATING MOVIE LABEL:

        ratingMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingMovieLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        ratingMovieLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 8).isActive = true
        ratingMovieLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: DEFAULT RATING LABEL:

        defaultRatingMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultRatingMovieLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        defaultRatingMovieLabel.leadingAnchor.constraint(equalTo: ratingMovieLabel.trailingAnchor, constant: 0).isActive = true
        defaultRatingMovieLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: RELEASE DATE LABEL:

        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: defaultRatingMovieLabel.trailingAnchor, constant: 8).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // MARK: DESCRIPTION TEXT VIEW:

        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingMovieLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: youtubeWebView.topAnchor, constant: -24).isActive = true

        // MARK: WEB VIEW:

        youtubeWebView.translatesAutoresizingMaskIntoConstraints = false
        youtubeWebView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 18).isActive = true
        youtubeWebView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19).isActive = true
        youtubeWebView.heightAnchor.constraint(equalToConstant: 196).isActive = true
        youtubeWebView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -52).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundMainScreen

        // MARK: IMAGE VIEW:

        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill

        // MARK: INFO VIEW;

        infoView.backgroundColor = .backgroundAddScreen
        infoView.layer.cornerRadius = 16

        // MARK: MOVIE NAME LABEl:

        movieNameLabel.backgroundColor = .backgroundAddScreen
        movieNameLabel.font = UIFont(name: "manrope-regular", size: 18)
        movieNameLabel.numberOfLines = 0

        // MARK: STAR IMAGE:

        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .systemYellow

        // MARK: RATING MOVIE LABEL:

        ratingMovieLabel.backgroundColor = .backgroundAddScreen

        // MARK: DEFAULT RATING LABEL:

        defaultRatingMovieLabel.text = "/10"
        defaultRatingMovieLabel.textColor = .darkGray

        // MARK: RELEASE DATELABEL :

        releaseDateLabel.textColor = .lightGray

        // MARK: DESCRIPTION TEXT VIEW:

        descriptionTextView.backgroundColor = .backgroundAddScreen
        descriptionTextView.font = UIFont(name: "manrope-thin", size: 14)

        // MARK: WEB VIEW:

        youtubeWebView.backgroundColor = .backgroundAddScreen
    }

    // MARK: CONFIGURE FULL ENTITY:

    func configureFullEntity(movie: Movie) {
        if let imageData = movie.imageMovie, let movieImage = UIImage(data: imageData) {
            imageView.image = movieImage
        } else {
            imageView.image = UIImage(named: "default_image")
        }
        movieNameLabel.text = movie.nameMovie
        ratingMovieLabel.text = movie.ratingMovie

        dateFormatter.dateFormat = "dd.MM.yyyy"

        if let releaseDateString = movie.releaseDateMovie,
           let releaseDate = dateFormatter.date(from: releaseDateString)
        {
            dateFormatter.dateFormat = "yyyy"
            let formattedDate = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = formattedDate
        } else {
            releaseDateLabel.text = "No date"
        }

        descriptionTextView.text = movie.descriptionMovie
        
        if let url = URL(string: movie.youTubeLinkMovie ?? "") {
            youtubeWebView.load(URLRequest(url: url))
        }
    }
}
