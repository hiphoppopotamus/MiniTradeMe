import SwiftUI

enum TangramColors {
    static let tasman500 = Color(hex: "#148FE2")
    static let feijoa500 = Color(hex: "#29A754")
    static let bluffOyster800 = Color(hex: "#393531")
    static let bluffOyster600 = Color(hex: "#85807B")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double((rgbValue & 0x0000FF)) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
