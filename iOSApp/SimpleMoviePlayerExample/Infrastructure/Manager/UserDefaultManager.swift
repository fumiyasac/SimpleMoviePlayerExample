//
//  UserDefaultManager.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation
import SwiftyUserDefaults

// MEMO: ライブラリ「SwiftyUserDefaults」を利用する形
// 補足: Quick/Nimbleを用いたテストコードで書きやすい点やPropertyWrapperにも標準で対応している

extension DefaultsKeys {

    // MARK: - Property

    // MEMO: MainMovie再生位置
    var lastShownMainMoviePlayTime: DefaultsKey<[String: Float]> {
        .init("lastShownMainMoviePlayTime", defaultValue: [:])
    }

    // MEMO: FeaturedMovie再生位置
    var lastShownFeaturedMoviePlayTime: DefaultsKey<[String: Float]> {
        .init("lastShownFeaturedMoviePlayTime", defaultValue: [:])
    }

    // MEMO: ユーザーが選択中の画質
    var movieQuality: DefaultsKey<MovieQuality> {
        .init("movieQuality", defaultValue: MovieQuality.medium )
    }

    // MEMO: ユーザーが選択中の再生レート
    var movieSpeed: DefaultsKey<MovieSpeed> {
        .init("movieSpeed", defaultValue: MovieSpeed.speed100 )
    }
}

// MARK: - DefaultsSerializable
// → Xcode13.3以降では、既存のSwiftyUserDefaultではエラーが発生するので、ワークアラウンドを追加する
// 下記リンクから必要なものを見繕って追加すればOK
// https://github.com/sunshinejr/SwiftyUserDefaults/issues/285#issuecomment-1066897689

extension DefaultsSerializable {
    public static var _defaultsArray: DefaultsArrayBridge<[T]> { return DefaultsArrayBridge() }
}

extension DefaultsSerializable where Self: Codable {
    public static var _defaults: DefaultsCodableBridge<Self> { return DefaultsCodableBridge() }
    public static var _defaultsArray: DefaultsCodableBridge<[Self]> { return DefaultsCodableBridge() }
}

extension DefaultsSerializable where Self: RawRepresentable {
    public static var _defaults: DefaultsRawRepresentableBridge<Self> { return DefaultsRawRepresentableBridge() }
    public static var _defaultsArray: DefaultsRawRepresentableArrayBridge<[Self]> { return DefaultsRawRepresentableArrayBridge() }
}

extension DefaultsSerializable where Self: NSCoding {
    public static var _defaults: DefaultsKeyedArchiverBridge<Self> { return DefaultsKeyedArchiverBridge() }
    public static var _defaultsArray: DefaultsKeyedArchiverBridge<[Self]> { return DefaultsKeyedArchiverBridge() }
}
