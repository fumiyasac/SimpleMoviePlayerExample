//
//  PortraitNavigationController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/18.
//

import Foundation
import UIKit

// MEMO: 回転を許可しない画面で適用するUINavigationController（回転を許可する画面では従来通りのUINavigationControllerを適用すれば良い）
// ※ UITabBarControllerやUINavigationControllerが絡む回転については、ルート部分での回転に関する設定が影響する点に注意

final class PortraitNavigationController: UINavigationController {

    // MARK: - Override

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
