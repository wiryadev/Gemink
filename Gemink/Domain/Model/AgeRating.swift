//
//  AgeRating.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct AgeRating {
    let id: Int
    let name: String
}

extension AgeRating {
    static func map(from esrb: EsrbDto) -> AgeRating {
        return AgeRating(
            id: esrb.id ?? 0,
            name: esrb.name ?? ""
        )
    }
}
