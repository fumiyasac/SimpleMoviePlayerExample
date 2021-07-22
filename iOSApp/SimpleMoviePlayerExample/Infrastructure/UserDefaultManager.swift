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

    // MEMO: 初めてメイン画面を開いたか
    var isMainOpenFirstTime: DefaultsKey<Bool> {
        .init("isMainOpenFirstTime", defaultValue: false)
    }
}
