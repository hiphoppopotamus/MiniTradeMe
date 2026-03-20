import SwiftUI

private enum Strings {
    static let reloadPageTitle = String(localized: "Can't load page")
    static let reloadPageMessage = String(localized: "Something went wrong.")
    static let retryButtonTitle = String(localized: "Retry")
}

private enum Images {
    static let wifiExclamationmark = "wifi.exclamationmark"
}

struct ReloadPageView: View {
    
    let message: String?
    let retryAction: () -> Void
    var body: some View {
        
        ContentUnavailableView {
            Label(Strings.reloadPageTitle, systemImage: Images.wifiExclamationmark)
        } description: {
            Text(message ?? Strings.reloadPageMessage)
        } actions: {
            Button(Strings.retryButtonTitle, action: retryAction)
                .buttonStyle(.borderedProminent)
                .tint(TangramColors.tasman500)
        }
    }
}
