//
//  MainViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/05/03.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - @IBOutlet

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarItems.main.getTabBarTitle())
    }
}
