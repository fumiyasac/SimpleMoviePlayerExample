//
//  MainViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/05/03.
//

import UIKit

enum MainSection: Int, CaseIterable {
    case mainBanner
    case mainNews
    case mainMovies
    case featuredMovies
}

final class MainViewController: UIViewController {

    // MARK: - Property
    
    private let presenter: MainPresenter

    // MARK: - @IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Initializer

    init?(coder: NSCoder, presenter: MainPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarItems.main.title)

        presenter.setup(
            view: self,
            coodinator: self
        )
        presenter.viewDidLoadTrigger()
    }
}

// MARK: - MainView

extension MainViewController: MainView {

    func applyAllViewObjectsToDataSource(
        mainBannerViewObjects: [MainBannerViewObject],
        mainNewsViewObject: [MainNewsViewObject],
        mainMovieViewObjects: [MainMovieViewObject],
        featuredMovieViewObjects: [FeaturedMovieViewObject]
    ) {
        //
    }
}

// MARK: - MainCoodinator

extension MainViewController: MainCoodinator {

    func coordinateToMainMovieDetailPlayer(mainMovieId: MainMovieId) {
        //
    }

    func coordinateToFeaturedDetailPlayer() {
        //
    }
}

// MARK: - GlobalTabBarInitialViewControllerScrollable

extension MainViewController: GlobalTabBarInitialViewControllerScrollable {

    func initialViewControllerScrollToTop() {}
}
