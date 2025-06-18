import Foundation

struct FocusForecast: Codable {
    let predictedFocusLevel: Float // 0.0 to 1.0
    let confidence: Float // 0.0 to 1.0
    let forecastWindow: DateInterval
} 