//
//  MainContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/25.
//

import Foundation

// sourcery: AutoMockable
protocol MainView: AnyObject {
    func applyAllViewObjectsToDataSource(
        mainBannerViewObjects: [MainBannerViewObject],
        mainNewsViewObject: [MainNewsViewObject],
        mainMovieViewObjects: [MainMovieViewObject],
        featuredMovieViewObjects: [FeaturedMovieViewObject]
    )
}

protocol MainPresenter: AnyObject {
    func setup(
         view: MainView,
         coodinator: MainCoodinator
     )
    func viewDidLoadTrigger()
    func refreshTrigger()
    func didTapMainMovieCell(mainMovieViewObject: MainMovieViewObject)
    func didTapFeaturedMovieCell(featuredMovieViewObject: FeaturedMovieViewObject)
}
