import SwiftUI

private enum Strings {
    static let title = String(localized: "Watchlist")
}

private enum Images {
    static let eye = "eye"
}

struct WatchlistView: View {
    var body: some View {
        ContentUnavailableView(
            Strings.title,
            systemImage: Images.eye,
            description: Text("Implement me!")
        )
        .navigationTitle(Strings.title)
    }
}

#Preview {
    NavigationStack {
        WatchlistView()
    }
}
