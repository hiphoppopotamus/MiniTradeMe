# MiniTradeMe

A SwiftUI iOS app that displays the latest listings from the Trade Me Sandbox API.

## Requirements

- **Xcode** 26.0+
- **iOS** 26.0+
- No third-party dependencies — open `MiniTradeMe.xcodeproj` and run.

## Architecture

**MVVM** with protocol-based dependency injection.

```
MiniTradeMe/
├── Models/              # Listing, ListingResponse (Codable structs)
├── Views/               # SwiftUI views (LatestListingsView, ListingRowView, etc.)
├── ViewModels/          # LatestListingsViewModel (@Observable, @MainActor)
├── Services/            # ListingService protocol + ConcreteListingService, MockListingService
└── MiniTangram/         # Trade Me Tangram design-system colours
```

### Key decisions

| Decision | Rationale |
|---|---|
| `@Observable` (Swift Observation) over `ObservableObject` | Modern, less boilerplate, finer-grained UI updates |
| `ListingService` protocol with concrete & mock implementations | Enables SwiftUI previews and unit testing without network calls |
| `async/await` + `URLSession` | Native Swift concurrency, no need for Combine or third-party networking |
| `@MainActor` on ViewModel | Guarantees UI state is updated on the main thread |
| Private `Strings` / `Images` / `Dimensions` enums in views | Keeps magic values out of the view body |

## What's implemented

- **Latest Listings tab** — fetches the 20 most recent listings from `api.tmsandbox.co.nz` via OAuth 1.0 and displays them in a list.
- **Listing rows** — show image (`AsyncImage`), title, region, and price. Differentiates between auction-style (current bid + optional Buy Now) and classified listings (asking price).
- **Loading & error states** — `ProgressView` while loading; error view with a retry button on failure.
- **Tab bar** — Latest, Watchlist, and My Trade Me tabs (Watchlist and My Trade Me are placeholders).

## Running the project

1. Open `MiniTradeMe.xcodeproj` in Xcode.
2. Select an iOS 26+ simulator or device.
3. Build & Run (**Cmd + R**).

No API keys or environment setup needed — sandbox OAuth credentials are included in the source.
