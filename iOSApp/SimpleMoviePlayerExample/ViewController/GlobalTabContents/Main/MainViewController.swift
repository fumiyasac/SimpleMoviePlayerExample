//
//  MainViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/05/03.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Propety
    
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

        setupNavigationBarTitle(GlobalTabBarItems.main.getTabBarTitle())
    }
}

// MARK: - MainView

extension MainViewController: MainView {

    func setupCollectionView() {
    }
}
