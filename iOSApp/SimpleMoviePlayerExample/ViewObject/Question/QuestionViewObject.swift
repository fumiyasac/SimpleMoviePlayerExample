//
//  QuestionViewObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/14.
//

import Foundation

final class QuestionViewObject: Hashable {

    let id: QuestionId
    let question: String
    let answer: String

    // MARK: - Initializer

    init(questionEntity: QuestionEntity) {
        id = questionEntity.id
        question = questionEntity.question
        answer = questionEntity.answer
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: QuestionViewObject, rhs: QuestionViewObject) -> Bool {
        return lhs.id == rhs.id
            && lhs.question == rhs.question
            && lhs.answer == rhs.answer
    }
}
