//
//  ScoreItemInteractor.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol ScoreItemRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ScoreItemPresentable: Presentable {
    var listener: ScoreItemPresentableListener? { get set }
    func render(score: Score)
}

protocol ScoreItemListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ScoreItemInteractor: PresentableInteractor<ScoreItemPresentable>, ScoreItemInteractable, ScoreItemPresentableListener {

    weak var router: ScoreItemRouting?
    weak var listener: ScoreItemListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ScoreItemPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

    func update(with content: Score) {

        self.presenter.render(score: content)
    }
}
