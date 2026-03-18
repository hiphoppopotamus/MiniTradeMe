# MiniTradeMe

A SwiftUI iOS app that displays the latest listings from the Trade Me Sandbox API.

## Requirements

- **Xcode** 26.0+
- **iOS** 26.0+
- No third-party dependencies — open `MiniTradeMe.xcodeproj` and run.

## What's implemented (_among others..._)

- **Latest Listings tab** that fetches 20 rows of the most recent listings from `api.tmsandbox.co.nz` via OAuth 1.0 and displays them in a list. 
- **Listing rows** — show image (`AsyncImage`), title, region, and price. Differentiates between auction-style (current bid + optional Buy Now) and classified listings (asking price).
- **Loading & error states** — `ProgressView` while loading; error view with a retry button on failure.
- **Tab bar** — Latest, Watchlist, and My Trade Me tabs (Watchlist and My Trade Me are placeholders and unimplemented).

## Running the project

1. Open `MiniTradeMe.xcodeproj` in Xcode.
2. Select an iOS 26+ simulator or device.
3. Build & Run (**Cmd + R**).

No API keys or environment setup needed — sandbox OAuth credentials are included in the source!
