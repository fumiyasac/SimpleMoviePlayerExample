//
//  ProfileEntity.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/09/02.
//

import Foundation

struct ProfileEntity: Hashable, Decodable {

    let id: ProfileId
    let avatarUrl: String
    let registeredDate: String
    let name: String
    let nickname: String
    let birthDate: String
    let homepageUrl: String
    let follows: String
    let company: String
    let occupation: String
    let interests: String
    let description: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case avatarUrl = "avatar_url"
        case registeredDate = "registered_date"
        case name
        case nickname
        case birthDate = "birth_date"
        case homepageUrl = "homepage_url"
        case follows
        case company
        case occupation
        case interests
        case description
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(ProfileId.self, forKey: .id)
        self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        self.registeredDate = try container.decode(String.self, forKey: .registeredDate)
        self.name = try container.decode(String.self, forKey: .name)
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.birthDate = try container.decode(String.self, forKey: .birthDate)
        self.homepageUrl = try container.decode(String.self, forKey: .homepageUrl)
        self.follows = try container.decode(String.self, forKey: .follows)
        self.company = try container.decode(String.self, forKey: .company)
        self.occupation = try container.decode(String.self, forKey: .occupation)
        self.interests = try container.decode(String.self, forKey: .interests)
        self.description = try container.decode(String.self, forKey: .description)
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id.value)
    }

    static func == (lhs: ProfileEntity, rhs: ProfileEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.avatarUrl == rhs.avatarUrl
            && lhs.registeredDate == rhs.registeredDate
            && lhs.name == rhs.name
            && lhs.nickname == rhs.nickname
            && lhs.birthDate == rhs.birthDate
            && lhs.homepageUrl == rhs.homepageUrl
            && lhs.follows == rhs.follows
            && lhs.company == rhs.company
            && lhs.occupation == rhs.occupation
            && lhs.interests == rhs.interests
            && lhs.description == rhs.description
    }
}
