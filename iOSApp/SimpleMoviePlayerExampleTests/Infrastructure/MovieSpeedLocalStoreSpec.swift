//
//  MovieSpeedLocalStoreSpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/10/20.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class MovieSpeedLocalStoreSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        let target = MovieSpeedLocalStoreImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("MovieSpeedLocalStoreImpl") {
            
            // MARK: - getを実行した際のテスト

            describe("#get") {
                context("動画速度が指定されている場合") {
                    beforeEach {
                        Defaults[\.movieSpeed] = MovieSpeed.speed150
                    }
                    it("MovieSpeed.speed150を返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(MovieSpeed.speed150))
                    }
                }
                context("動画速度が指定されていない場合") {
                    it("MovieSpeed.speed100を返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(MovieSpeed.speed100))
                    }
                }
            }

            // MARK: - setを実行した際のテスト

            describe("#set") {
                it("Completable & 値はMovieSpeed.speed175となる") {
                    expect(try! target.set(movieSpeed: MovieSpeed.speed175).toBlocking().first()).to(beNil())
                    expect(Defaults[\.movieSpeed]).to(equal(MovieSpeed.speed175))
                }
            }
        }
    }
}
