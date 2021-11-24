//
//  SettingsContract.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/27.
//

import Foundation

// sourcery: AutoMockable
protocol SettingsView: AnyObject {
    func applyAllViewObjectsToDataSource(
        movieQualityViewObject: MovieQualityViewObject,
        movieSpeedViewObject: MovieSpeedViewObject,
        questionViewObjects: [QuestionViewObject]
    )
    func applyNewMovieQualityViewObjectToDataSource(movieQuality: MovieQuality)
    func applyNewMovieSpeedViewObjectToDataSource(movieSpeed: MovieSpeed)
}

protocol SettingsPresenter: AnyObject {
    func setup(
         view: SettingsView,
         coodinator: SettingsCoodinator
     )
    func viewDidLoadTrigger()
    func didSelectNewMovieQualityTrigger(movieQuality: MovieQuality)
    func didSelectNewMovieSpeedTrigger(movieSpeed: MovieSpeed)
}
