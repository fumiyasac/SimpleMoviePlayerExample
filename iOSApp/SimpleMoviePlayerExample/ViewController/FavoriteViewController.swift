//
//  FavoriteViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: - Propety
    
    private let presenter: FavoritePresenter

    // MARK: - @IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Initializer

    init?(coder: NSCoder, presenter: FavoritePresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarItems.favorite.title)
    }
}

// MARK: - FavoriteView

extension FavoriteViewController: FavoriteView {

    func setupCollectionView() {}
}

// MARK: - GlobalTabBarInitialViewControllerScrollable

extension FavoriteViewController: GlobalTabBarInitialViewControllerScrollable {

    func initialViewControllerScrollToTop() {}
}
