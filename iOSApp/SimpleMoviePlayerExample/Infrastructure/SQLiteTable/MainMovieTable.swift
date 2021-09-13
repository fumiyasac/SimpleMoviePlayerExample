//
//  MainMovieTable.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation
import GRDB

// SQLiteのスキーマ定義: (main_movies)
// 参考1: 素のままのSQL発行やマイグレーションに関する処理
// https://qiita.com/Cyber_Hacnosuke/items/033da2b2e9cfbee7fff0
// https://medium.com/@gwendal.roue/how-to-build-an-ios-application-with-sqlite-and-grdb-swift-d023a06c29b3
// 参考2: 素のままのSQL発行やマイグレーションに関する処理
// https://www.letitride.jp/entry/2019/12/16/103415

final class MainMovieTable: Record {

    var id: Int64?
    var mainMovieId: Int
    var category: String
    var authorName: String
    var pubilshedDate: String
    var thumbnailUrl: String
    var title: String
    var description: String

    // MARK: - Enum

    enum Columns {
        static let id = Column("id")
        static let mainMovieId = Column("main_movie_id")
        static let category = Column("category")
        static let authorName = Column("author_name")
        static let pubilshedDate = Column("pubilshed_date")
        static let thumbnailUrl = Column("thumbnail_url")
        static let title = Column("title")
        static let description = Column("description")
    }

    // MARK: - Computed Property

    static override var databaseTableName: String {
        return "main_movies"
    }

    // MARK: - Initializer

    init(mainMovieEntity: MainMovieEntity) {
        self.mainMovieId = mainMovieEntity.id.value
        self.category = mainMovieEntity.category
        self.authorName = mainMovieEntity.authorName
        self.pubilshedDate = mainMovieEntity.pubilshedDate
        self.thumbnailUrl = mainMovieEntity.thumbnailUrl
        self.title = mainMovieEntity.title
        self.description = mainMovieEntity.description
        super.init()
    }

    init(
        mainMovieId: MainMovieId,
        category: String,
        authorName: String,
        pubilshedDate: String,
        thumbnailUrl: String,
        title: String,
        description: String
    ) {
        self.mainMovieId = mainMovieId.value
        self.category = category
        self.authorName = authorName
        self.pubilshedDate = pubilshedDate
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.description = description
        super.init()
    }

    required init(row: Row) {
        self.id = row["id"]
        self.mainMovieId = row["main_movie_id"]
        self.category = row["category"]
        self.authorName = row["author_name"]
        self.pubilshedDate = row["pubilshed_date"]
        self.thumbnailUrl = row["thumbnail_url"]
        self.title = row["title"]
        self.description = row["description"]
        super.init(row: row)
    }

    // MARK: - Static Function

    // テーブルを新規作成するための処理
    static func create(_ db: Database) throws {
        try db.create(
            table: databaseTableName,
            body: { (t: TableDefinition) in
                t.column("id", .integer).primaryKey(onConflict: .replace, autoincrement: false)
                t.column("main_movie_id", .integer).notNull()
                t.column("category", .text).notNull()
                t.column("author_name", .text).notNull()
                t.column("pubilshed_date", .text).notNull()
                t.column("thumbnail_url", .text).notNull()
                t.column("title", .text).notNull()
                t.column("description", .text).notNull()
            }
        )
    }
}
