//
//  MainBannerContainerPresenterImpl.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation
import RxSwift

final class MainBannerContainerPresenterImpl: MainBannerContainerPresenter {

    private let getCarouselMainBannersUseCase: GetCarouselMainBannersUseCase
    private let mainScheduler: ImmediateSchedulerType

    // MARK: - Initializer

    init(
        getCarouselMainBannersUseCase: GetCarouselMainBannersUseCase,
        mainScheduler: ImmediateSchedulerType
    ) {
        self.getCarouselMainBannersUseCase = getCarouselMainBannersUseCase
        self.mainScheduler = mainScheduler
    }

    // MARK: - Function

    func viewWillAppearTrigger() {}
    
    func refreshTrigger() {}
}
