//
//  ErrorView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

struct GeminkErrorView: View {
    let message: String
    let action: () -> Void
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud")
                .font(.system(size: 128, weight: .semibold))
            Text(message)
                .padding(.top, 8)
                .foregroundColor(.red)
                .padding(.bottom, 16)
            Button {
                action()
            } label: {
                Text("Retry")
            }
            .padding(EdgeInsets(top: 16, leading: 36, bottom: 16, trailing: 36))
            .background(Color.eerieBlack)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GeminkErrorView(message: "Error") {
            // do something
        }
    }
}
