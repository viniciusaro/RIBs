//
//  ListScoreBoardBuilder.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs

protocol ListScoreBoardDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var scoreStream: ScoreStream { get }
}

final class ListScoreBoardComponent: Component<ListScoreBoardDependency> {

    var scoreStream: ScoreStream {
        return dependency.scoreStream
    }
}

// MARK: - Builder

protocol ListScoreBoardBuildable: Buildable {
    func build(withListener listener: ListScoreBoardListener) -> ListScoreBoardRouting
}

final class ListScoreBoardBuilder<ItemRIB: ScoreItemBuildable>: Builder<ListScoreBoardDependency>,
ListScoreBoardBuildable where ItemRIB.Listener == ScoreItemListener {

    private let itemRIB: ItemRIB

    init(dependency: ListScoreBoardDependency, itemRIB: ItemRIB) {
        self.itemRIB = itemRIB
        super.init(dependency: dependency)
    }

    func build(withListener listener: ListScoreBoardListener) -> ListScoreBoardRouting {
        let component = ListScoreBoardComponent(dependency: dependency)
        let viewController = ListScoreBoardViewController()

        let dataSource = RIBCollectionViewDataSource(rib: self.itemRIB,
                                                     presentationContext: viewController.uiviewController)

        let interactor = ListScoreBoardInteractor(presenter: viewController,
                                                  dataSource: dataSource,
                                                  scoreStream: component.scoreStream)
        interactor.listener = listener
        dataSource.listener = interactor

        return ListScoreBoardRouter(interactor: interactor, viewController: viewController)
    }
}
