import SwiftUI

private enum Strings {
    static let askingPriceLabel = String(localized: "Asking price")
    static let currentBidLabel = String(localized: "Current bid")
    static let buyNowLabel = String(localized: "Buy Now")
}

private enum Dimensions {
    static let listingImageSize: CGFloat = 100.0
    static let listingSpacing: CGFloat = 10.0
}

struct ListingRowView: View {

    let listing: Listing
    
    var body: some View {
        HStack(spacing: Dimensions.listingSpacing) {
            AsyncImage(url: listing.imageURL.flatMap { URL(string: $0) }) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                case .failure, .empty:
                    placeholderImage
                @unknown default:
                    placeholderImage
                }
            }
            .frame(width: Dimensions.listingImageSize, height: Dimensions.listingImageSize)

            VStack(alignment: .leading, spacing: .zero) {
                VStack(alignment: .leading, spacing: .zero) {
                    Text(listing.region)
                        .font(.footnote)
                        .foregroundStyle(TangramColors.bluffOyster600)
                    Text(listing.title)
                        .font(.headline)
                        .foregroundStyle(TangramColors.bluffOyster800)
                }
                Spacer()
                HStack {
                    if let isClassified = listing.isClassified {
                        if isClassified {
                            priceLabel(price: listing.priceDisplay, label: Strings.askingPriceLabel)
                        } else {
                            priceLabel(price: listing.priceDisplay, label: Strings.currentBidLabel)
                            Spacer()
                            if let buyNowPrice = listing.buyNowPrice {
                                priceLabel(
                                    price: "$\(String(format: "%.2f", buyNowPrice))",
                                    label: Strings.buyNowLabel
                                )
                            }
                        }
                    } else {
                        priceLabel(price: listing.priceDisplay, label: Strings.currentBidLabel)
                        Spacer()
                        if let buyNowPrice = listing.buyNowPrice {
                            priceLabel(
                                price: "$\(String(format: "%.2f", buyNowPrice))",
                                label: Strings.buyNowLabel
                            )
                        }
                    }
                }
            }
        }
    }
    
    private func priceLabel(price: String, label: String) -> some View {
        return VStack(alignment: .leading, spacing: .zero) {
            Text(price)
                .font(.headline)
                .foregroundStyle(TangramColors.bluffOyster800)
            Text(label)
                .font(.footnote)
                .foregroundStyle(TangramColors.bluffOyster600)
        }
    }
    
    private var placeholderImage: some View {
        Image("PlaceholderImage")
            .resizable()
            .scaledToFit()
            .frame(width: Dimensions.listingImageSize, height: Dimensions.listingImageSize)
    }
}

#Preview {
    List {
        ListingRowView(listing: Listing.mockListings[0])
        ListingRowView(listing: Listing.mockListings[1])
    }
    .listStyle(.plain)
}
