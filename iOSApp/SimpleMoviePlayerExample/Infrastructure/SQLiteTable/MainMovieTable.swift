//
//  MainMovieTable.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation
import GRDB

final class MainMovieTable: Record {

    var id: Int64?
    var mainMovieId: Int
    var category: String
    var authorName: String
    var dateString: String
    var thumbnailUrl: String
    var title: String
    var description: String

    // MARK: - Enum

    enum Columns {
        static let id = Column("id")
        static let mainMovieId = Column("mainMovieId")
        static let category = Column("category")
        static let authorName = Column("authorName")
        static let dateString = Column("dateString")
        static let thumbnailUrl = Column("thumbnailUrl")
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
        self.dateString = mainMovieEntity.dateString
        self.thumbnailUrl = mainMovieEntity.thumbnailUrl
        self.title = mainMovieEntity.title
        self.description = mainMovieEntity.description
        super.init()
    }

    init(
        mainMovieId: MainMovieId,
        category: String,
        authorName: String,
        dateString: String,
        thumbnailUrl: String,
        title: String,
        description: String
    ) {
        self.mainMovieId = mainMovieId.value
        self.category = category
        self.authorName = authorName
        self.dateString = dateString
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.description = description
        super.init()
    }

    required init(row: Row) {
        self.id = row["id"]
        self.mainMovieId = row["mainMovieId"]
        self.category = row["category"]
        self.authorName = row["authorName"]
        self.dateString = row["dateString"]
        self.thumbnailUrl = row["thumbnailUrl"]
        self.title = row["title"]
        self.description = row["description"]
        super.init(row: row)
    }

    // MARK: - Static Function

    static func create(_ db: Database) throws {
        try db.create(
            table: databaseTableName,
            body: { (t: TableDefinition) in
                t.column("id", .integer).primaryKey(onConflict: .replace, autoincrement: false)
                t.column("title", .text).notNull()
                t.column("body", .text).notNull()
            }
        )
    }

}
