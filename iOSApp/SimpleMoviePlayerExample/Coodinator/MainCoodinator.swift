//
//  MainCoodinator.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/05.
//

import Foundation

// sourcery: AutoMockable
protocol MainCoodinator: ScreenCoordinator {
    // メイン一覧画面からメイン動画詳細画面を表示する
    func coordinateToMainMovieDetailPlayer(mainMovieId: MainMovieId)
    // メイン一覧画面から特集動画詳細画面を表示する
    func coordinateToFeaturedDetailPlayer()
}
