//
//  ApiClient.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/07.
//

import Foundation
import RxSwift

// MARK: - Protocol

protocol ApiClient {

    // 一覧画面で利用するAPIレスポンス
    func getMainBanners() -> Single<[MainBannerEntity]>
    func getMainNews() -> Single<[MainNewsEntity]>
    func getMainMovies() -> Single<[MainMovieEntity]>
    func getFeaturedMovies() -> Single<[FeaturedMovieEntity]>

    // 詳細画面で利用するAPIレスポンス
    func getMainMovie(movieId: Int) -> Single<MainMovieEntity>

    // プロフィール画面で利用するAPIレスポンス
    func getProfile() -> Single<ProfileEntity>
    func getProfileActivities() -> Single<[ProfileActivityEntity]>
    func getProfileComments() -> Single<[ProfileCommentEntity]>
}

// MARK: - ApiClient

extension ApiClientManager: ApiClient {

    func getMainBanners() -> Single<[MainBannerEntity]> {
        let endPointUrl = EndPoint.banners.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [MainBannerEntity].self
        )
    }

    func getMainNews() -> Single<[MainNewsEntity]> {
        let endPointUrl = EndPoint.news.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [MainNewsEntity].self
        )
    }

    func getMainMovies() -> Single<[MainMovieEntity]> {
        let endPointUrl = EndPoint.mainMovies.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [MainMovieEntity].self
        )
    }

    func getFeaturedMovies() -> Single<[FeaturedMovieEntity]> {
        let endPointUrl = EndPoint.featuredMovies.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [FeaturedMovieEntity].self
        )
    }

    func getMainMovie(movieId: Int) -> Single<MainMovieEntity> {
        let endPointUrl = EndPoint.mainMovies.getBaseUrl() + "/" + String(movieId)
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: MainMovieEntity.self
        )
    }

    func getProfile() -> Single<ProfileEntity> {
        let endPointUrl = EndPoint.profile.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: ProfileEntity.self
        )
    }

    func getProfileActivities() -> Single<[ProfileActivityEntity]> {
        let endPointUrl = EndPoint.profileActivity.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [ProfileActivityEntity].self
        )
    }

    func getProfileComments() -> Single<[ProfileCommentEntity]> {
        let endPointUrl = EndPoint.profileComments.getBaseUrl()
        return executeAPIRequest(
            endpointUrl: endPointUrl,
            httpMethod: HTTPMethod.GET,
            responseFormat: [ProfileCommentEntity].self
        )
    }
}
