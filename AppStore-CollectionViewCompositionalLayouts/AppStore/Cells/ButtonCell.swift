import UIKit

final class ButtonCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var buttonView: UIView!

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        buttonView.layer.cornerRadius = 8
    }
}
