//
//  MovieSettingsContentCell.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/10/31.
//

import UIKit

final class MovieSettingsContentCell: UITableViewCell {

    // MARK: - @IBOutlet

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var currentValueLabel: UILabel!
    @IBOutlet private weak var borderViewHeightConstraint: NSLayoutConstraint!

    // MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()

        borderViewHeightConstraint.constant = (1.0 / UIScreen.main.scale)
    }

    // MARK: - Functions

    func setCell(movieQualityViewObject: MovieQualityViewObject) {
        titleLabel.text = movieQualityViewObject.title
        currentValueLabel.text = movieQualityViewObject.value
    }

    func setCell(movieSpeedViewObject: MovieSpeedViewObject) {
        titleLabel.text = movieSpeedViewObject.title
        currentValueLabel.text = movieSpeedViewObject.value
    }
}
