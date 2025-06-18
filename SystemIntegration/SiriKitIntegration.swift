import Foundation
import AppIntents

@available(iOS 18.0, *)
final class SiriKitIntegration {
    static func registerIntents() {
        // Register AppIntents for Shortcuts and Spotlight
        AppIntents.register([StartFocusIntent.self, GetEnergyForecastIntent.self, LogMoodIntent.self])
    }
} 