import UIKit

final class ExtraLargeAppCell: UICollectionViewCell {
    @IBOutlet private var captionLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var thumbnailView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 4
    }
}
