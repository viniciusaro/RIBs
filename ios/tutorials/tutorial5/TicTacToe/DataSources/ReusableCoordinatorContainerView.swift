import UIKit
import RIBs

protocol ReusableCoordinatorContainerView: AnyObject {

    var contentView: UIView { get }
    var router: Routing? { get set }
}

extension ReusableCoordinatorContainerView where Self: UITableViewCell {

    var contentView: UIView {

        return self.contentView
    }
}

extension ReusableCoordinatorContainerView where Self: UICollectionViewCell {

    var contentView: UIView {

        return self.contentView
    }
}

final class CollectionViewCellContainer: UICollectionViewCell, ReusableCoordinatorContainerView {

    var router: Routing?

    override func prepareForReuse() {
        
        super.prepareForReuse()
//        self.coordinator?.prepareForReuse()
    }
}

final class TableViewCellContainer: UITableViewCell, ReusableCoordinatorContainerView {

    var router: Routing?

    override func prepareForReuse() {

        super.prepareForReuse()
//        self.coordinator?.prepareForReuse()
    }
}
