//
//  GetMainElementsUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/12.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetMainUseCase {
    func execute() -> Single<MainDto>
}

final class GetMainUseCaseImpl: GetMainUseCase {

    private let initialAppOpenRepository: InitialAppOpenRepository
    private let mainBannerRepository: MainBannerRepository
    private let mainNewsRepository: MainNewsRepository
    private let featuredMovieRepository: FeaturedMovieRepository
    private let mainMovieRepository: MainMovieRepository

    // MARK: - Initializer

    init(
        initialAppOpenRepository: InitialAppOpenRepository,
        mainBannerRepository: MainBannerRepository,
        mainNewsRepository: MainNewsRepository,
        featuredMovieRepository: FeaturedMovieRepository,
        mainMovieRepository: MainMovieRepository
    ) {
        self.initialAppOpenRepository = initialAppOpenRepository
        self.mainBannerRepository = mainBannerRepository
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
                weakSelf.mainBannerRepository.findAll(),
                weakSelf.mainNewsRepository.findAll(),
                weakSelf.featuredMovieRepository.findAll(),
                weakSelf.mainMovieRepository.findAll()
            ).map { apiResponses -> MainDto in
                // MEMO: APIレスポンス取得結果とUserDefaultの処理結果を組み合わせてMainDtoを作成する
                let (mainBanners, mainNews, featuredMovies, mainMovies) = apiResponses
                return MainDto(
                    shouldShowToolTip: shouldShowToolTip,
                    mainBanners: mainBanners,
                    mainNews: mainNews,
                    featuredMovies: featuredMovies,
                    mainMovies: mainMovies
                )
            }
        }
    }
}
