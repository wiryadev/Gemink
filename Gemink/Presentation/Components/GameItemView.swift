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
                description: "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \nSimultaneous storytelling from three unique perspectives: \nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.",
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
