import UIKit

final class TodayViewController: UIViewController {
    lazy var sections: [Section] = [
        TodayTitleSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        TodayAppSection(),
        ButtonSection(title: "Redeem"),
        ButtonSection(title: "Send Gift"),
        ButtonSection(title: "Add Funds to Apple ID"),
        TermsAndConditionSection(),
    ]

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: String(describing: TodayTitleCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TodayTitleCell.self))
        collectionView.register(UINib(nibName: String(describing: TodayAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TodayAppCell.self))
        collectionView.register(UINib(nibName: String(describing: ButtonCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ButtonCell.self))
        collectionView.register(UINib(nibName: String(describing: TermsAndConditionsCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TermsAndConditionsCell.self))

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

extension TodayViewController: UICollectionViewDataSource {
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

extension TodayViewController: UICollectionViewDelegate {}
