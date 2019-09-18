import UIKit

final class MediumAppCell: UICollectionViewCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var purchaseButton: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 12
        purchaseButton.layer.cornerRadius = 15
    }
}
