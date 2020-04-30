import UIKit

extension UINavigationController {
    
    func setRoot(viewController: UIViewController) {
        setViewControllers([viewController], animated: false)
    }
   
    func set(navigationItem item: UINavigationItem) {
//        navigationBar.topItem?.title = item.title
        navigationBar.topItem?.rightBarButtonItems = item.rightBarButtonItems
        navigationBar.topItem?.leftBarButtonItems = item.leftBarButtonItems
    }

}
