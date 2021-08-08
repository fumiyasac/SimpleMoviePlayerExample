//
//  UserDefaultManager.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {

    // MARK: - Property

    // MEMO: 初めてアプリを開いたか
    var initialAppOpen: DefaultsKey<Bool> {
        .init("initialAppOpen", defaultValue: false)
    }

    // MEMO: MainMovie再生位置
    var lastShownMainMoviePlayTime: DefaultsKey<[String: Float]> {
        .init("lastShownMainMoviePlayTime", defaultValue: [:])
    }

    // MEMO: FeaturedMovie再生位置
    var lastShownFeaturedMoviePlayTime: DefaultsKey<[String: Float]> {
        .init("lastShownFeaturedMoviePlayTime", defaultValue: [:])
    }
}
