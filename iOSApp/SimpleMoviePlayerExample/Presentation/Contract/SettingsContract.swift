//
//  SettingsContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation

// sourcery: AutoMockable
protocol SettingsView: AnyObject {
    func setupCollectionView()
}

protocol SettingsPresenter: AnyObject {
    func viewWillAppearTrigger()
}
