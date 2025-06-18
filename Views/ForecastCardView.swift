import SwiftUI

struct ForecastCardView: View {
    let forecast: FocusForecast
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's Focus Forecast")
                .font(.headline)
            Text("Focus Level: \(String(format: "%.0f%%", forecast.predictedFocusLevel * 100))")
                .font(.title2)
                .bold()
            Text("Confidence: \(String(format: "%.0f%%", forecast.confidence * 100))")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(windowString)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
    
    var windowString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "Best: \(formatter.string(from: forecast.forecastWindow.start))–\(formatter.string(from: forecast.forecastWindow.end))"
    }
} 