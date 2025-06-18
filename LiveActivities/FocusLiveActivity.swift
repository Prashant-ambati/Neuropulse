import ActivityKit
import SwiftUI

struct FocusAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var remainingTime: TimeInterval
        var moodScore: Int
        var nextBreak: Date
    }
    var sessionID: UUID
}

@available(iOS 18.0, *)
struct FocusLiveActivityView: View {
    let context: ActivityViewContext<FocusAttributes>
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(Int(context.state.remainingTime/60)) min left")
                .font(.title2)
            Text(moodEmoji)
                .font(.system(size: 40))
            Text("Next break: \(breakString)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
    var moodEmoji: String {
        switch context.state.moodScore {
        case 8...10: return "😀"
        case 4...7: return "😐"
        default: return "😞"
        }
    }
    var breakString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: context.state.nextBreak)
    }
} 