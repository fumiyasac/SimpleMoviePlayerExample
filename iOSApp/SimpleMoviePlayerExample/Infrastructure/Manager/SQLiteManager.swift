//
//  SQLiteManager.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/23.
//

import Foundation
import GRDB

// MEMO: ライブラリ「GRDB.swift」を利用する形
// https://github.com/groue/GRDB.swift

protocol SQLiteHelper {
    func inDatabase(_ block: (Database) throws -> Void) -> Bool
}

final class SQLiteManager: SQLiteHelper {

    // MARK: - Singleton Instance

    static let shared = SQLiteManager()

    // MARK: - Properies

    private let fileManager = FileManager.default
    private let databaseFileName = "database.sqlite"

    // MARK: - Initializer

    init() {
        createDatabase()
    }

    // MARK: - SQLiteHelper

    func inDatabase(_ block: (Database) throws -> Void) -> Bool {
        do {
            let databaseQueue = try DatabaseQueue(path: getDatabaseFilePath())
            try databaseQueue.inDatabase(block)
        } catch let error {
            print("[SQLite] DB操作に失敗しました: " + error.localizedDescription)
            return false
        }
        return true
    }

    // MARK: - Private Function

    // DB新規作成処理
    private func createDatabase() {
        if fileManager.fileExists(atPath: getDatabaseFilePath()) {
            return
        }
        let result = inDatabase { (database) in
            // MEMO: テーブルの新規作成処理
            try MainMovieTable.create(database)
        }
        if !result {
            removeDatabase()
        }
    }

    // DB削除処理
    private func removeDatabase() {
        do {
           try fileManager.removeItem(atPath: getDatabaseFilePath())
        } catch let error {
            print("[SQLite] DBファイル削除に失敗しました: " + error.localizedDescription)
        }
    }

    // DB格納先ファイルパス取得処理
    private func getDatabaseFilePath() -> String {
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].absoluteString
        // MEMO: "file://"の部分が不要だったので処理のタイミングでパス文字列取得時に削除しています
        return documentPath.replacingOccurrences(of: "file://", with: "") + databaseFileName
    }
}
