//
//  MovieQualityLocalStoreSpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/10/19.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class MovieQualityLocalStoreSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        let target = MovieQualityLocalStoreImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("MovieQualityLocalStoreImpl") {
            
            // MARK: - getを実行した際のテスト

            describe("#get") {
                context("動画解像度が指定されている場合") {
                    beforeEach {
                        Defaults[\.movieQuality] = MovieQuality.high
                    }
                    it("MovieQuality.highを返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(MovieQuality.high))
                    }
                }
                context("動画解像度が指定されていない場合") {
                    it("MovieQuality.mediumを返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(MovieQuality.medium))
                    }
                }
            }

            // MARK: - setを実行した際のテスト

            describe("#set") {
                it("Completable & 値はMovieQuality.lowとなる") {
                    expect(try! target.set(movieQuality: MovieQuality.low).toBlocking().first()).to(beNil())
                    expect(Defaults[\.movieQuality]).to(equal(MovieQuality.low))
                }
            }
        }
    }
}
