//
//  QuestionListContentCell.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/31.
//

import UIKit

final class QuestionListContentCell: UITableViewCell {

    // MARK: - @IBOutlet

    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!
    @IBOutlet private weak var borderViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()

        borderViewHeightConstraint.constant = (1.0 / UIScreen.main.scale)
    }

    // MARK: - Functions

    func setCell(questionViewObject: QuestionViewObject) {
        questionLabel.text = questionViewObject.question
        answerLabel.text = questionViewObject.answer
    }
}
