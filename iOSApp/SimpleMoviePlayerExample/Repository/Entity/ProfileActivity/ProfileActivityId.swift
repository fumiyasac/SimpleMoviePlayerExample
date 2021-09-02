//
//  ProfileActivityId.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/02.
//

import Foundation

struct ProfileActivityId: ValueObject {

    let value: Int

    // MARK: - Initializer

    init(value: Int) {
        self.value = value
    }
}
