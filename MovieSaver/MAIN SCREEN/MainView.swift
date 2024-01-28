import UIKit

final class DefaultMainView: UIViewController {
    // MARK: - PROPERTIES:

    var viewModel: MainViewModel!
    private var tableView = UITableView()
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
        view.addSubview(tableView)
    }

    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
    
    // MARK: DELETE CAR:
    
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
