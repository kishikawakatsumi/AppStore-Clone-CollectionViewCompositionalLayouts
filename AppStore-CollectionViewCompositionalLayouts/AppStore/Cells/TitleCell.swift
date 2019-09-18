import UIKit

final class TitleCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
