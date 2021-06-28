//
//  PlayerView.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/28.
//

import Foundation
import UIKit
import AVKit

// UIViewを継承したAVPlayerを内部に持つクラスを準備する
// (公式ドキュメント)
// https://developer.apple.com/documentation/avfoundation/avplayerlayer
// (参考資料)
// https://nackpan.net/blog/2019/12/02/play-movie-avplayerlayer/
// https://nackpan.net/blog/2020/02/15/play-movie-avplayerlayer-skip-seek/

class PlayerView: UIView {

    // MARK: - Properties

    override static var layerClass: AnyClass {
        AVPlayerLayer.self
    }

    var player: AVPlayer? {
        get {
            playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }

    private var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }
}
