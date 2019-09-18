import UIKit

final class TodayTitleCell: UICollectionViewCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var dateLabel: UILabel!

    var date: String? {
        didSet {
            dateLabel.text = date
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 20
    }
}
