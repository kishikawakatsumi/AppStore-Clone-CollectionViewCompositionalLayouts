import UIKit

extension UIColor {
    static var systemBackground: UIColor {
        let lightColor = UIColor.white
        let darkColor = UIColor.black
        if #available(iOS 13.0, *) {
            return UIColor { $0.userInterfaceStyle == .light ? lightColor : darkColor }
        }
        return lightColor
    }
}
