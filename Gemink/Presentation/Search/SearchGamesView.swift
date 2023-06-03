//
//  SearchGamesView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 22/05/23.
//

import SwiftUI

struct SearchGamesView: View {

    @StateObject var viewModel = SearchGamesViewModel()

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
                    VStack {
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                            .font(.system(size: 128, weight: .semibold))
                        Text("Try to search something first")
                            .padding(.top, 8)
                            .padding(.bottom, 16)
                    }
                case .empty:
                    GeminkEmptyView(message: "No game matches this query")
                case .error(let message):
                    GeminkErrorView(message: message) {
                        Task {
                            await viewModel.searchGames()
                        }
                    }
                }
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Find your favorite games"
        )
        .autocorrectionDisabled()
        .onReceive(
            viewModel.$searchText.debounce(
                for: .seconds(2),
                scheduler: DispatchQueue.main
            )
        ) { output in
            guard !output.isEmpty else { return }
            Task { await viewModel.searchGames() }
        }
        .onSubmit(of: .search) {
            Task {
                await viewModel.searchGames()
            }
        }
        .navigationTitle("Search Games")
    }
}

struct SearchGamesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGamesView()
    }
}
