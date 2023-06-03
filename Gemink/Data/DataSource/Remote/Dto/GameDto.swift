//
//  MovieResponse.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct GamesDto: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GameDto]?
    let seoTitle, seoDescription, seoKeywords, seoH1: String?
    let noindex, nofollow: Bool?
    let description: String?
    let nofollowCollections: [String]?

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description
        case nofollowCollections = "nofollow_collections"
    }
}

struct GameDto: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String?
    let metacritic: Int?
    let released: String?
    let tba: Bool?
    let updated: String?
    let backgroundImage, backgroundImageAdditional: String?
    let website: String?
    let rating: Float?
    let ratingTop: Int?
    let added: Int?
    let playtime, moviesCount, creatorsCount: Int?
    let achievementsCount, parentAchievementsCount: Int?
    let redditURL: String?
    let redditName, redditDescription, redditLogo: String?
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int?
    let ratingsCount, suggestionsCount: Int?
    let alternativeNames: [String]?
    let parentsCount, additionsCount, gameSeriesCount: Int?
    let reviewsCount: Int?
    let saturatedColor, dominantColor: String?
    let platforms: [PlatformDto]?
    let genres: [GenreDto]?
    let developers, publishers: [DeveloperPublisherrDto]?
    let esrbRating: EsrbDto?
    let descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description, metacritic
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case added
        case playtime
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms, developers, genres, publishers
        case esrbRating = "esrb_rating"
        case descriptionRaw = "description_raw"
    }
}
