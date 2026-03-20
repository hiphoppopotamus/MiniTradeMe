protocol ListingService {
    func fetchLatestListings() async throws -> [Listing]
}
