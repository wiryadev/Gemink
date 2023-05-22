//
//  GameItemView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameItemView: View {
    let game: Game

    var body: some View {
        VStack {
            WebImage(url: game.image)
                .resizable()
                .placeholder(content: {
                    ProgressView()
                })
                .scaledToFit()
                .transition(.fade(duration: 0.4))
                .frame(
                    width: UIScreen.main.bounds.width
                )
                .cornerRadius(16, corners: [.topLeft, .topRight])
            HStack {
                VStack(alignment: .leading) {
                    Text(game.title)
                        .lineLimit(2)
                        .font(.headline)
                    Text(game.getFormattedReleaseDate())
                        .font(.caption2)
                }
                Spacer()
                HStack(alignment: .center) {
                    Text(game.getFormattedRating())
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
        }
        .background(Color.eerieBlack)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct GameItemView_Previews: PreviewProvider {
    static var previews: some View {
        GameItemView(
            game: Game(
                id: 3498,
                title: "Grand Theft Auto V",
                image: URL(string: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg")!,
                description: "Rockstar Games went bigger, ",
                releaseDate: Date(),
                rating: 4.47,
                genres: [],
                platforms: [],
                developer: nil,
                publisher: nil,
                ageRating: nil
            )
        )
    }
}
