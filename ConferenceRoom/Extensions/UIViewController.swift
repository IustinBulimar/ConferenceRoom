import UIKit

extension UIViewController {
    
    func showAlert(title: String? = nil, message: String? = nil, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: completion)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func showLoader() {
        let superview = view!
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.tag = -9
        blurView.frame = CGRect(origin: .zero, size: CGSize(width: 70, height: 70))
        blurView.center = superview.center
        blurView.layer.cornerRadius = 10
        blurView.layer.masksToBounds = true
        
        if navigationController?.navigationBar.isTranslucent == true {
            blurView.center.y += navigationController?.navigationBar.frame.height ?? 0
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = CGPoint(x: blurView.frame.midX - blurView.frame.minX, y: blurView.frame.midY - blurView.frame.minY)
        activityIndicator.startAnimating()
        blurView.addSubview(activityIndicator)
        
        superview.addSubview(blurView)
    }
    
    func hideLoader() {
        for view in view.subviews {
            if view.tag == -9 {
                view.removeFromSuperview()
                return
            }
        }
    }
    
    class func storyboardInstance() -> Self {
        return genericStoryboardInstance()
    }
    
    private class func genericStoryboardInstance<T>() -> T {
        let storyboard = UIStoryboard(name: "\(T.self)", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! T
        return viewController
    }
    
    func embededInNavController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    
}
