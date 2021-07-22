//
//  GlobalTabBarItems.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation

enum GlobalTabBarItems: CaseIterable {
    case main
    case favorite
    case settings

    // 配置するタイトルを取得する
    func getTabBarTitle() -> String {
        switch self {
        case .main:
            return "メイン"
        case .favorite:
            return "お気に入り"
        case .settings:
            return "設定"
        }
    }

    // 配置するSF Symbolsのアイコン名前を取得する
    func getTabBarSymbolName() -> String {
        switch self {
        case .main:
            return "house.fill"
        case .favorite:
            return "star.square.fill"
        case .settings:
            return "person.circle.fill"
        }
    }
}
