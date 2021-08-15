//
//  FavoriteMainMovieRepository.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/15.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol FavoriteMainMovieRepository {
    // SQLiteに登録されているお気に入りのMainMovie一覧を取得する
    func findAll() -> Single<[MainMovieTable]>

    // SQLiteへお気に入りのMainMovieデータを1件新規追加する
    func save(mainMovieEntity: MainMovieEntity) -> Completable

    // SQLiteからお気に入りのMainMovieデータを1件削除する
    func delete(mainMovieId: MainMovieId) -> Completable
}

final class FavoriteMainMovieRepositoryImpl: FavoriteMainMovieRepository {

    private let sqliteHelper: SQLiteHelper

    // MARK: - Initializer

    init(
        sqliteHelper: SQLiteHelper
    ) {
        self.sqliteHelper = sqliteHelper
    }

    // MARK: - FavoriteMainMovieRepository

    func findAll() -> Single<[MainMovieTable]> {
        var mainMovies: [MainMovieTable] = []
        let result = sqliteHelper.inDatabase { database in
            let _ = try MainMovieTable.fetchAll(database).map { mainMovies.append($0) }
        }
        if result {
            return Single.just(mainMovies)
        } else {
            return Single.error(MoviePlayerError.SqliteExecutionFailed)
        }
    }

    func save(mainMovieEntity: MainMovieEntity) -> Completable {
        return Completable.create { [weak self] completable in
            guard let weakSelf = self else {
                completable(.error(MoviePlayerError.notExistSelf))
                return Disposables.create()
            }
            let result = weakSelf.sqliteHelper.inDatabase { database in
                let mainMovie = MainMovieTable(mainMovieEntity: mainMovieEntity)
                try mainMovie.insert(database)
            }
            if result {
                completable(.completed)
            } else {
                completable(.error(MoviePlayerError.SqliteExecutionFailed))
            }
            return Disposables.create()
        }
    }

    func delete(mainMovieId: MainMovieId) -> Completable {
        return Completable.create { [weak self] completable in
            guard let weakSelf = self else {
                completable(.error(MoviePlayerError.notExistSelf))
                return Disposables.create()
            }
            let result = weakSelf.sqliteHelper.inDatabase { database in
                let mainMovie = try MainMovieTable
                    .filter(sql: "movie_id = ?", arguments: [mainMovieId.value])
                    .fetchOne(database)
                try mainMovie?.delete(database)
            }
            if result {
                completable(.completed)
            } else {
                completable(.error(MoviePlayerError.SqliteExecutionFailed))
            }
            return Disposables.create()
        }
    }
}
