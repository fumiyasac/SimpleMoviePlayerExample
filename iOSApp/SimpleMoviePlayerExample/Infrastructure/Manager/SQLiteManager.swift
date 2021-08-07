//
//  SQLiteManager.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation
import GRDB

// MARK: - Protocol

protocol SQLiteManagerProtocol {}

final class SQLiteManager: SQLiteManagerProtocol {

    // MARK: - Singleton Instance

    static let shared = SQLiteManager()

    // MARK: - Properies

    private let databaseQueue = DatabaseQueue()

    // MARK: - Function
}
