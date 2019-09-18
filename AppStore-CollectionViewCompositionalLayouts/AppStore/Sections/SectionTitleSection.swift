import UIKit

struct SectionTitleSection: Section {
    let numberOfItems = 1
    private let showsNavigation: Bool

    init(showsNavigation: Bool = true) {
        self.showsNavigation = showsNavigation
    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SectionTitleCell.self), for: indexPath) as! SectionTitleCell
        cell.showsNavigationLabel = showsNavigation
        return cell
    }
}
