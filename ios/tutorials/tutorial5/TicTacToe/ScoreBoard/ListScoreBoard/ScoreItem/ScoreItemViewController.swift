//
//  ScoreItemViewController.swift
//  TicTacToe
//
//  Created by Vinicius Rodrigues on 5/1/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ScoreItemPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ScoreItemViewController: UIViewController, ScoreItemPresentable, ScoreItemViewControllable {

    weak var listener: ScoreItemPresentableListener?

    private let player1ScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .center
        return label
    }()

    private let player2ScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.player1ScoreLabel)
        stackView.addArrangedSubview(self.player2ScoreLabel)

        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func render(score: Score) {

        self.player1ScoreLabel.text = "\(score.player1Score)"
        self.player2ScoreLabel.text = "\(score.player2Score)"
    }
}
