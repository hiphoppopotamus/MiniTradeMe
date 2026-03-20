struct MockListingService: ListingService {
    func fetchLatestListings() async throws -> [Listing] {
        return Listing.mockListings
    }
}
