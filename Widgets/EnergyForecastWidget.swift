import WidgetKit
import SwiftUI

struct EnergyForecastEntry: TimelineEntry {
    let date: Date
    let forecast: FocusForecast
}

struct EnergyForecastWidget: Widget {
    let kind: String = "EnergyForecastWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            EnergyForecastWidgetView(entry: entry)
        }
        .configurationDisplayName("Energy Forecast")
        .description("See your next best focus block.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct EnergyForecastWidgetView: View {
    var entry: EnergyForecastEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Next Focus Block")
                .font(.headline)
            Text(windowString)
                .font(.title3)
            Text("Confidence: \(String(format: "%.0f%%", entry.forecast.confidence * 100))")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
    
    var windowString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "\(formatter.string(from: entry.forecast.forecastWindow.start))–\(formatter.string(from: entry.forecast.forecastWindow.end))"
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> EnergyForecastEntry {
        let forecast = FocusForecast(predictedFocusLevel: 0.8, confidence: 0.9, forecastWindow: DateInterval(start: Date(), duration: 3600))
        return EnergyForecastEntry(date: Date(), forecast: forecast)
    }
    func getSnapshot(in context: Context, completion: @escaping (EnergyForecastEntry) -> ()) {
        let forecast = FocusForecast(predictedFocusLevel: 0.8, confidence: 0.9, forecastWindow: DateInterval(start: Date(), duration: 3600))
        completion(EnergyForecastEntry(date: Date(), forecast: forecast))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<EnergyForecastEntry>) -> ()) {
        let forecast = FocusForecast(predictedFocusLevel: 0.8, confidence: 0.9, forecastWindow: DateInterval(start: Date(), duration: 3600))
        let entry = EnergyForecastEntry(date: Date(), forecast: forecast)
        completion(Timeline(entries: [entry], policy: .atEnd))
    }
} 