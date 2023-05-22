//
//  EmptyView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

struct GeminkEmptyView: View {
    
    let message: String
    
    var body: some View {
        VStack {
            Image(systemName: "lamp.desk")
                .font(.system(size: 128, weight: .semibold))
            Text(message)
                .padding(.top, 8)
                .padding(.bottom, 16)
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        GeminkEmptyView(message: "Empty")
    }
}
