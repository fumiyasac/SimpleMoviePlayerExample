//
//  SettingsViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import UIKit

enum SettingsSection: Int, CaseIterable {
    case movieQuality
    case movieSpeed
    case questions
}

final class SettingsViewController: UIViewController {

    // MARK: - Propety

    private let presenter: SettingsPresenter

    // MEMO: UITableViewDiffableDataSource & NSDiffableDataSourceSnapshotの設定
    private var dataSource: UITableViewDiffableDataSource<SettingsSection, AnyHashable>! = nil

    // MARK: - @IBOutlet

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Initializer

    init?(coder: NSCoder, presenter: SettingsPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(GlobalTabBarItems.settings.title)
        setupTableView()
        applyInitialDataToDataSource()

        presenter.setup(
            view: self,
            coodinator: self
        )
        presenter.viewDidLoadTrigger()
    }

    // MARK: - Private Function
    
    private func setupTableView() {

        // MEMO: UITableViewに関する初期設定
        // ※1: UITableViewのStyleは「Grouped」に設定
        // ※2: UITableViewのSeparatorは「None」に設定
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
          tableView.sectionHeaderTopPadding = 0.0
        }
        tableView.registerCustomCell(MovieSettingsContentCell.self)
        tableView.registerCustomCell(QuestionListContentCell.self)

        // MEMO: DataSourceはUITableViewDiffableDataSourceを利用してUITableViewCellを継承したクラスを組み立てる
        dataSource = UITableViewDiffableDataSource<SettingsSection, AnyHashable>(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, viewObject: AnyHashable) -> UITableViewCell? in

            // MEMO: UICollectionViewListCellを適用する
            switch viewObject {

            // SettingsSection: 0 (MovieQualityViewObject)
            case let viewObject as MovieQualityViewObject:
                let cell = tableView.dequeueReusableCustomCell(with: MovieSettingsContentCell.self)
                cell.setCell(movieQualityViewObject: viewObject)
                return cell

            // SettingsSection: 0 (MovieSpeedViewObject)
            case let viewObject as MovieSpeedViewObject:
                let cell = tableView.dequeueReusableCustomCell(with: MovieSettingsContentCell.self)
                cell.setCell(movieSpeedViewObject: viewObject)
                return cell

            // SettingsSection: 1 (QuestionViewObject)
            case let viewObject as QuestionViewObject:
                let cell = tableView.dequeueReusableCustomCell(with: QuestionListContentCell.self)
                cell.setCell(questionViewObject: viewObject)
                return cell

            default:
                return nil
            }
        }
    }

    // 初期化時のSnapshotを適用する
    private func applyInitialDataToDataSource() {
        var newSnapshot = NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>()
        newSnapshot.appendSections([.movieQuality])
        newSnapshot.appendItems([], toSection: .movieQuality)
        newSnapshot.appendSections([.movieSpeed])
        newSnapshot.appendItems([], toSection: .movieSpeed)
        newSnapshot.appendSections([.questions])
        newSnapshot.appendItems([], toSection: .questions)
        dataSource.apply(newSnapshot, animatingDifferences: false)
    }
}

// MARK: - SettingsView

extension SettingsViewController: SettingsView {

    func applyAllViewObjectsToDataSource(
        movieQualityViewObject: MovieQualityViewObject,
        movieSpeedViewObject: MovieSpeedViewObject,
        questionViewObjects: [QuestionViewObject]
    ) {

        var newSnapshot = NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>()
        newSnapshot.appendSections([.movieQuality])
        newSnapshot.appendItems([movieQualityViewObject], toSection: .movieQuality)
        newSnapshot.appendSections([.movieSpeed])
        newSnapshot.appendItems([movieSpeedViewObject], toSection: .movieSpeed)
        newSnapshot.appendSections([.questions])
        newSnapshot.appendItems(questionViewObjects, toSection: .questions)
        dataSource.apply(newSnapshot, animatingDifferences: false)
    }

