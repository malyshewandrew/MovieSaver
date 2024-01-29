import SafariServices
import UIKit
import WebKit

final class DefaultMainView: UIViewController {
    // MARK: - PROPERTIES:

    var viewModel: MainViewModel!
    private var tableView = UITableView()
    private let termsButton = UIButton()
    private let webButton = UIButton()
    private let privacyButton = UIButton()

    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - LIFECYCLE:

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableView()
        configureBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadMovies()
    }

    // MARK: - ADD SUBVIEWS:

    private func addSubviews() {
        view.addSubviews(tableView, termsButton, webButton, privacyButton)
    }

    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true

        // MARK: TERMS OF USE:

        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        termsButton.trailingAnchor.constraint(equalTo: webButton.leadingAnchor, constant: -10).isActive = true
        termsButton.heightAnchor.constraint(equalToConstant: 15).isActive = true

        // MARK: WEB:

        webButton.translatesAutoresizingMaskIntoConstraints = false
        webButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        webButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webButton.heightAnchor.constraint(equalToConstant: 15).isActive = true

        // MARK: PRIVACY:

        privacyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        privacyButton.leadingAnchor.constraint(equalTo: webButton.trailingAnchor, constant: 10).isActive = true
        privacyButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // MARK: VIEW:

        view.backgroundColor = .backgroundMainScreen

        // MARK: TITLE:

        title = "My Movie List"

        // MARK: NAVIGATION CONTROLLER:

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [weak self] _ in
            self?.transitionOnAddMovieView()
        }))
        navigationItem.backButtonTitle = ""

        // MARK: TABLE VIEW:

        tableView.backgroundColor = .backgroundMainScreen

        // MARK: TERMS OF USE:

        let attributedStringTerms = NSAttributedString(string: "TERMS OF USE", attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        termsButton.setAttributedTitle(attributedStringTerms, for: .normal)
        termsButton.setTitle("TERMS OF USE", for: .normal)
        termsButton.setTitleColor(.colorLinks, for: .normal)
        termsButton.titleLabel?.font = UIFont(name: "manrope-medium", size: 8)
        termsButton.addTarget(self, action: #selector(termsTapped), for: .touchUpInside)

        // MARK: WEB:

        let attributedStringWeb = NSAttributedString(string: "WEB SITE", attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        webButton.setAttributedTitle(attributedStringWeb, for: .normal)
        webButton.setTitleColor(.colorLinks, for: .normal)
        webButton.titleLabel?.font = UIFont(name: "manrope-medium", size: 8)
        webButton.addTarget(self, action: #selector(webTapped), for: .touchUpInside)

        // MARK: PRIVACY:

        let attributedStringPrivacy = NSAttributedString(string: "PRIVACY POLICY", attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        privacyButton.setAttributedTitle(attributedStringPrivacy, for: .normal)
        privacyButton.setTitleColor(.colorLinks, for: .normal)
        privacyButton.titleLabel?.font = UIFont(name: "manrope-medium", size: 8)
        privacyButton.addTarget(self, action: #selector(privacyTapped), for: .touchUpInside)
    }

    @objc func termsTapped() {
        guard let url = URL(string: "https://moviesaver.tilda.ws/termsofuse") else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }

    @objc func webTapped() {
        guard let url = URL(string: "http://moviesaver.tilda.ws/") else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }

    @objc func privacyTapped() {
        guard let url = URL(string: "https://moviesaver.tilda.ws/privacysecurity") else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        present(safariViewController, animated: true)
    }

    // MARK: - CONFIGURE TABLE VIEW:

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainViewCell.self, forCellReuseIdentifier: "MainViewCell")
        tableView.separatorStyle = .none
    }

    // MARK: - CONFIGURE BINDINGS:

    private func configureBindings() {
        viewModel.setupMovies = { [weak self] movie in
            self?.movies = movie
        }

        viewModel.transition = { [weak self] addMovieView in
            self?.navigationController?.pushViewController(addMovieView, animated: true)
        }
    }

    // MARK: TRANSITION ON ADD MOVIE VIEW:

    private func transitionOnAddMovieView() {
        viewModel.transitionAddNewMovie()
    }
}

// MARK: - EXTENSION FOR TABLE VIEW:

extension DefaultMainView: UITableViewDelegate, UITableViewDataSource {
    // MARK: COUNTS OF CELLS:

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    // MARK: CUSTOM CELL:

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell", for: indexPath) as? MainViewCell else { return UITableViewCell() }
        let movie = movies[indexPath.row]
        cell.configureEntity(movie: movie)
        return cell
    }

    // MARK: DELETE MOVIE:

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        if editingStyle == .delete {
            let alertDelete = UIAlertController(title: "Delete", message: "Delete this movie?", preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteMovie(movie)
                self.viewModel.loadMovies()
            }))
            present(alertDelete, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullMoview = DefaulFullMovieView()
        let movie = movies[indexPath.row]
        fullMoview.configureFullEntity(movie: movie)
        navigationController?.pushViewController(fullMoview, animated: true)
    }
}

// MARK: - EXTENSION. SAFARI VIEW CONTROLLER DELEGATE:

extension DefaultMainView: SFSafariViewControllerDelegate {
    func safariViewControllerWillOpenInBrowser(_ controller: SFSafariViewController) {
        print("Open in Safari app")
    }
}
