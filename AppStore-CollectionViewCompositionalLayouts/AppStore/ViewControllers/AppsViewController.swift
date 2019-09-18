import UIKit

final class AppsViewController: UIViewController {
    lazy var sections: [Section] = [
        FeaturedAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        MediumAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        CategorySection(),
        SectionTitleSection(),
        MediumAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(),
        SmallAppSection(),
        SectionTitleSection(showsNavigation: false),
        LinkSection(title: "About In-App Purchases"),
        LinkSection(title: "Parens' Guide to the App Store"),
        LinkSection(title: "Apps and Games for Your Kids"),
        LinkSection(title: "About Personalization"),
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

        collectionView.register(UINib(nibName: String(describing: SmallAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SmallAppCell.self))
        collectionView.register(UINib(nibName: String(describing: MediumAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MediumAppCell.self))
        collectionView.register(UINib(nibName: String(describing: ExtraLargeAppCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ExtraLargeAppCell.self))
        collectionView.register(UINib(nibName: String(describing: CategoryCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CategoryCell.self))
        collectionView.register(UINib(nibName: String(describing: SectionTitleCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SectionTitleCell.self))
        collectionView.register(UINib(nibName: String(describing: LinkCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: LinkCell.self))
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }
}

extension AppsViewController: UICollectionViewDataSource {
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

extension AppsViewController: UICollectionViewDelegate {}
