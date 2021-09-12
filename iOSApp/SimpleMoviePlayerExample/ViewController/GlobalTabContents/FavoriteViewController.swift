//
//  FavoriteViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: - @IBOutlet

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarItems.favorite.getTabBarTitle())
    }
}
