import Foundation

final class FocusPlanService {
    static let shared = FocusPlanService()
    private init() {}
    
    func generatePlan(from forecast: FocusForecast) -> String {
        // Example: "You focus best 9:30–11:00 AM"
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let start = formatter.string(from: forecast.forecastWindow.start)
        let end = formatter.string(from: forecast.forecastWindow.end)
        return "You focus best \(start)–\(end)"
    }
} 