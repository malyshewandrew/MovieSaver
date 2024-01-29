import UIKit

final class MainViewCell: UITableViewCell {
    // MARK: - PROPERTIES:
    
    private let containerView = UIView()
    private let movieImage = UIImageView()
    private let infoView = UIView()
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let defaultRatingLabel = UILabel()
    
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
    
    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubviews(movieImage, infoView)
        infoView.addSubviews(nameLabel, ratingLabel, defaultRatingLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // MARK: CONTAINER VIEW:

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
        
        // MARK: MOVIE IMAGE:

        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        movieImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.57).isActive = true
        
        // MARK: INFO VIEW:

        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor).isActive = true
        
        // MARK: NAME LABEL:

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 34).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15).isActive = true
        
        // MARK: RATING LABEL:

        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: infoView.centerXAnchor, constant: 0).isActive = true
        
        // MARK: DEFAULT RATING LABEL:

        defaultRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultRatingLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50).isActive = true
        defaultRatingLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 3).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: CONTENT VIEW:

        contentView.backgroundColor = .backgroundMainScreen
        
        // MARK: CONTENTAINER VIEW:

        containerView.backgroundColor = .backgroundAddScreen
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowRadius = 16
        containerView.layer.shadowOpacity = 0.10
        
        // MARK: MOVIE IMAGE:
        
        // MARK: INFO VIEW:
        
        // MARK: NAME LABEL:

        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "manrope-regular", size: 24)
        nameLabel.textAlignment = .center
        
        // MARK: RATING LABEL:

        ratingLabel.font = UIFont(name: "manrope-semibold", size: 18)
        ratingLabel.textAlignment = .center
        
        // MARK: DEFAULT RATING LABEL:
        
        defaultRatingLabel.font = UIFont(name: "manrope-thin", size: 18)
        defaultRatingLabel.text = "/10"
    }
    
    // MARK: CONFIGURE ENTITY:

    func configureEntity(movie: Movie) {
        if let imageData = movie.imageMovie, let movieImage = UIImage(data: imageData) {
            self.movieImage.image = movieImage
        } else {
            movieImage.image = UIImage(named: "default_image")
        }
        nameLabel.text = movie.nameMovie
        ratingLabel.text = movie.ratingMovie
    }
}
