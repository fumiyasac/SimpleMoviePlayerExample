//
//  DependeciesContainer.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import Foundation

// MEMO: こちらのDI実装を元に改変を加えた形
// https://www.fabrizioduroni.it/2020/04/19/dependecy-injection-swift.html

final class DependeciesContainer {

    // MARK: - DIコンテナ自体はSingletonとして保持する

    static let shared = DependeciesContainer()

    private init() {}

    private var dependecies: [DependencyKey: Any] = [:]

    // MARK: - Function

    func register<T>(
        _ type: T.Type,
        impl: Any,
        name: String? = nil
    ) {
        let dependencyKey = DependencyKey(type: type, name: name)
        dependecies[dependencyKey] = impl
    }

    func resolve<T>(
        _ type: T.Type,
        name: String? = nil
    ) -> T {
        let dependencyKey = DependencyKey(type: type, name: name)
        if let dep = dependecies[dependencyKey] as? T {
            return dep
        } else {
            let protocolTypeName = NSString(string: "\(type)").components(separatedBy: ".").last!
            fatalError("\(protocolTypeName)の依存性を解決できませんでした。当該実装クラス:\(protocolTypeName).")
        }
    }
}

final class DependencyKey: Hashable, Equatable {

    // MARK: - Properties

    private let type: Any.Type
    private let name: String?

    // MARK: - Initializer

    init(type: Any.Type, name: String? = nil) {
        self.type = type
        self.name = name
    }

    // MARK: - Hashable, Equatable

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
    }

    static func == (lhs: DependencyKey, rhs: DependencyKey) -> Bool {
        return lhs.type == rhs.type && lhs.name == rhs.name
    }
}
