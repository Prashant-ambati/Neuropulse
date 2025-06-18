import WidgetKit
import SwiftUI

struct MoodQuickLogEntry: TimelineEntry {
    let date: Date
}

struct MoodQuickLogWidget: Widget {
    let kind: String = "MoodQuickLogWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MoodQuickLogWidgetView(entry: entry)
        }
        .configurationDisplayName("Mood Quick Log")
        .description("Log your mood instantly with a single tap.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct MoodQuickLogWidgetView: View {
    var entry: MoodQuickLogEntry
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach([("😀", 10), ("😐", 5), ("😞", 1)], id: \.(0)) { emoji, score in
                Button(emoji) {
                    // TODO: Log mood score via AppIntent
                }
                .buttonStyle(.plain)
                .font(.system(size: 32))
            }
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> MoodQuickLogEntry {
        MoodQuickLogEntry(date: Date())
    }
    func getSnapshot(in context: Context, completion: @escaping (MoodQuickLogEntry) -> ()) {
        completion(MoodQuickLogEntry(date: Date()))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<MoodQuickLogEntry>) -> ()) {
        let entry = MoodQuickLogEntry(date: Date())
        completion(Timeline(entries: [entry], policy: .atEnd))
    }
} 