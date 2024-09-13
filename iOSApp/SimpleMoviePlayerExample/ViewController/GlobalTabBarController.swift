//
//  GlobalTabBarController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/23.
//

import UIKit
//import FontAwesome_swift

protocol GlobalTabBarInitialViewControllerScrollable: AnyObject {
    func initialViewControllerScrollToTop()
}

final class GlobalTabBarController: UITabBarController {

    // MARK: - Properties

    private let itemSize = CGSize(width: 28.0, height: 28.0)
    private let normalColor: UIColor = UIColor.lightGray
    private let selectedColor: UIColor = UIColor(code: "#cda966")
    private let tabBarItemFont = UIFont(name: "HelveticaNeue-Medium", size: 10)!

    // MARK: - Override

    // 画面の回転処理に関するハンドリング
    // supportedInterfaceOrientationsはTabBarControllerやNavigationControllerを利用する際はルートの設定が反映される。
    // → よってGlobalTabBarControllerでは、選択されたタブのルートなる部分での回転に関する設定を取得してその値を適用する。
    // https://qiita.com/orimomo/items/6ab57c6706a8dbc181a1

    override var shouldAutorotate: Bool {
        if let vc = selectedViewController {
            return vc.shouldAutorotate
        } else {
            return true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let vc = selectedViewController {
            return vc.supportedInterfaceOrientations
        } else {
            return .allButUpsideDown
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGlobalTabBarController()
    }

    // MARK: - Private Function

    // UITabBarControllerの初期設定に関する調整
    private func setupGlobalTabBarController() {

        // MEMO: UITabBarControllerDelegateの宣言
        self.delegate = self

        // MEMO: Storyboardを利用したDI処理を実施する
        // https://qiita.com/shtnkgm/items/cad6f52c489612628fd4
        // (1) MainViewController
        let mainViewController = UIStoryboard(name: "MainViewController", bundle: nil).instantiateInitialViewController { coder in
            MainViewController(
                coder: coder,
                presenter: PresenterFactory.createMainPresneter()
            )
        }!.applyNavigationController()
        // (2) FavoriteViewController
        let favoriteViewController = UIStoryboard(name: "FavoriteViewController", bundle: nil).instantiateInitialViewController { coder in
            FavoriteViewController(
                coder: coder,
                presenter: PresenterFactory.createFavoritePresenter()
            )
        }!.applyNavigationController()
        // (3) SettingsViewController
        let settingsViewController = UIStoryboard(name: "SettingsViewController", bundle: nil).instantiateInitialViewController() { coder in
            SettingsViewController(
                coder: coder,
                presenter: PresenterFactory.createSettingsPresenter()
            )
        }!.applyNavigationController()

        // MEMO: 各画面の土台となるUINavigationControllerをセットする
        self.viewControllers = [
            mainViewController,
            favoriteViewController,
            settingsViewController
        ]

        // MEMO: タブの選択時・非選択時の色とアイコンのサイズを決める
        // UITabBarItem用のAttributeを決める
        let normalAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: normalColor
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: selectedColor
        ]

        let _ = GlobalTabBarItems.allCases.enumerated().map { (index, tabBarItem) in

            self.viewControllers?[index].tabBarItem.tag = index

            // 該当ViewControllerのタイトルの設定
            self.viewControllers?[index].title = tabBarItem.title

            // NavigationControllerのデザイン調整を行う
            // MEMO: iOS15以降ではこちらの方法では適用されない点に注意
            if #available(iOS 15, *) {
                // Do Nothing.
            } else {
                self.viewControllers?[index].tabBarItem.setTitleTextAttributes(normalAttributes, for: [])
                self.viewControllers?[index].tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
            }
            self.viewControllers?[index].tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -1.5)
            self.viewControllers?[index].tabBarItem.image = UIImage.fontAwesomeIcon(
                name: tabBarItem.icon,
                style: .solid,
                textColor: normalColor,
                size: itemSize
            ).withRenderingMode(.alwaysOriginal)
            self.viewControllers?[index].tabBarItem.selectedImage = UIImage.fontAwesomeIcon(
                name: tabBarItem.icon,
                style: .solid, textColor: selectedColor,
                size: itemSize
            ).withRenderingMode(.alwaysOriginal)
        }
    }
}

// MARK: - UITabBarControllerDelegate

extension GlobalTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let viewControllers = viewControllers else { return false }
        if viewController == viewControllers[selectedIndex], let navigationController = viewController as? UINavigationController {
            return handleScrollToTopOrDismissToInitialViewController(navigationController)
        }
        return true
    }

    private func handleScrollToTopOrDismissToInitialViewController(_ navigationController: UINavigationController) -> Bool {
        guard let viewController = navigationController.viewControllers.last else {
            return true
        }
        // MEMO: 一番最初に表示する画面でタブ押下した場合にはScrollToTopを実行し、そうでない場合にはRootへ戻る画面遷移を実行する
        var shouldDismissToInitialViewController: Bool = false
        switch viewController {
        case let mainViewController as MainViewController:
            mainViewController.initialViewControllerScrollToTop()
        case let favoriteViewController as FavoriteViewController:
            favoriteViewController.initialViewControllerScrollToTop()
        case let settingsViewController as SettingsViewController:
            settingsViewController.initialViewControllerScrollToTop()
        default:
            shouldDismissToInitialViewController = true
        }
        return shouldDismissToInitialViewController
    }
}
