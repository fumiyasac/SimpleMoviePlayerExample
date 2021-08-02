//
//  NotificationNameExtension.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/02.
//

import Foundation

extension Notification.Name {
    static let disconnectVideoPlayer = Notification.Name("DisconnectVideoPlayer")
    static let reconnectVideoPlayer = Notification.Name("ReconnectVideoPlayer")
}
