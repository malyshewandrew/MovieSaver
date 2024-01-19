import UIKit

final class MainView: UIViewController {
    // MARK: - PROPERTIES:

    var viewModel: MainViewModel!
    private var tableView = UITableView()

    // MARK: - LIFECYCLE:

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainViewCell.self, forCellReuseIdentifier: "MainViewCell")
        tableView.separatorStyle = .none
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

        // MARK: - TITLE:

        title = "My Movie List"

        // MARK: NAVIGATION CONTROLLER:

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

        // MARK: TABLE VIEW:

        tableView.backgroundColor = .backgroundMainScreen
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell", for: indexPath) as? MainViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
