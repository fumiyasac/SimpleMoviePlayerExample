//
//  QuestionDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation

final class QuestionDto: Equatable {

    let questions: [QuestionEntity]

    // MARK: - Initializer

    init(
        questions: [QuestionEntity]
    ) {
        self.questions = questions
    }

    // MARK: - Equatable

    static func == (
        lhs: QuestionDto,
        rhs: QuestionDto
    ) -> Bool {
        return lhs.questions == rhs.questions
    }
}
