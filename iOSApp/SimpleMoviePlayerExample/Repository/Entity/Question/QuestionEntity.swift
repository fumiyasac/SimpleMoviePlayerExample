//
//  QuestionEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation

struct QuestionEntity: Hashable, Decodable {

    let id: QuestionId
    let question: String
    let answer: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case question
        case answer
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(QuestionId.self, forKey: .id)
        self.question = try container.decode(String.self, forKey: .question)
        self.answer = try container.decode(String.self, forKey: .answer)
    }

    init(
        id: Int,
        question: String,
        answer: String
    ) {
        self.id = QuestionId(value: id)
        self.question = question
        self.answer = answer
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: QuestionEntity, rhs: QuestionEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.question == rhs.question
            && lhs.answer == rhs.answer
    }
}
