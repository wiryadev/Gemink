//
//  NavigationBarExt.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import SwiftUI

extension View {
    /// Sets the text color for a navigation bar title.
    /// - Parameter color: Color the title should be
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor() -> some View {
    
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.nightBlack
        UITabBar.appearance().backgroundColor = UIColor.eerieBlack
        UITabBar.appearance().barTintColor = UIColor.eerieBlack
        
        return self
    }
}


