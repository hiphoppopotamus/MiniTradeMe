import Foundation

struct Listing: Identifiable, Codable {
    let id: Int
    let title: String
    let imageURL: String?
    let region: String
    /// Present on Property/Business listings; missing on Motor, Gaming, etc. Nil treated as non-classified (auction style).
    let isClassified: Bool?
    let priceDisplay: String /// Auction price or classified price
    let buyNowPrice: Double? /// If listing is an auction, then may provide buy now price
    
    enum CodingKeys: String, CodingKey {
        case id = "ListingId"
        case title = "Title"
        case imageURL = "PictureHref"
        case region = "Region"
        case isClassified = "IsClassified"
        case priceDisplay = "PriceDisplay"
        case buyNowPrice = "BuyNowPrice"
    }
}

struct ListingResponse: Codable {
    let list: [Listing]
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}

extension Listing {
    static let mockListings: [Listing] = [
        Listing(
            id: 1,
            title: "My Honda Fit",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Auckland",
            isClassified: false,
            priceDisplay: "$1,000.00",
            buyNowPrice: 3000.00
        ),
        Listing(
            id: 2,
            title: "My Apartment in Mount Cook",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Wellington",
            isClassified: true,
            priceDisplay: "$250 per week",
            buyNowPrice: nil
        ),
        Listing(
            id: 3,
            title: "My iPhone 14 Pro Max",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Canterbury",
            isClassified: false,
            priceDisplay: "$1,200.00",
            buyNowPrice: 1500.00
        ),
        Listing(
            id: 4,
            title: "Leather Couch",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Wellington",
            isClassified: false,
            priceDisplay: "$350.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 5,
            title: "Professional Cat Walking Service",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Otago",
            isClassified: true,
            priceDisplay: "$25.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 6,
            title: "Vintage Record Player",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Waikato",
            isClassified: false,
            priceDisplay: "$180.00",
            buyNowPrice: 250.00
        ),
        Listing(
            id: 7,
            title: "3-Bedroom House in Ponsonby",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Auckland",
            isClassified: true,
            priceDisplay: "$850 per week",
            buyNowPrice: nil
        ),
        Listing(
            id: 8,
            title: "Mountain Bike - Giant Talon 2",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Bay of Plenty",
            isClassified: false,
            priceDisplay: "$600.00",
            buyNowPrice: 850.00
        ),
        Listing(
            id: 9,
            title: "Samsung 65\" OLED TV",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Wellington",
            isClassified: false,
            priceDisplay: "$1,800.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 10,
            title: "Freelance Web Design Services",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Canterbury",
            isClassified: true,
            priceDisplay: "$80.00/hr",
            buyNowPrice: nil
        ),
        Listing(
            id: 11,
            title: "Kayak - 2 Person Inflatable",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Northland",
            isClassified: false,
            priceDisplay: "$320.00",
            buyNowPrice: 450.00
        ),
        Listing(
            id: 12,
            title: "Breville Espresso Machine",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Auckland",
            isClassified: false,
            priceDisplay: "$420.00",
            buyNowPrice: 550.00
        ),
        Listing(
            id: 13,
            title: "Piano Lessons - All Levels",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Manawatu",
            isClassified: true,
            priceDisplay: "$45.00/hr",
            buyNowPrice: nil
        ),
        Listing(
            id: 14,
            title: "2020 Mazda CX-5 GSX",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Hawke's Bay",
            isClassified: false,
            priceDisplay: "$28,500.00",
            buyNowPrice: 32000.00
        ),
        Listing(
            id: 15,
            title: "Standing Desk - Electric Adjustable",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Wellington",
            isClassified: false,
            priceDisplay: "$275.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 16,
            title: "Studio Apartment CBD",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Auckland",
            isClassified: true,
            priceDisplay: "$380 per week",
            buyNowPrice: nil
        ),
        Listing(
            id: 17,
            title: "Nintendo Switch OLED + Games",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Canterbury",
            isClassified: false,
            priceDisplay: "$450.00",
            buyNowPrice: 520.00
        ),
        Listing(
            id: 18,
            title: "Lawn Mowing - Weekly Service",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Taranaki",
            isClassified: true,
            priceDisplay: "$40.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 19,
            title: "Dining Table - Solid Rimu 6-Seater",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Southland",
            isClassified: false,
            priceDisplay: "$700.00",
            buyNowPrice: 900.00
        ),
        Listing(
            id: 20,
            title: "Canon EOS R6 Camera Body",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Waikato",
            isClassified: false,
            priceDisplay: "$2,100.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 21,
            title: "Dog Grooming Mobile Service",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Bay of Plenty",
            isClassified: true,
            priceDisplay: "$60.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 22,
            title: "Weber BBQ - Genesis II",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Auckland",
            isClassified: false,
            priceDisplay: "$550.00",
            buyNowPrice: 700.00
        ),
        Listing(
            id: 23,
            title: "Surfboard 6'2 Shortboard",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Gisborne",
            isClassified: false,
            priceDisplay: "$380.00",
            buyNowPrice: nil
        ),
        Listing(
            id: 24,
            title: "Room Available in Flat",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Otago",
            isClassified: true,
            priceDisplay: "$195 per week",
            buyNowPrice: nil
        ),
        Listing(
            id: 25,
            title: "MacBook Pro M3 14-inch",
            imageURL: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*mBpby2GMvKClm14b0O7-gg.jpeg",
            region: "Wellington",
            isClassified: false,
            priceDisplay: "$2,800.00",
            buyNowPrice: 3200.00
        ),
    ]
}
