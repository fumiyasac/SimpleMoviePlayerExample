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

    private var snapshot: NSDiffableDataSourceSnapshot<SettingsSection, AnyHashable>!

    private var dataSource: UICollectionViewDiffableDataSource<SettingsSection, AnyHashable>! = nil

    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            // MEMO: UICollectionViewのレイアウトを適用する
            guard let weakSelf = self else {
                assertionFailure()
                return nil
            }
            return weakSelf.createCollectionViewLayout(layoutEnvironment: layoutEnvironment)
        }
        return layout
    }()
    
    // MARK: - @IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!

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
        setupCollectionView()
        applyInitialSnapshot()
    }

    // MARK: - Private Function
    
    private func setupCollectionView() {

        // MEMO: UICollectionViewDelegateの適用
        collectionView.delegate = self
        
        // MEMO: UICollectionViewCompositionalLayoutを利用してレイアウトを組み立てる
        collectionView.collectionViewLayout = compositionalLayout

        // MEMO: このレイアウトで利用するセル要素・Headerの登録
        // SettingsSection: 0
        collectionView.registerCustomReusableHeaderView(MovieSettingsHeaderView.self)
        // SettingsSection: 1
        collectionView.registerCustomReusableHeaderView(QuestionListHeaderView.self)

        // MEMO: DataSourceはUICollectionViewDiffableDataSourceを利用してUICollectionViewCellを継承したクラスを組み立てる
        dataSource = UICollectionViewDiffableDataSource<SettingsSection, AnyHashable>(collectionView: collectionView) { [weak self] (collectionView: UICollectionView, indexPath: IndexPath, viewObject: AnyHashable) -> UICollectionViewCell? in

            // MEMO: UICollectionViewListCellを適用する
            guard let weakSelf = self else {
                assertionFailure()
                return nil
            }

            switch viewObject {

            // SettingsSection: 0 (MovieQualityViewObject)
            case let viewObject as MovieQualityViewObject:
                return weakSelf.createMovieQualityCell(viewObject: viewObject, indexPath: indexPath)

            // SettingsSection: 0 (MovieSpeedViewObject)
            case let viewObject as MovieSpeedViewObject:
                return weakSelf.createMovieSpeedCell(viewObject: viewObject, indexPath: indexPath)

            // SettingsSection: 1 (QuestionViewObject)
            case let viewObject as QuestionViewObject:
                return weakSelf.createQuestionListCell(viewObject: viewObject, indexPath: indexPath)

            default:
                return nil
            }
        }

        // MEMO: Headerの表記についてもUICollectionViewDiffableDataSourceを利用して組み立てる
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in

            switch indexPath.section {

            // SettingsSection: 0
            case SettingsSection.movieSettings.rawValue:
                if kind == UICollectionView.elementKindSectionHeader {
                    return collectionView.dequeueReusableCustomHeaderView(with: MovieSettingsHeaderView.self, indexPath: indexPath)
                }

            // SettingsSection: 1
            case SettingsSection.questions.rawValue:
                if kind == UICollectionView.elementKindSectionHeader {
                    return collectionView.dequeueReusableCustomHeaderView(with: QuestionListHeaderView.self, indexPath: indexPath)
                }
            default:
                break
            }
            return nil
        }
    }

    private func createCollectionViewLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.headerMode = .supplementary
        return NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
    }

    // 現在選択中の動画解像度を表示するセル
    private func createMovieQualityCell(
        viewObject: MovieQualityViewObject,
        indexPath: IndexPath
    ) -> UICollectionViewListCell {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, MovieQualityViewObject> { [weak self] (cell, _, viewObject) in
            guard let weakSelf = self else {
                assertionFailure()
                return
            }
            var contentConfiguration = weakSelf.createMovieSettingsConfiguration()
            contentConfiguration.text = viewObject.title
            contentConfiguration.secondaryText = viewObject.movieQuality.text
            cell.contentConfiguration = contentConfiguration
        }
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: viewObject)
        return cell
    }

    // 現在選択中の動画速度を表示するセル
    private func createMovieSpeedCell(
        viewObject: MovieSpeedViewObject,
        indexPath: IndexPath
    ) -> UICollectionViewListCell {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, MovieSpeedViewObject> { [weak self] (cell, _, viewObject) in
            guard let weakSelf = self else {
                assertionFailure()
                return
            }
            var contentConfiguration = weakSelf.createMovieSettingsConfiguration()
            contentConfiguration.text = viewObject.title
            contentConfiguration.secondaryText = "x\(viewObject.movieSpeed)"
            cell.contentConfiguration = contentConfiguration
        }
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: viewObject)
        return cell
    }

    // よくあるQ&Aを表示するセル
    private func createQuestionListCell(
        viewObject: QuestionViewObject,
        indexPath: IndexPath
    ) -> UICollectionViewListCell {
        let cellRegistration = UICollectionView.CellRegistration<QuestionListCell, QuestionViewObject> { [weak self] (cell, _, viewObject) in
            guard let _ = self else {
                assertionFailure()
                return
            }
            cell.question = viewObject.question
            cell.answer = viewObject.answer
        }
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: viewObject)
        return cell
    }

    // デフォルトのUICollectionViewListCellの設定をそのまま利用する場合のデザインを適用する
    private func createMovieSettingsConfiguration() -> UIListContentConfiguration {
        var content: UIListContentConfiguration = .valueCell()
        content.textProperties.font = UIFont(name: "HelveticaNeue-Medium", size: 14.0)!
        content.textProperties.color = .gray
        content.secondaryTextProperties.font = UIFont(name: "HelveticaNeue-Medium", size: 14.0)!
        content.secondaryTextProperties.color = .gray
        return content
    }

    // 初期化時のSnapshotを適用する
    private func applyInitialSnapshot() {
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

    func setupContents() {}
}

// MARK: - UICollectionViewDelegate

extension SettingsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        // MEMO: 該当のセクションとIndexPathからNSDiffableDataSourceSnapshot内の該当する値を取得する
        if let targetSection = SettingsSection(rawValue: indexPath.section) {
            let targetSnapshot = snapshot.itemIdentifiers(inSection: targetSection)
            print("Section: ", targetSection)
            print("IndexPath.row: ", indexPath.row)
            print("Model: ", targetSnapshot[indexPath.row])
        }
    }
}

// MARK: - UIScrollViewDelegate

extension SettingsViewController: UIScrollViewDelegate {

    // MEMO: UICollectionViewDelegateを適用すれば従来通りUIScorllViewDelegateは利用可能
    func scrollViewDidScroll(_ scrollView: UIScrollView) {}
}
