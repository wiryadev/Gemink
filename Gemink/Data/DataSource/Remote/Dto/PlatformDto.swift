//
//  PlatformDto.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct PlatformDto: Codable {
    let platform: PlatformInfoDto?
    let releasedAt: String?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
    }
}

struct PlatformInfoDto: Codable {
    let id: Int?
    let name, slug: String?
    let yearStart: Int?
    let gamesCount: Int?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}
