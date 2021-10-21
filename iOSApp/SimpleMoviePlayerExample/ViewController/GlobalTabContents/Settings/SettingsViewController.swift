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

        // MEMO: DataSourceはUICollectionViewDiffableDataSourceを利用してUICollectionViewCellを継承したクラスを組み立てる
        dataSource = UICollectionViewDiffableDataSource<SettingsSection, AnyHashable>(collectionView: collectionView) { [weak self] (collectionView: UICollectionView, indexPath: IndexPath, viewObject: AnyHashable) -> UICollectionViewCell? in

            // MEMO: UICollectionViewListCellを適用する
            guard let weakSelf = self else {
                assertionFailure()
                return nil
            }

            switch viewObject {

            // MainSection: 0 (MovieQualityViewObject)
            case let viewObject as MovieQualityViewObject:
                return weakSelf.createMovieQualityCell(viewObject: viewObject, indexPath: indexPath)

            // MainSection: 0 (MovieSpeedViewObject)
            case let viewObject as MovieSpeedViewObject:
                return weakSelf.createMovieSpeedCell(viewObject: viewObject, indexPath: indexPath)

            // MainSection: 1 (QuestionViewObject)
            case let viewObject as QuestionViewObject:

                // TODO: UICollectionViewListCellを継承して自前のClassを準備する
                let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, QuestionViewObject> { cell, _, viewObject in
                    var contentConfiguration = cell.defaultContentConfiguration()
                    contentConfiguration.text = viewObject.question
                    cell.contentConfiguration = contentConfiguration
                }
                let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: viewObject)
                return cell

            default:
                return nil
            }
        }
    }

    private func createCollectionViewLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)

        // TODO: 独自のHeaderクラスを準備する
//        configuration.headerMode = .supplementary
        configuration.headerMode = .none
        return NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
    }

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
