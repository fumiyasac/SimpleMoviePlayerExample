//
//  FavoriteCoodinator.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/09.
//

import Foundation

// sourcery: AutoMockable
protocol FavoriteCoodinator: ScreenCoordinator {
    // お気に入り一覧画面からメイン動画詳細画面を表示する
    func coordinateToMainMovieDetailPlayer(mainMovieId: MainMovieId)
}
