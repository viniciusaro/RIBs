import UIKit

public extension UITableView {

    public func register<T: UITableViewCell>(_ cellClass: T.Type) {

        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {

        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}

public extension UICollectionView {

    public func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T : Reusable {

        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

    public func register<T: UICollectionViewCell>(_ cellClass: T.Type) {

        register(cellClass, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

public protocol Reusable {

    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UITableViewCell {

    public static var reuseIdentifier: String { return String(describing: self) }
}

public extension Reusable where Self: UICollectionReusableView {

    public static var reuseIdentifier: String { return String(describing: self) }
}

extension UITableViewCell: Reusable {}

extension UICollectionReusableView: Reusable {}
