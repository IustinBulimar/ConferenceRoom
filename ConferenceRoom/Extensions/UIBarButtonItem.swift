import UIKit

extension UIBarButtonItem {
    
    func hide() {
        isEnabled = false
        tintColor = UIColor.clear
    }
    
    func show() {
        isEnabled = true
        tintColor = nil
    }
    
}
