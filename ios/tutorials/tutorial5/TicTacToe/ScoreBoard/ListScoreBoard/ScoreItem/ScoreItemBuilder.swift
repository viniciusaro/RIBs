//
//  ScoreItemBuilder.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs

protocol ScoreItemDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ScoreItemComponent: Component<ScoreItemDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ScoreItemBuildable: ReusableBuilding where Router.Interactable.Content == Score {

}

final class ScoreItemBuilder: Builder<ScoreItemDependency>, ScoreItemBuildable {

    override init(dependency: ScoreItemDependency) {
        super.init(dependency: dependency)
    }

    func build(with listener: ScoreItemListener?) -> ScoreItemRouter<ScoreItemInteractor> {
        let component = ScoreItemComponent(dependency: dependency)
        let viewController = ScoreItemViewController()
        let interactor = ScoreItemInteractor(presenter: viewController)
        return ScoreItemRouter(interactor: interactor, viewController: viewController)
    }
}
