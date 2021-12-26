//
//  MovieQualityRepositorySpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/12/26.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class MovieQualityRepositorySpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テストに必要なMockの準備
        let movieQualityLocalStore = MovieQualityLocalStoreMock()

        let target = MovieQualityRepositoryImpl(
            movieQualityLocalStore: movieQualityLocalStore
        )

        // MEMO: このクラスにて実行したいテスト内容
        describe("MovieQualityRepositoryImpl") {

            // MARK: - findを実行した際のテスト

            describe("#find") {
                context("動画解像度が取得できる場合") {
                    let movieQuality = MovieQuality.high
                    beforeEach {
                        movieQualityLocalStore.given(
                            .get(
                                willReturn: Single.just(movieQuality)
                            )
                        )
                    }
                    it("指定したMovieQualityの値を返す") {
                        expect(try! target.find().toBlocking().first()).to(equal(MovieQuality.high))
                    }
                }
            }

            // MARK: - saveを実行した際のテスト

            describe("#save") {
                context("動画解像度が保存する場合") {
                    let movieQuality = MovieQuality.medium
                    beforeEach {
                        movieQualityLocalStore.given(
                            .set(
                                movieQuality: .value(movieQuality),
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.save(movieQuality: movieQuality).toBlocking().first()).to(beNil())
                    }
                }
            }
        }
    }
}
