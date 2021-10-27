//
//  QuestionListContentView.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/26.
//

import UIKit

// MEMO: View要素に高さ制約を付与しているがこちらのPriorityを999にしています。

final class QuestionListContentView: UIView, UIContentView {

    // MARK: Property

    private var currentConfiguration: QuestionListCellConfiguration!

    // MARK: Computed Property

    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? QuestionListCellConfiguration else {
                return
            }
            applyConfiguration(configuration: newConfiguration)
        }
    }

    // MARK: - @IBOutlet

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!

    // MARK: - Initializer

    init(configuration: QuestionListCellConfiguration) {
        super.init(frame: .zero)

        initializeContentView()
        applyConfiguration(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Extension QuestionListContentView

private extension QuestionListContentView {

    // MARK: - Private Function

    private func initializeContentView() {

        Bundle.main.loadNibNamed("\(QuestionListContentView.self)", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
                contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
                contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
                contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0),
            ]
        )
    }

    private func applyConfiguration(configuration: QuestionListCellConfiguration) {

        // 現在設定されているConfigurationと異なる場合に更新を実施する
        if currentConfiguration != configuration {
            currentConfiguration = configuration

            // Configurationを経由して表示したい値を表示させる
            questionLabel.text = configuration.question
            answerLabel.text = configuration.answer

        } else {
            return
        }
    }
}
