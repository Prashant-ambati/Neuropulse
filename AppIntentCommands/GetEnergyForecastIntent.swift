import AppIntents

@available(iOS 18.0, *)
struct GetEnergyForecastIntent: AppIntent {
    static var title: LocalizedStringResource = "Get Energy Forecast"
    static var description = IntentDescription("Returns a natural language summary of your ideal focus window based on on-device intelligence.")

    func perform() async throws -> some IntentResult {
        // TODO: Generate and return energy forecast
        return .result()
    }
} 