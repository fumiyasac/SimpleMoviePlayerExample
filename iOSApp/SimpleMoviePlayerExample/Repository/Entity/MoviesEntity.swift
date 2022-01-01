//
//  MoviesEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/06.
//

import Foundation

// MEMO: 解像度が異なる動画URLを格納するEntity

struct MoviesEntity: Decodable, Equatable {

    let low: String
    let medium: String
    let high: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case low
        case medium
        case high
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.low = try container.decode(String.self, forKey: .low)
        self.medium = try container.decode(String.self, forKey: .medium)
        self.high = try container.decode(String.self, forKey: .high)
    }

    init(
        low: String,
        medium: String,
        high: String
    ) {
        self.low = low
        self.medium = medium
        self.high = high
    }

    // MARK: - Equatable

    static func == (lhs: MoviesEntity, rhs: MoviesEntity) -> Bool {
        return lhs.low == rhs.low
            && lhs.medium == rhs.medium
            && lhs.high == rhs.high
    }
}
