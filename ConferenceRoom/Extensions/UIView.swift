import UIKit

extension UIView {
    
    func hideBottomShadow() {
        shadowImageView(of: self)?.isHidden = true
    }
    
    func showBottomShadow() {
        shadowImageView(of: self)?.isHidden = false
    }
    
    func shadowImageView(of view: UIView) -> UIImageView? {
        if let view = view as? UIImageView, view.bounds.height <= 1.0 {
            return view
        }
        for subview in view.subviews {
            if let view = shadowImageView(of: subview) {
                return view
            }
        }
        return nil
    }
    
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}
