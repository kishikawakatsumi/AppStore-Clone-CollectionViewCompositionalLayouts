import UIKit

final class TodayAppCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
    }
}
