//
//  ListScoreBoardViewController.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol ListScoreBoardPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ListScoreBoardViewController: UIViewController, ListScoreBoardPresentable, ListScoreBoardViewControllable {

    weak var listener: ListScoreBoardPresentableListener?

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: 60, height: 60)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()

    func updateWith(dataSource: BindableCollectionViewDataSource) {
        dataSource.bind(collectionView: self.collectionView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
