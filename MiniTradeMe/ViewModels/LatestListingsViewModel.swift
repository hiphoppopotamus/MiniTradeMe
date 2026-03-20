import Foundation

@Observable
@MainActor
class LatestListingsViewModel {

    var listings: [Listing] = []
    var loadingState: LoadingState = .loading
    var errorMessage: String?
    
    var showingPlaceholderAlert = false
    var alertMessage = ""
    
    private let service: ListingService
    
    init(service: ListingService) {
        self.service = service
    }
    
    func loadLatestListings() async {
        loadingState = .loading
        errorMessage = nil
        do {
            listings = try await service.fetchLatestListings()
            loadingState = .loaded
        } catch {
            loadingState = .error
            errorMessage = error.localizedDescription
        }
    }
    
    func onListingSelected(_ listing: Listing) {
        alertMessage = "Selected listing: \(listing.title)"
        showingPlaceholderAlert = true
    }
    
    func onSearchTapped() {
        alertMessage = "Search tapped"
        showingPlaceholderAlert = true
    }
    
    func onCartTapped() {
        alertMessage = "Cart tapped"
        showingPlaceholderAlert = true
    }
}

extension LatestListingsViewModel {
    enum LoadingState {
        case loading
        case loaded
        case error
    }
}
