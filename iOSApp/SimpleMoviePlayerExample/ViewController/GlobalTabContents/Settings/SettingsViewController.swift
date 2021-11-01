//
//  SettingsViewController.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/06/24.
//

import UIKit

enum SettingsSection: Int, CaseIterable {
    case movieSettings
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
        applyEmptySnapshot()

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
    private func applyEmptySnapshot() {
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
    func applyDataSource(
        movieSettingsDto: MovieSettingsDto,
        questionDto: QuestionDto
    ) {
        // MEMO: セクションの並び順番をこの中で決定する
        let beforeMovieSettingsViewObjects = snapshot.itemIdentifiers(inSection: .movieSettings)
        snapshot.deleteItems(beforeMovieSettingsViewObjects)
        let beforeQuestionsViewObjects = snapshot.itemIdentifiers(inSection: .questions)
        snapshot.deleteItems(beforeQuestionsViewObjects)

        let movieSettingsViewObjects: [AnyHashable] = [
            MovieQualityViewObject(movieQuality: movieSettingsDto.movieQuality),
            MovieSpeedViewObject(movieSpeed: movieSettingsDto.movieSpeed)
        ]
        snapshot.appendItems(movieSettingsViewObjects, toSection: .movieSettings)
        let questionsViewObjects = questionDto.questions.map { question in
            QuestionViewObject(questionEntity: question)
        }
        snapshot.appendItems(questionsViewObjects, toSection: .questions)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - SettingsCoodinator

extension SettingsViewController: SettingsCoodinator {}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        // MEMO: 該当のセクションに応じたHeaderを定義する
        switch section {
        case SettingsSection.movieSettings.rawValue:
            let headerView = MovieSettingsHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 48.0))
            return headerView
        case SettingsSection.questions.rawValue:
            let headerView = QuestionListHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 48.0))
            return headerView
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // MEMO: 該当のセクションとIndexPathからNSDiffableDataSourceSnapshot内の該当する値を取得する
        guard let targetSection = SettingsSection(rawValue: indexPath.section) else {
            return
        }
        let targetSnapshot = snapshot.itemIdentifiers(inSection: targetSection)
        let viewObject = targetSnapshot[indexPath.row]

        switch viewObject {
        case let viewObject as MovieQualityViewObject:
            dump(viewObject)
            // TODO: UIMenuでの値切り替え処理
            return
        case let viewObject as MovieSpeedViewObject:
            // TODO: UIMenuでの値切り替え処理
            dump(viewObject)
            return
        default:
            break
        }
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
