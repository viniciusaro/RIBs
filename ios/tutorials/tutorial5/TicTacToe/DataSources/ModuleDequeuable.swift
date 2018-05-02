import UIKit

protocol RIBDequeable {

    associatedtype RIBCell: ReusableCoordinatorContainerView
    func dequeueReusableModuleCell(for indexPath: IndexPath) -> RIBCell
}

extension UICollectionView: RIBDequeable {

    func dequeueReusableModuleCell(for indexPath: IndexPath) -> CollectionViewCellContainer {

        return self.dequeueReusableCell(for: indexPath)
    }
}

extension UITableView: RIBDequeable {

    func dequeueReusableModuleCell(for indexPath: IndexPath) -> TableViewCellContainer {

        return self.dequeueReusableCell(for: indexPath)
    }
}
