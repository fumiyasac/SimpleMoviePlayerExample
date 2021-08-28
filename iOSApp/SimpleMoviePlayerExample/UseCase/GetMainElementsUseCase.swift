//
//  GetMainElementsUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetMainElementsUseCase {
    func execute() -> Single<MainDto>
}

final class GetMainElementsUseCaseImpl: GetMainElementsUseCase {

    private let initialAppOpenRepository: InitialAppOpenRepository
    private let mainNewsRepository: MainNewsRepository
    private let featuredMovieRepository: FeaturedMovieRepository
    private let mainMovieRepository: MainMovieRepository

    // MARK: - Initializer

    init(
        initialAppOpenRepository: InitialAppOpenRepository,
        mainNewsRepository: MainNewsRepository,
        featuredMovieRepository: FeaturedMovieRepository,
        mainMovieRepository: MainMovieRepository
    ) {
        self.initialAppOpenRepository = initialAppOpenRepository
        self.mainNewsRepository = mainNewsRepository
        self.featuredMovieRepository = featuredMovieRepository
        self.mainMovieRepository = mainMovieRepository
    }

    // MARK: - GetMainElementsUseCase

    func execute() -> Single<MainDto> {

        // MEMO: 任意の値取得処理を実行してflatMapを利用して返したい型へ変換する
        return initialAppOpenRepository.get().flatMap { [weak self] shouldShowToolTip in
            guard let weakSelf = self else {
                return Single.error(MoviePlayerError.notExistSelf)
            }
            // MEMO: Single.zipを利用して他処理の実行を待ってから返したい型へ変換を試みる
            return Single.zip(
                weakSelf.mainNewsRepository.findAll(),
                weakSelf.featuredMovieRepository.findAll(),
                weakSelf.mainMovieRepository.findAll()
            ).map { apiResponses -> MainDto in
                // MEMO: APIレスポンス取得結果とUserDefaultの処理結果を組み合わせてMainDtoを作成する
                let (mainNews, featuredMovies, mainMovies) = apiResponses
                return MainDto(
                    shouldShowToolTip: shouldShowToolTip,
                    mainNews: mainNews,
                    featuredMovies: featuredMovies,
                    mainMovies: mainMovies
                )
            }
        }
    }
}
