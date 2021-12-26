//
//  MovieSpeedRepositorySpec.swift
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

final class MovieSpeedRepositorySpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        // MEMO: テストに必要なMockの準備
        let movieSpeedLocalStore = MovieSpeedLocalStoreMock()

        let target = MovieSpeedRepositoryImpl(
            movieSpeedLocalStore: movieSpeedLocalStore
        )

        // MEMO: このクラスにて実行したいテスト内容
        describe("MovieSpeedRepositoryImpl") {

            // MARK: - findを実行した際のテスト

            describe("#find") {
                context("動画速度が取得できる場合") {
                    let movieSpeed = MovieSpeed.speed100
                    beforeEach {
                        movieSpeedLocalStore.given(
                            .get(
                                willReturn: Single.just(movieSpeed)
                            )
                        )
                    }
                    it("指定したMovieSpeedの値を返す") {
                        expect(try! target.find().toBlocking().first()).to(equal(MovieSpeed.speed100))
                    }
                }
            }

            // MARK: - saveを実行した際のテスト

            describe("#save") {
                context("動画解像度が保存する場合") {
                    let movieSpeed = MovieSpeed.speed200
                    beforeEach {
                        movieSpeedLocalStore.given(
                            .set(
                                movieSpeed: .value(movieSpeed),
                                willReturn: Completable.empty()
                            )
                        )
                    }
                    it("Completableを返す") {
                        expect(try! target.save(movieSpeed: movieSpeed).toBlocking().first()).to(beNil())
                    }
                }
            }
        }
    }
}
