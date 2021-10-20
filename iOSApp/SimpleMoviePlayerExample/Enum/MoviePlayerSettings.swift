//
//  MoviePlayerSettings.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/21.
//

import Foundation
import SwiftyUserDefaults

// MEMO: 画質の定義
enum MovieQuality: Int, CaseIterable, DefaultsSerializable {
    case low
    case medium
    case high

    // MARK: - Function

    func getQualityText() -> String {
        switch self {
        case .low:
            return "低(540)"
        case .medium:
            return "中(720)"
        case .high:
            return "高(1080)"
        }
    }
}

// MEMO: 再生レートの定義
enum MovieSpeed: Float, CaseIterable, DefaultsSerializable {
    case speed050 = 0.5
    case speed075 = 0.75
    case speed100 = 1.0
    case speed125 = 1.25
    case speed150 = 1.5
    case speed175 = 1.75
    case speed200 = 2.0
}
