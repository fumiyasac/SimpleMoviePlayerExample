//
//  MainBannerContainerViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/14.
//

import UIKit

final class MainBannerContainerViewController: UIViewController {

    // MARK: - Propety
    
    private let mainBannerContainerPresenter: MainBannerContainerPresenter

    // MARK: - @IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Initializer

    init?(coder: NSCoder, presenter: MainBannerContainerPresenter) {
        mainBannerContainerPresenter = presenter
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MainBannerContainerView

extension MainBannerContainerViewController: MainBannerContainerView {

    func setupCollectionView() {}
}
