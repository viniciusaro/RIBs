//
//  ScoreItemRouter.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs

protocol ScoreItemInteractable: ReusableInteractable {
    var router: ScoreItemRouting? { get set }
}

protocol ScoreItemViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ScoreItemRouter<Interactor: ScoreItemInteractable>: ViewableRouter<Interactor, ViewControllable>, ScoreItemRouting, ReusableRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: Interactor, viewController: ViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
