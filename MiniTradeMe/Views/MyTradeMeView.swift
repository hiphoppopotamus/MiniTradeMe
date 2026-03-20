//
//  MyTradeMeView.swift
//  MiniTradeMe
//
//  Created by Euan Widjaja on 16/03/2026.
//

import SwiftUI

private enum Strings {
    static let title = String(localized: "My Trade Me")
}

private enum Images {
    static let person = "person"
}

struct MyTradeMeView: View {
    var body: some View {
        ContentUnavailableView(
            Strings.title,
            systemImage: Images.person,
            description: Text("Implement me!")
        )
        .navigationTitle(Strings.title)
    }
}

#Preview {
    NavigationStack {
        MyTradeMeView()
    }
}
