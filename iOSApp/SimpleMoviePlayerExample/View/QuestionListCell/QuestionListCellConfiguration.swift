//
//  QuestionListCellConfiguration.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/26.
//

import Foundation
import UIKit

struct QuestionListCellConfiguration: UIContentConfiguration, Hashable {

    // MARK: - Property

    var question: String?
    var answer: String?

    // MARK: - Functions

    func makeContentView() -> UIView & UIContentView {
        return QuestionListContentView(configuration: self)
    }

    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
}
