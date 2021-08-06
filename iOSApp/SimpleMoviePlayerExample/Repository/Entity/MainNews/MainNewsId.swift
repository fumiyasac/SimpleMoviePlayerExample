//
//  MainNewsId.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/07.
//

import Foundation

struct MainNewsId: ValueObject {

    let value: Int

    // MARK: - Initializer

    init(value: Int) {
        self.value = value
    }
}
