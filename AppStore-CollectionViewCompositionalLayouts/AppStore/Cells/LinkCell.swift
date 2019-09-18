import UIKit

final class LinkCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
