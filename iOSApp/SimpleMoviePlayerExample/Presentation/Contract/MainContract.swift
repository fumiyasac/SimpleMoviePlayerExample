//
//  MainContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/25.
//

import Foundation

// sourcery: AutoMockable
protocol MainView: AnyObject {
    func setupCollectionView()
}

protocol MainPresenter: AnyObject {
    func viewWillAppearTrigger()
    func refreshTrigger()
    func addOrRemoveFavorite(mainMovieEntity: MainMovieEntity)
}
