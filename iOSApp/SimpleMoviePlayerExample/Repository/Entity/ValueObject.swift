//
//  ValueObject.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/02.
//

import Foundation

// 参考: 値オブジェクトのCodable対応
// https://speakerdeck.com/maguhiro/zhi-obuziekutofalsecodabledui-ying

// MARK: - Protocol

protocol ValueObject: Codable, CustomStringConvertible, Equatable {

    associatedtype Value: Codable, CustomStringConvertible, Equatable

    var value: Value { get }
    
    init(value: Value)
}

// MARK: - ValueObject

extension ValueObject {

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Value.self)
        self.init(value: value)
    }

    // MARK: - Property

    var description: String {
        return value.description
    }

    // MARK: - Function

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}
