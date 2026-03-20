//
//  ContentView.swift
//  MiniTradeMe
//
//  Created by Euan Widjaja on 16/03/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                LatestListingsView(
                    viewModel: LatestListingsViewModel(
                        service: ConcreteListingService()
                    )
                )
            }
            .tabItem {
                Label(String(localized: "Latest"), systemImage: "house")
            }

            NavigationStack {
                WatchlistView()
            }
            .tabItem {
                Label(String(localized: "Watchlist"), systemImage: "eye")
            }

            NavigationStack {
                MyTradeMeView()
            }
            .tabItem {
                Label(String(localized: "My Trade Me"), systemImage: "person")
            }
        }
        .tint(TangramColors.tasman500)
    }
}

#Preview {
    ContentView()
}
