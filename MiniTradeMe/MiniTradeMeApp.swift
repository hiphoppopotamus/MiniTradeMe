//
//  MiniTradeMeApp.swift
//  MiniTradeMe
//
//  Created by Euan Widjaja on 16/03/2026.
//

import SwiftUI

@main
struct MiniTradeMeApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(TangramColors.bluffOyster800)]
        appearance.titleTextAttributes = [.foregroundColor: UIColor(TangramColors.bluffOyster800)]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
