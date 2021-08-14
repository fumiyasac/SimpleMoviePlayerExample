//
//  CarouselMainBannerDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation

final class CarouselMainBannerDto: Equatable {

    let mainBanners: [MainBannerEntity]

    // MARK: - Initializer

    init(
        mainBanners: [MainBannerEntity]
    ) {
        self.mainBanners = mainBanners
    }

    // MARK: - Equatable

    static func == (
        lhs: CarouselMainBannerDto,
        rhs: CarouselMainBannerDto
    ) -> Bool {
        return lhs.mainBanners == rhs.mainBanners
    }
}
