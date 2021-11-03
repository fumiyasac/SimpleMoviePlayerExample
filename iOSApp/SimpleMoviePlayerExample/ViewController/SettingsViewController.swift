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
    private var snapshot: NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>!
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
        snapshot = NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>()
        snapshot.appendSections(SettingsSection.allCases)
        for section in SettingsSection.allCases {
            snapshot.appendItems([], toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - SettingsView

extension SettingsViewController: SettingsView {

    func applyAllViewObjectsToDataSource(
        movieQualityViewObject: MovieQualityViewObject,
        movieSpeedViewObject: MovieSpeedViewObject,
        questionViewObjects: [QuestionViewObject]
    ) {

        // MEMO: 当該セクションのデータ配列を削除した後にPresenterから受け取ったViewObjectを追加する
        // ※ 変更前と変更後のViewObjectの値が同じ物であればsnapshotの操作を実行しない
        // → Snapshotを操作するとScroll位置がずれてしまうのでやむなくこの形としている
        // → movieQualityViewObject / MovieSpeedViewObject の更新操作時も同様

        let beforeMovieQualityViewObjects = snapshot.itemIdentifiers(inSection: .movieQuality)
        let isEqualMovieQualityViewObject = (beforeMovieQualityViewObjects == [movieQualityViewObject])
        if !isEqualMovieQualityViewObject {
            snapshot.deleteItems(beforeMovieQualityViewObjects)
            snapshot.appendItems([movieQualityViewObject], toSection: .movieQuality)
        }
        
        let beforeMovieSpeedViewObjects = snapshot.itemIdentifiers(inSection: .movieSpeed)
        let isEqualMovieSpeedViewObject = (beforeMovieSpeedViewObjects == [movieSpeedViewObject])
        if !isEqualMovieSpeedViewObject {
            snapshot.deleteItems(beforeMovieSpeedViewObjects)
            snapshot.appendItems([movieSpeedViewObject], toSection: .movieSpeed)
        }
        
        let beforeQuestionsViewObjects = snapshot.itemIdentifiers(inSection: .questions)
        let isEqualQuestionsViewObjects = (beforeQuestionsViewObjects as! [QuestionViewObject] == questionViewObjects)
        if !isEqualQuestionsViewObjects {
            snapshot.deleteItems(beforeQuestionsViewObjects)
            snapshot.appendItems(questionViewObjects, toSection: .questions)
        }

        if !isEqualMovieQualityViewObject || !isEqualMovieSpeedViewObject || !isEqualQuestionsViewObjects {
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    func applyNewMovieQualityViewObjectToDataSource(movieQualityViewObject: MovieQualityViewObject) {

        let beforeMovieQualityViewObjects = snapshot.itemIdentifiers(inSection: .movieQuality)
        let isEqualMovieQualityViewObject = (beforeMovieQualityViewObjects == [movieQualityViewObject])
        if !isEqualMovieQualityViewObject {
            snapshot.deleteItems(beforeMovieQualityViewObjects)
            snapshot.appendItems([movieQualityViewObject], toSection: .movieQuality)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    func applyNewMovieSpeedViewObjectToDataSource(movieSpeedViewObject: MovieSpeedViewObject) {

        let beforeMovieSpeedViewObjects = snapshot.itemIdentifiers(inSection: .movieSpeed)
        let isEqualMovieSpeedViewObject = (beforeMovieSpeedViewObjects == [movieSpeedViewObject])
        if !isEqualMovieSpeedViewObject {
            snapshot.deleteItems(beforeMovieSpeedViewObjects)
            snapshot.appendItems([movieSpeedViewObject], toSection: .movieSpeed)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
}

// MARK: - SettingsCoodinator

extension SettingsViewController: SettingsCoodinator {}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {

        // MEMO: 該当のセクションに応じたHeaderを定義する
        switch section {
        case SettingsSection.questions.rawValue:
            let headerView = QuestionListHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 48.0))
            return headerView
        default:
            return nil
        }
    }

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        switch section {
        case SettingsSection.questions.rawValue:
            return 48.0
        default:
            return .leastNonzeroMagnitude
        }
    }

    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        return nil
    }

    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        return .leastNonzeroMagnitude
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        // MEMO: 該当のセクションとIndexPathからNSDiffableDataSourceSnapshot内の該当する値を取得する
        guard let targetSection = SettingsSection(rawValue: indexPath.section) else {
            return
        }
        let targetSnapshot = snapshot.itemIdentifiers(inSection: targetSection)
        let viewObject = targetSnapshot[indexPath.row]

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
        let targetSnapshot = snapshot.itemIdentifiers(inSection: targetSection)
        let viewObject = targetSnapshot[indexPath.row]

        // MEMO: viewObjectの型に応じて表示するメニューを出し分ける
        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil,
            actionProvider: { [weak self] suggestedActions in
                guard let weakSelf = self else {
                    return nil
                }
                switch viewObject {
                case _ as MovieQualityViewObject:
                    return weakSelf.showMovieQualityMenu()
                case _ as MovieSpeedViewObject:
                    return weakSelf.showMovieSpeedMenu()
                default:
                    return nil
                }
            }
        )
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
        if snapshot.numberOfSections > 0 {
            tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
}
