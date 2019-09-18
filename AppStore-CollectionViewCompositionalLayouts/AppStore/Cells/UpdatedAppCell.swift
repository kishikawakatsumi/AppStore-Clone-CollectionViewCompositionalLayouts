import UIKit

final class UpdatedAppCell: UICollectionViewCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var purchaseButton: UIView!
    @IBOutlet private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 12
        purchaseButton.layer.cornerRadius = 15
    }
}
