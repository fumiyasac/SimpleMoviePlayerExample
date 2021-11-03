//
//  GetCarouselMainBannersUseCase.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetCarouselMainBannersUseCase {
    func execute() -> Single<CarouselMainBannerDto>
}

final class GetCarouselMainBannersUseCaseImpl: GetCarouselMainBannersUseCase {

    private let mainBannerRepository: MainBannerRepository

    // MARK: - Initializer

    init(
        mainBannerRepository: MainBannerRepository
    ) {
        self.mainBannerRepository = mainBannerRepository
    }

    // MARK: - GetCarouselMainBannersUseCase

    func execute() -> Single<CarouselMainBannerDto> {
        return mainBannerRepository.findAll().flatMap { mainBanners in
            return Single.just(CarouselMainBannerDto(mainBanners: mainBanners))
        }
    }
}
