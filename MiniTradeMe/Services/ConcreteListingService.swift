import Foundation

struct ConcreteListingService: ListingService {
    private let baseURL = "https://api.tmsandbox.co.nz/v1/listings/latest.json"
    private let oauthHeader = "OAuth oauth_consumer_key=A1AC63F0332A131A78FAC304D007E7D1,oauth_signature_method=PLAINTEXT,oauth_signature=EC7F18B17A062962C6930A8AE88B16C7&"

    func fetchLatestListings() async throws -> [Listing] {
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "rows", value: "20")
        ]
        var request = URLRequest(url: components.url!)
        request.setValue(oauthHeader, forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decodedResponse = try JSONDecoder().decode(ListingResponse.self, from: data)
        return decodedResponse.list
    }
}
