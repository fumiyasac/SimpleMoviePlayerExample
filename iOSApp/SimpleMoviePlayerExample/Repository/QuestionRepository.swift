//
//  QuestionRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/22.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol QuestionRepository {
    // Q&A一覧を取得する
    func findAll() -> Single<[QuestionEntity]>
}

final class QuestionRepositoryImpl: QuestionRepository {

    private let backgroundScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        backgroundScheduler: ImmediateSchedulerType
    ) {
        self.backgroundScheduler = backgroundScheduler
    }

    // MARK: - QuestionRepository

    func findAll() -> Single<[QuestionEntity]> {
        guard let path = getJsonFilePath(jsonFileName: "question") else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let questionEntities = try JSONDecoder().decode([QuestionEntity].self, from: data)
            return Single.just(questionEntities)
                .subscribe(
                    on: backgroundScheduler
                )
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }

    // MARK: - Private Function

    // プロジェクト内にBundleされているStub用のJSONのファイルパスを取得する
    private func getJsonFilePath(jsonFileName: String) -> String? {
        return Bundle.main.path(forResource: jsonFileName, ofType: "json")
    }
}
