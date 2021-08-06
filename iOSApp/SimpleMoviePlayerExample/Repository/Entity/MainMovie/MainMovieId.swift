//
//  MainMovieId.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/06.
//

import Foundation

struct MainMovieId: ValueObject {

    let value: Int

    // MARK: - Initializer

    init(value: Int) {
        self.value = value
    }
}
