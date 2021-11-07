//
//  ApiClientMock.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/09.
//

import Foundation
import RxSwift

class ApiClientMock {

    // MARK: - Singleton Instance

    static let shared = ApiClientMock()

    private init() {}

    // MARK: - Enum

    enum FileName: String {
        case banners = "main_banner_stub"
        case news = "main_news_stub"
        case mainMovies = "main_movie_stub"
        case featuredMovies = "featured_movie_stub"
        case profile = "profile_me_stub"
        case profileActivity = "profile_activities_me_stub"
        case profileComments = "profile_comments_me_stub"
    }
}

// MARK: - ApiClient

extension ApiClientMock: ApiClient {

    // MARK: - Function

    func getMainBanners() -> Single<[MainBannerEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.banners.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let mainBannerEntities = try JSONDecoder().decode([MainBannerEntity].self, from: data)
            return Single.just(mainBannerEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getMainNews() -> Single<[MainNewsEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.news.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let mainBannerEntities = try JSONDecoder().decode([MainNewsEntity].self, from: data)
            return Single.just(mainBannerEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getMainMovies() -> Single<[MainMovieEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.mainMovies.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let mainMovieEntities = try JSONDecoder().decode([MainMovieEntity].self, from: data)
            return Single.just(mainMovieEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getFeaturedMovies() -> Single<[FeaturedMovieEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.featuredMovies.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let featuredMovieEntities = try JSONDecoder().decode([FeaturedMovieEntity].self, from: data)
            return Single.just(featuredMovieEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getMainMovie(movieId: Int) -> Single<MainMovieEntity> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.mainMovies.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let mainMovieEntities = try JSONDecoder().decode([MainMovieEntity].self, from: data)
            let mainMovieEntity = mainMovieEntities.first { (mainMovieEntities) -> Bool in
                mainMovieEntities.id.value == movieId
            }
            guard let mainMovieEntity = mainMovieEntity else {
                fatalError("引数のmovieIdに該当するEntityが存在しませんでした。")
            }
            return Single.just(mainMovieEntity)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }

    func getProfile() -> Single<ProfileEntity> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.profile.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let profileEntity = try JSONDecoder().decode(ProfileEntity.self, from: data)
            return Single.just(profileEntity)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getProfileActivities() -> Single<[ProfileActivityEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.profileActivity.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let profileActivityEntities = try JSONDecoder().decode([ProfileActivityEntity].self, from: data)
            return Single.just(profileActivityEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }
    
    func getProfileComments() -> Single<[ProfileCommentEntity]> {
        guard let path = getStubFilePath(jsonFileName: ApiClientMock.FileName.profileComments.rawValue) else {
            fatalError("該当ファイルが存在しませんでした。")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let profileCommentEntities = try JSONDecoder().decode([ProfileCommentEntity].self, from: data)
            return Single.just(profileCommentEntities)
        } catch {
            fatalError("JSONからのマッピングに失敗しました。")
        }
    }

    // MARK: - Private Function

    // プロジェクト内にBundleされているStub用のJSONのファイルパスを取得する
    private func getStubFilePath(jsonFileName: String) -> String? {
        return Bundle.main.path(forResource: jsonFileName, ofType: "json")
    }
}
