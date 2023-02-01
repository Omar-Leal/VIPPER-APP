//

import UIKit

class ListOfMoviewView: UIViewController {
    
    private var moviesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 120
        table.rowHeight = UITableView.automaticDimension
        table.register(MovieCellView.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
   //MARK: Presenter reference
    var presenterReference: ListOfMoviePresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Loading and calling the presente
        presenterReference?.onViewAppear()
        
        // The present give us back a result
        
    }
    
    private func setUpTableView() {
        view.addSubview(moviesTableView)
        
        let tables = [
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ]
        
        NSLayoutConstraint.activate(tables)
        moviesTableView.dataSource = self // ListOfMoviewViews it's the source itself
    }
}

extension ListOfMoviewView: BindingViewDelegator {
    func update(allMovies: [PopularMovieEntity]) {
        print("Data results => \(allMovies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}


extension ListOfMoviewView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenterReference!.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellView
        cell.backgroundColor = .darkGray
        let modelDataToCell = presenterReference!.models[indexPath.row]
        cell.configure(model: modelDataToCell)
        
        return cell
    }
    
    
}
