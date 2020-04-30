import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        register(UINib(nibName: "\(T.self)", bundle: nil), forCellWithReuseIdentifier: "\(T.self)")
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
    }
    
}

