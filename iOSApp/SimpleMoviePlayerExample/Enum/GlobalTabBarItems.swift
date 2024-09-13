//
//  GlobalTabBarItems.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation

// MEMO: SFSymbolsではUIEdgeInsetでTabBarItemに表示する画像位置が調整できなかった
// ➡️ ライブラリ「FontAwesome_swift」で代用する
// ➡️ 参考: https://stackoverflow.com/questions/58185158/how-to-center-a-sf-symbols-image-vertically-in-uitabbaritem

enum GlobalTabBarItems: CaseIterable {
    case main
    case favorite
    case settings

    // 配置するタイトルを取得する
    var title: String {
        switch self {
        case .main:
            return "メイン"
        case .favorite:
            return "お気に入り"
        case .settings:
            return "設定"
        }
    }

    // TabBarに使うFontAwesomeアイコン名を取得する
    var icon: FontAwesome {
        switch self {
        case .main:
            return .home
        case .favorite:
            return .heart
        case .settings:
            return .cog
        }
    }
}
