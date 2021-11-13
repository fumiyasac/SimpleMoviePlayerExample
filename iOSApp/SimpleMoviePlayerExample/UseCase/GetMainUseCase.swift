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

    private let mainBannerRepository: MainBannerRepository
    private let mainNewsRepository: MainNewsRepository
    private let featuredMovieRepository: FeaturedMovieRepository
    private let mainMovieRepository: MainMovieRepository

    // MARK: - Initializer

    init(
        mainBannerRepository: MainBannerRepository,
        mainNewsRepository: MainNewsRepository,
        featuredMovieRepository: FeaturedMovieRepository,
        mainMovieRepository: MainMovieRepository
    ) {
        self.mainBannerRepository = mainBannerRepository
        self.mainNewsRepository = mainNewsRepository
        self.featuredMovieRepository = featuredMovieRepository
        self.mainMovieRepository = mainMovieRepository
    }

    // MARK: - GetMainElementsUseCase

    func execute() -> Single<MainDto> {

        // MEMO: Single.zipを利用して他処理の実行を待ってから返したい型へ変換を試みる
        return Single.zip(
            mainBannerRepository.findAll(),
            mainNewsRepository.findAll(),
            featuredMovieRepository.findAll(),
            mainMovieRepository.findAll()
        ).map { apiResponses -> MainDto in
            // MEMO: APIレスポンス取得結果とUserDefaultの処理結果を組み合わせてMainDtoを作成する
            let (mainBanners, mainNews, featuredMovies, mainMovies) = apiResponses
            return MainDto(
                mainBanners: mainBanners,
                mainNews: mainNews,
                featuredMovies: featuredMovies,
                mainMovies: mainMovies
            )
        }
    }
}
