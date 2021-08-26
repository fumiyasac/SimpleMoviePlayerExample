//
//  GetQuestions.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/26.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetQuestionsUseCase {
    // 画面表示に必要なデータを返す
    func execute() -> Single<QuestionDto>
}

final class GetQuestionsUseCaseImpl: GetQuestionsUseCase {

    private let questionRepository: QuestionRepository

    // MARK: - Initializer

    init(
        questionRepository: QuestionRepository
    ) {
        self.questionRepository = questionRepository
    }

    // MARK: - GetQuestionsUseCase

    func execute() -> Single<QuestionDto> {
        return questionRepository.findAll().flatMap { questions in
            return Single.just(QuestionDto(questions: questions))
        }
    }
}
