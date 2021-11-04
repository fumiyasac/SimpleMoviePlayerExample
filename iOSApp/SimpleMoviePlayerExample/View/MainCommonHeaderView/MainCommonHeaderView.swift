//
//  MainCommonHeaderView.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/11/04.
//

import UIKit

final class MainCommonHeaderView: UICollectionReusableView {

    // MARK: - @IBOutlet

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    // MARK: - Function

    func setHeader(
        title: String,
        description: String
    ) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
