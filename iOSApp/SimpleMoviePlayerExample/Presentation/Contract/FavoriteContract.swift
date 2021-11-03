//
//  FavoriteContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation

// sourcery: AutoMockable
protocol FavoriteView: AnyObject {
    func setupCollectionView()
}

protocol FavoritePresenter: AnyObject {
    func viewWillAppearTrigger()
    func refreshTrigger()
}
