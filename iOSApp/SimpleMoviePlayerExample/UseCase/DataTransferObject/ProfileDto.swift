//
//  ProfileDto.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/04.
//

import Foundation

final class ProfileDto: Equatable {

    let profile: ProfileEntity
    let profileActivities: [ProfileActivityEntity]
    let profileComments: [ProfileCommentEntity]

    // MARK: - Initializer

    init(
        profile: ProfileEntity,
        profileActivities: [ProfileActivityEntity],
        profileComments: [ProfileCommentEntity]
    ) {
        self.profile = profile
        self.profileActivities = profileActivities
        self.profileComments = profileComments
    }

    // MARK: - Equatable

    static func == (
        lhs: ProfileDto,
        rhs: ProfileDto
    ) -> Bool {
        return lhs.profile == rhs.profile &&
            lhs.profileActivities == rhs.profileActivities &&
            lhs.profileComments == rhs.profileComments
    }
}
