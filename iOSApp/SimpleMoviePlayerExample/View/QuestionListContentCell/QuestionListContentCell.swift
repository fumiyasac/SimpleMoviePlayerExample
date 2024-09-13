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

        let answerKeys = (
            lineSpacing: CGFloat(4.0),
            font: UIFont(name: "Avenir-Book", size: 12.0)!,
            foregroundColor: UIColor.darkGray
        )
        let answerAttributes = UILabelDecorator.getLabelAttributesBy(keys: answerKeys)
        answerLabel.attributedText = NSAttributedString(
            string: questionViewObject.answer,
            attributes: answerAttributes
        )
    }
}
