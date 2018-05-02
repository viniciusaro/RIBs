import UIKit

protocol BindableTableViewDataSource: UITableViewDataSource {

    func bind(tableView: UITableView)
}

protocol BindableCollectionViewDataSource: UICollectionViewDataSource {

    func bind(collectionView: UICollectionView)
}
