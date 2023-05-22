//
//  AboutView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.nightBlack.ignoresSafeArea()
                VStack {
                    Image("about-pic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 192, height: 192)
                        .clipShape(Circle())
                        .padding(.bottom, 16)
                    Text("Abrar Wiryawan")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("abrarwiryawan@gmail.com")
                }
                .navigationTitle("About")
            }
        }
        .foregroundColor(.white)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
