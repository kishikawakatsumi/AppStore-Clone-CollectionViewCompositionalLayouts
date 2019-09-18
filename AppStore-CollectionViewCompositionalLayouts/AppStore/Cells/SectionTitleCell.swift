import UIKit

final class SectionTitleCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var navigationLabel: UILabel!

    var showsNavigationLabel: Bool = true {
        didSet {
            navigationLabel.isHidden = !showsNavigationLabel
        }
    }
}
