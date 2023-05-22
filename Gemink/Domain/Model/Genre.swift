//
//  Genre.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct Genre {
    let id: Int
    let name: String
}

extension GenreDto {
    func mapToDomain() -> Genre {
        return Genre(
            id: self.id ?? 0,
            name: self.name ?? ""
        )
    }
}
