//
//  CGExtension.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/02.
//

import Foundation
import UIKit

extension CGFloat {

    // MARK: - Static Function

    // 第1引数で渡された値が第2引数で渡している範囲から何％の位置にあるかを取得する
    // value: 比べる対象となる値
    // inRange: 範囲の最大値＆最小値を定義したタプル
    static func scaleAndShift(value: CGFloat, inRange: (min: CGFloat, max: CGFloat), toRange: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)) -> CGFloat {
        if value < inRange.min {
            return toRange.min
        } else if value > inRange.max {
            return toRange.max
        } else {
            let ratio = (value - inRange.min) / (inRange.max - inRange.min)
            return toRange.min + ratio * (toRange.max - toRange.min)
        }
    }
}

extension CGSize {

    // MARK: - Property
 
    // 画面倍率を考慮したCGSizeを取得する
    var pixelSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}

extension CGRect {

    // MARK: - Static Function

    // 実際の要素と配置されている要素に合わせた要素の割合を考慮したサイズを算出する
    // aspectRatio: UIImageViewのUIImageの実際のサイズ
    // insideRect: 画面内に配置しているUIImageViewのサイズ
    static func makeRect(aspectRatio: CGSize, insideRect rect: CGRect) -> CGRect {
        let viewRatio = rect.width / rect.height
        let imageRatio = aspectRatio.width / aspectRatio.height
        let touchesHorizontalSides = (imageRatio > viewRatio)

        let result: CGRect
        if touchesHorizontalSides {
            let height = rect.width / imageRatio
            let yPoint = rect.minY + (rect.height - height) / 2
            result = CGRect(x: 0, y: yPoint, width: rect.width, height: height)
        } else {
            let width = rect.height * imageRatio
            let xPoint = rect.minX + (rect.width - width) / 2
            result = CGRect(x: xPoint, y: 0, width: width, height: rect.height)
        }
        return result
    }
}
