import SwiftUI

private enum Strings {
    static let title = String(localized: "Latest listings")
    
    static let alertTitle = String(localized: "Placeholder")
    static let alertOk = String(localized: "OK")
    static let alertSearch = String(localized: "Searching initiated...")
    static let alertCart = String(localized: "Cart initiated...")
}

private enum Images {
    static let search = "magnifyingglass"
    static let cart = "cart"
    static let bird = "bird"
}

struct LatestListingsView: View {
    
    @State private var viewModel: LatestListingsViewModel
    
    init(viewModel: LatestListingsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .loading:
                ProgressView()
            case .loaded:
                List(viewModel.listings) { listing in
                    Button {
                        viewModel.onListingSelected(listing)
                    } label: {
                        ListingRowView(listing: listing)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { _ in .zero }
                }
                .listStyle(.plain)
            case .error:
                ReloadPageView(message: viewModel.errorMessage) {
                    Task { @MainActor in
                        await viewModel.loadLatestListings()
                    }
                }
            }
        }
        .navigationTitle(Strings.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.onSearchTapped()
                } label: {
                    Image(systemName: Images.search)
                }
                .tint(TangramColors.tasman500)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.onCartTapped()
                } label: {
                    Image(systemName: Images.cart)
                }
                .tint(TangramColors.tasman500)
            }
        }
        .alert(Strings.alertTitle, isPresented: $viewModel.showingPlaceholderAlert) {
            Button(Strings.alertOk, role: .cancel) {}
        } message: {
            Text(viewModel.alertMessage)
        }
        .task {
            await viewModel.loadLatestListings()
        }
    }
}

#Preview {
    LatestListingsView(viewModel: LatestListingsViewModel(service: MockListingService()))
}
