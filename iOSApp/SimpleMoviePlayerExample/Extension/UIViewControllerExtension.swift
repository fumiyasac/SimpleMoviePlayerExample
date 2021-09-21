//
//  UIViewControllerExtension.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/21.
//

import Foundation
import UIKit

// UIViewControllerの拡張
extension UIViewController {

    // MARK: - Public Function

    // この画面のナビゲーションバーを設定するメソッド
    public func setupNavigationBarTitle(_ title: String) {

        // NavigationControllerのデザイン調整を行う
        if #available(iOS 15, *) {
            // Do Nothing.
        } else {

            guard let nav = self.navigationController else {
                return
            }

            // MEMO: UINavigationBar内部におけるタイトル文字の装飾設定
            var attributes: [NSAttributedString.Key : Any] = [:]
            attributes[NSAttributedString.Key.font] = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            attributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            nav.navigationBar.titleTextAttributes = attributes

            // MEMO: UINavigationBar背景色の装飾設定
            nav.navigationBar.barTintColor = UIColor(code: "#cda966")
        }

        // タイトルを入れる
        self.navigationItem.title = title
    }

    // 戻るボタンの「戻る」テキストを削除した状態にするメソッド
    public func removeBackButtonText() {

        // NavigationBarをタイトル配色を決定する
        guard let nav = self.navigationController else {
            return
        }
        nav.navigationBar.tintColor = UIColor.white

        // 戻るボタンの文言を消す
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
    }

    // 回転の許可状態を考慮したUINavigationControllerを適用する
    public func applyNavigationController(allowRotate: Bool = false) -> UINavigationController {

        // MEMO: 端末の回転を許可する場合はUINavigationControllerを、そうでない場合はPortraitNavigationControllerを適用する
        if allowRotate {
            return UINavigationController(rootViewController: self)
        } else {
            return PortraitNavigationController(rootViewController: self)
        }
    }
}
