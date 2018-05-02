//
//  ListScoreBoardInteractor.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol ListScoreBoardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ListScoreBoardPresentable: Presentable {
    var listener: ListScoreBoardPresentableListener? { get set }
    func updateWith(dataSource: BindableCollectionViewDataSource)
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ListScoreBoardListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ListScoreBoardInteractor<ItemRIB: ScoreItemBuildable>: PresentableInteractor<ListScoreBoardPresentable>, ListScoreBoardInteractable, ListScoreBoardPresentableListener {

    weak var router: ListScoreBoardRouting?
    weak var listener: ListScoreBoardListener?

    private let scoreStream: ScoreStream
    private var dataSource: RIBCollectionViewDataSource<ItemRIB>
    private var scoreStore = ScoreStore()

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: ListScoreBoardPresentable,
         dataSource: RIBCollectionViewDataSource<ItemRIB>,
         scoreStream: ScoreStream) {
        self.scoreStream = scoreStream
        self.dataSource = dataSource
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        self.scoreStream.score
            .subscribe(onNext: { (score) in
                self.scoreStore.append(score: score)
                self.dataSource = self.dataSource.with(values: self.scoreStore.scores)
                self.presenter.updateWith(dataSource: self.dataSource)
            })
            .disposeOnDeactivate(interactor: self)
    }
}

private final class ScoreStore {
    static var scores: [Score] = []

    var scores: [Score] {
        return ScoreStore.scores
    }

    func append(score: Score) {
        ScoreStore.scores.append(score)
    }
}
