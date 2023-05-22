//
//  DetailGameView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailGameView: View {
    let id: Int
    @StateObject var viewModel = DetailGameViewModel()
    let topInset: CGFloat
    let imageCorner: UIRectCorner
    init(id: Int) {
        self.id = id
        topInset = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first?
            .safeAreaInsets.top ?? 0
        imageCorner = (topInset > 0) ? .allCorners :
        [.bottomLeft, .bottomRight]
    }
    var body: some View {
        ZStack {
            Color.nightBlack.ignoresSafeArea()
            switch viewModel.result {
            case .success(let data):
                ScrollView {
                    VStack {
                        if topInset > 0 {
                            Spacer(minLength: topInset)
                        }
                        WebImage(url: data.image)
                            .resizable()
                            .placeholder(content: {
                                ProgressView()
                            })
                            .transition(.fade(duration: 0.4))
                            .scaledToFit()
                            .frame(
                                width: UIScreen.main.bounds.width
                            )
                            .cornerRadius(16, corners: imageCorner)
                        VStack(alignment: .leading) {
                            OverviewView(
                                title: data.title,
                                releaseDate: data.getFormattedReleaseDate(),
                                rating: data.getFormattedRating()
                            )
                            .padding(.top, 16)
                            DescriptionView(description: data.description)
                                .padding(.top, 16)
                            let contentWidth = (UIScreen.main.bounds.width - 16 - (24 * 2)) / 2
                            HStack(alignment: .top) {
                                VStack {
                                    GenreView(genres: data.genres)
                                    PlatformView(platforms: data.platforms)
                                        .padding(.top, 16)
                                }
                                .frame(width: contentWidth)
                                Spacer(minLength: 16)
                                VStack {
                                    PublisherView(publisher: data.publisher)
                                    DeveloperView(developer: data.developer)
                                        .padding(.top, 16)
                                    AgeRatingView(ageRating: data.ageRating)
                                        .padding(.top, 16)
                                }
                                .frame(width: contentWidth)
                            }
                            .padding(.top, 16)
                        }
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24)
                        )
                    }
                }
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()
            case .empty:
                GeminkEmptyView(message: "Game not found")
            case .error(let message):
                GeminkErrorView(message: message) {
                    Task { await viewModel.getGameDetail(id: id) }
                }
            }
        }
        .ignoresSafeArea(.all)
        .padding(.bottom, 16)
        .foregroundColor(.white)
        .toolbar(.hidden, for: .tabBar)
        .task { await viewModel.getGameDetail(id: id) }
    }
}

extension DetailGameView {
    struct OverviewView: View {
        let title: String
        let releaseDate: String
        let rating: String
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .lineLimit(3)
                        .font(.title)
                    Text(releaseDate)
                        .font(.subheadline)
                }
                Spacer()
                HStack(alignment: .center) {
                    Text(rating)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
    struct DescriptionView: View {
        let description: String
        @State var isExpanded = false
        var body: some View {
            VStack {
                Text(description)
                    .font(.body)
                    .lineLimit(isExpanded ? nil : 4)
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut) {
                            isExpanded.toggle()
                        }
                    } label: {
                        Text(isExpanded ? "Show less" : "Read more")
                            .font(.footnote)
                    }
                    .padding(8)
                    .foregroundColor(.nightBlack)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
    struct GenreView: View {
        private var formattedGenre: String
        init(genres: [Genre]) {
            if genres.isEmpty {
                self.formattedGenre = "-"
            } else {
                self.formattedGenre = genres.map { genre in
                    genre.name
                }.joined(separator: ", ")
            }
        }
        var body: some View {
            LabelValueDetailView(
                label: "Genre",
                value: formattedGenre
            )
        }
    }
    struct PlatformView: View {
        private var formattedPlatform: String
        init(platforms: [Platform]) {
            if platforms.isEmpty {
                self.formattedPlatform = "-"
            } else {
                self.formattedPlatform = platforms.map { platform in
                    platform.name
                }.joined(separator: ", ")
            }
        }
        var body: some View {
            LabelValueDetailView(
                label: "Platforms",
                value: formattedPlatform
            )
        }
    }
    struct PublisherView: View {
        private var publisher: String
        init(publisher: Publisher?) {
            self.publisher = publisher?.name ?? "-"
        }
        var body: some View {
            LabelValueDetailView(
                label: "Publisher",
                value: publisher
            )
        }
    }
    struct DeveloperView: View {
        private var developer: String
        init(developer: Developer?) {
            self.developer = developer?.name ?? "-"
        }
        var body: some View {
            LabelValueDetailView(
                label: "Developer",
                value: developer
            )
        }
    }
    struct AgeRatingView: View {
        private var ageRating: String
        init(ageRating: AgeRating?) {
            self.ageRating = ageRating?.name ?? "-"
        }
        var body: some View {
            LabelValueDetailView(
                label: "Age Rating",
                value: ageRating
            )
        }
    }
    struct LabelValueDetailView: View {
        let label: String
        let value: String
        var body: some View {
            VStack(alignment: .leading) {
                Text(label)
                    .font(.footnote.weight(.medium))
                    .foregroundColor(.onyx)
                Text(value)
                    .font(.body)
                    .underline()
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DetailGameView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGameView(id: 28)
    }
}
