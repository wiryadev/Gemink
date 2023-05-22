//
//  GenreDto.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct GenreDto: Codable {
    let id: Int?
    let name, slug: String?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case imageBackground = "image_background"
    }
}
