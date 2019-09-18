import UIKit

final class SearchViewController: UIViewController {
    lazy var sections: [Section] = [
        TitleSection(title: "Trending"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
        LinkSection(title: "Search Result"),
    ]

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: String(describing: TitleCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TitleCell.self))
        collectionView.register(UINib(nibName: String(describing: LinkCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: LinkCell.self))

        return collectionView
    }()
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "App Store"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension SearchViewController: UICollectionViewDelegate {}
