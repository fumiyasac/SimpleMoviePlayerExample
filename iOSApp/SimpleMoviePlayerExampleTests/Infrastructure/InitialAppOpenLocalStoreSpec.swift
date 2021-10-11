//
//  InitialAppOpenLocalStoreSpec.swift
//  SimpleMoviePlayerExampleTests
//
//  Created by 酒井文也 on 2021/10/11.
//

@testable import SimpleMoviePlayerExample

import Nimble
import Quick
import RxBlocking
import RxSwift
import SwiftyMocky
import SwiftyUserDefaults
import XCTest

final class InitialAppOpenLocalStoreSpec: QuickSpec {

    // MARK: - Override

    override func spec() {

        let target = InitialAppOpenLocalStoreImpl()

        // MEMO: テスト前に実行する処理
        // UserDefaultを空にする
        beforeEach {
            Defaults.removeAll()
        }

        // MEMO: このクラスにて実行したいテスト内容
        describe("InitialAppOpenLocalStoreImpl") {
            
            // MARK: - getを実行した際のテスト

            describe("#get") {
                context("画面起動が初回の場合") {
                    beforeEach {
                        Defaults[\.initialAppOpen] = true
                    }
                    it("trueを返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(true))
                    }
                }
                context("画面起動が初回ではない場合") {
                    it("falseを返す") {
                        expect(try! target.get().toBlocking().first()).to(equal(false))
                    }
                }
            }

            // MARK: - changeFalseを実行した際のテスト

            describe("#changeFalse") {
                it("Completable & 値はfalseとなる") {
                    expect(try! target.changeFalse().toBlocking().first()).to(beNil())
                    expect(Defaults[\.initialAppOpen]).to(equal(false))
                }
            }
        }
    }
}
