//
//  QuestionListCell.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/26.
//

import UIKit

class QuestionListCell: UICollectionViewListCell {

    // MARK: - Property

    var question: String?
    var answer: String?

    // MARK: - Override
    
    override func updateConfiguration(using state: UICellConfigurationState) {

        var newConfiguration = QuestionListCellConfiguration().updated(for: state)
        newConfiguration.question = question
        newConfiguration.answer = answer
        contentConfiguration = newConfiguration
    }
}
