//
//  HomeView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
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
                    GeminkEmptyView(message: "Current discovery is empty")
                case .error(let message):
                    GeminkErrorView(
                        message: message,
                        action: {
                            Task {
                                await viewModel.discoverGames()
                            }
                        })
                    .padding(.vertical, 64)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
