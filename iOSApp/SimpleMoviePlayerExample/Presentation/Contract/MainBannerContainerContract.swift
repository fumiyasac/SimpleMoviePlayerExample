//
//  MainBannerContainerContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation

// sourcery: AutoMockable
protocol MainBannerContainerView: AnyObject {
    func setupCollectionView()
}

protocol MainBannerContainerPresenter: AnyObject {
    func viewWillAppearTrigger()
    func refreshTrigger()
}