    func applyNewMovieQualityViewObjectToDataSource(movieQualityViewObject: MovieQualityViewObject) {

        let currentSnapshot = dataSource.snapshot()
        let beforeMovieQualityViewObjects = currentSnapshot.itemIdentifiers(inSection: .movieQuality)
        let beforeMovieSpeedViewObjects = currentSnapshot.itemIdentifiers(inSection: .movieSpeed)
        let beforeQuestionViewObjects = currentSnapshot.itemIdentifiers(inSection: .questions)

        let isEqualMovieQualityViewObject = (beforeMovieQualityViewObjects == [movieQualityViewObject])
        if !isEqualMovieQualityViewObject {

            var newSnapshot = NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>()
            newSnapshot.appendSections(SettingsSection.allCases)
            newSnapshot.appendItems([movieQualityViewObject], toSection: .movieQuality)
            newSnapshot.appendItems(beforeMovieSpeedViewObjects, toSection: .movieSpeed)
            newSnapshot.appendItems(beforeQuestionViewObjects, toSection: .questions)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.dataSource.apply(newSnapshot, animatingDifferences: true)
            })
        }
    }

    func applyNewMovieSpeedViewObjectToDataSource(movieSpeedViewObject: MovieSpeedViewObject) {

        let currentSnapshot = dataSource.snapshot()
        let beforeMovieQualityViewObjects = currentSnapshot.itemIdentifiers(inSection: .movieQuality)
        let beforeMovieSpeedViewObjects = currentSnapshot.itemIdentifiers(inSection: .movieSpeed)
        let beforeQuestionViewObjects = currentSnapshot.itemIdentifiers(inSection: .questions)

        let isEqualMovieSpeedViewObject = (beforeMovieSpeedViewObjects == [movieSpeedViewObject])
        if !isEqualMovieSpeedViewObject {

            var newSnapshot = NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>()
            newSnapshot.appendSections(SettingsSection.allCases)
            newSnapshot.appendItems(beforeMovieQualityViewObjects, toSection: .movieQuality)
            newSnapshot.appendItems([movieSpeedViewObject], toSection: .movieSpeed)
            newSnapshot.appendItems(beforeQuestionViewObjects, toSection: .questions)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.dataSource.apply(newSnapshot, animatingDifferences: true)
            })
        }
    }
}

// MARK: - SettingsCoodinator

extension SettingsViewController: SettingsCoodinator {}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        // MEMO: 該当のセクションとIndexPathからNSDiffableDataSourceSnapshot内の該当する値を取得する
        guard let targetSection = SettingsSection(rawValue: indexPath.section) else {
            return
        }
        let currentSnapshot = dataSource.snapshot()
        let currentSnapshotInSection = currentSnapshot.itemIdentifiers(inSection: targetSection)
        let viewObject = currentSnapshotInSection[indexPath.row]

        switch viewObject {
        case let viewObject as MovieQualityViewObject:
            // MEMO: 動画解像度セルタップ時
            dump(viewObject)
            return
        case let viewObject as MovieSpeedViewObject:
            // MEMO: 動画再生速度セルタップ時
            dump(viewObject)
            return
        default:
            break
        }
    }

    func tableView(
        _ tableView: UITableView,
        contextMenuConfigurationForRowAt indexPath: IndexPath,
        point: CGPoint
    ) -> UIContextMenuConfiguration? {

        // MEMO: 長押しを検知時に該当のセクションとIndexPathからNSDiffableDataSourceSnapshot内の該当する値を取得する
        guard let targetSection = SettingsSection(rawValue: indexPath.section) else {
            return nil
        }
        let currentSnapshot = dataSource.snapshot()
        let currentSnapshotInSection = currentSnapshot.itemIdentifiers(inSection: targetSection)
        let viewObject = currentSnapshotInSection[indexPath.row]

        // MEMO: viewObjectの型に応じて表示するメニューを出し分ける
        switch viewObject {
        case _ as MovieQualityViewObject:
            return UIContextMenuConfiguration(
                identifier: nil,
                previewProvider: nil,
                actionProvider: { [weak self] suggestedActions in
                    guard let weakSelf = self else {
                        return nil
                    }
                    return weakSelf.showMovieQualityMenu()
                }
            )
        case _ as MovieSpeedViewObject:
            return UIContextMenuConfiguration(
                identifier: nil,
                previewProvider: nil,
                actionProvider: { [weak self] suggestedActions in
                    guard let weakSelf = self else {
                        return nil
                    }
                    return weakSelf.showMovieSpeedMenu()
                }
            )
       default:
            return nil
        }
    }

    // MARK: - Private Function

    private func showMovieQualityMenu() -> UIMenu {
        var movieQualityActionChildren: [UIAction] = []
        for movieQuality in MovieQuality.allCases {
            let action = UIAction(title: movieQuality.text) { [weak self] action in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.presenter.didSelectNewMovieQualityTrigger(movieQuality: movieQuality)
            }
            movieQualityActionChildren.append(action)
        }
        return UIMenu(title: "動画解像度の変更", children: movieQualityActionChildren)
    }

    private func showMovieSpeedMenu() -> UIMenu {
        var movieSpeedActionChildren: [UIAction] = []
        for movieSpeed in MovieSpeed.allCases {
            let action = UIAction(title: "\(movieSpeed.rawValue)倍速") { [weak self] action in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.presenter.didSelectNewMovieSpeedTrigger(movieSpeed: movieSpeed)
            }
            movieSpeedActionChildren.append(action)
        }
        return UIMenu(title: "動画再生速度の変更", children: movieSpeedActionChildren)
    }
}

// MARK: - UIScrollViewDelegate

extension SettingsViewController: UIScrollViewDelegate {

    // MEMO: UITableViewDelegateを適用すれば従来通りUIScorllViewDelegateは利用可能
    func scrollViewDidScroll(_ scrollView: UIScrollView) {}
}

// MARK: - GlobalTabBarInitialViewControllerScrollable

extension SettingsViewController: GlobalTabBarInitialViewControllerScrollable {

    func initialViewControllerScrollToTop() {
        let currentSnapshot = dataSource.snapshot()
        if currentSnapshot.numberOfSections > 0 {
            tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
}
