//
//  CarouselMainBannerUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol CarouselMainBannerUseCase {
    // 画面表示に必要なデータを返す
    func execute() -> Single<CarouselMainBannerDto>
}

final class CarouselMainBannerUseCaseImpl: CarouselMainBannerUseCase {

    private let mainBannerRepository: MainBannerRepository

    // MARK: - Initializer

    init(
        mainBannerRepository: MainBannerRepository
    ) {
        self.mainBannerRepository = mainBannerRepository
    }

    // MARK: - CarouselMainBannerUseCase

    func execute() -> Single<CarouselMainBannerDto> {
        return mainBannerRepository.findAll().flatMap { mainBanners in
            return Single.just(CarouselMainBannerDto(mainBanners: mainBanners))
        }
    }
}
