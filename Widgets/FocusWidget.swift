import WidgetKit
import SwiftUI

struct FocusWidgetEntry: TimelineEntry {
    let date: Date
    let isActive: Bool
    let energyScore: Float
}

struct FocusWidget: Widget {
    let kind: String = "FocusWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: StartFocusIntent.self, provider: Provider()) { entry in
            FocusWidgetView(entry: entry)
        }
        .configurationDisplayName("Focus Session")
        .description("Start or stop a focus session and view your current energy score.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct FocusWidgetView: View {
    var entry: FocusWidgetEntry
    
    var body: some View {
        VStack(spacing: 12) {
            Text(entry.isActive ? "Focusing" : "Ready")
                .font(.headline)
            Text("Energy: \(String(format: "%.0f%%", entry.energyScore * 100))")
                .font(.title2)
            Button(entry.isActive ? "Stop" : "Start") {
                // TODO: Trigger AppIntent to start/stop session
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> FocusWidgetEntry {
        FocusWidgetEntry(date: Date(), isActive: false, energyScore: 0.8)
    }
    func getSnapshot(for configuration: StartFocusIntent, in context: Context, completion: @escaping (FocusWidgetEntry) -> ()) {
        completion(FocusWidgetEntry(date: Date(), isActive: false, energyScore: 0.8))
    }
    func getTimeline(for configuration: StartFocusIntent, in context: Context, completion: @escaping (Timeline<FocusWidgetEntry>) -> ()) {
        let entry = FocusWidgetEntry(date: Date(), isActive: false, energyScore: 0.8)
        completion(Timeline(entries: [entry], policy: .atEnd))
    }
} 