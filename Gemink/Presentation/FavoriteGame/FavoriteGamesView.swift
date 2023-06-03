//
//  FavoriteGamesView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import SwiftUI

struct FavoriteGamesView: View {

    @StateObject var viewModel = FavoriteGameViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.nightBlack.ignoresSafeArea()
                switch viewModel.result {
                case .success(let data):
                    ScrollView {
                        LazyVStack {
                            ForEach(data) { item in
                                NavigationLink {
                                    DetailGameView(id: item.id)
                                } label: {
                                    GameItemView(game: item)
                                }
                                .listRowSeparator(.hidden)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                case .loading:
                    ProgressView()
                case .initial:
                    EmptyView()
                case .empty:
                    GeminkEmptyView(message: "Favorite games is empty")
                case .error(let message):
                    GeminkErrorView(
                        message: message,
                        action: {
                            viewModel.getAllFavoriteGames()
                        }
                    )
                    .padding(.vertical, 64)
                }
            }
            .onAppear {
                print("CheckFavorite: called")
                viewModel.getAllFavoriteGames()
            }
            .navigationTitle("Favorite")
        }
    }
}

struct FavoriteGamesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGamesView()
    }
}
