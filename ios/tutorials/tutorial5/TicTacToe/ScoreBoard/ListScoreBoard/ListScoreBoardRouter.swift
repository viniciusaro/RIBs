//
//  ListScoreBoardRouter.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs

protocol ListScoreBoardInteractable: Interactable, ScoreItemListener {
    var router: ListScoreBoardRouting? { get set }
    var listener: ListScoreBoardListener? { get set }
}

protocol ListScoreBoardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ListScoreBoardRouter: ViewableRouter<ListScoreBoardInteractable, ListScoreBoardViewControllable>, ListScoreBoardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ListScoreBoardInteractable, viewController: ListScoreBoardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
