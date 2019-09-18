import UIKit

final class CategoryCell: UICollectionViewCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 20
    }
}
