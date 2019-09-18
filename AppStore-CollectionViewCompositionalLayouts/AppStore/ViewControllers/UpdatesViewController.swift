import UIKit

final class UpdatesViewController: UIViewController {
    lazy var sections: [Section] = [
        TitleSection(title: "Updated Recently"),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
        UpdatedAppSection(),
    ]

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: String(describing: TitleCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TitleCell.self))
        collectionView.register(UINib(nibName: String(describing: UpdatedAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: UpdatedAppCell.self))

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

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension UpdatesViewController: UICollectionViewDataSource {
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

extension UpdatesViewController: UICollectionViewDelegate {}
