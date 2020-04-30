import UIKit

extension UIAlertController {
    
    func add(actions: [UIAlertAction]) {
        for action in actions {
            addAction(action)
        }
    }
    
}
