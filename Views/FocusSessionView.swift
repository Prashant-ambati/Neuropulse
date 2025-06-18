import SwiftUI

struct FocusSessionView: View {
    @State private var elapsed: TimeInterval = 0
    @State private var isActive: Bool = false
    let session: FocusSession
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Focus Session")
                .font(.largeTitle)
                .bold()
            Text(timeString)
                .font(.system(size: 48, weight: .semibold, design: .rounded))
                .monospacedDigit()
                .padding()
            Button(isActive ? "End" : "Start") {
                isActive.toggle()
                HapticsManager.shared.trigger(isActive ? .medium : .light)
                if isActive {
                    // Fetch HealthKit and ScreenTime data for prediction
                    HealthKitService.shared.fetchStepCount(for: Date()) { steps in
                        ScreenTimeService.shared.fetchScreenTimeHours(for: Date()) { screenTime in
                            // Use EnergyModelService or FocusEnergyPredictor to predict focus
                            let _ = FocusEnergyPredictor.shared.predict(
                                timeOfDay: Double(Calendar.current.component(.hour, from: Date())),
                                moodScore: 5, // Replace with actual mood
                                sleepQuality: nil, // Replace with actual sleep
                                stepCount: steps,
                                screenTimeHours: screenTime
                            )
                        }
                    }
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .onReceive(timer) { _ in
            if isActive { elapsed += 1 }
        }
    }
    
    var timeString: String {
        let total = Int(elapsed)
        let minutes = total / 60
        let seconds = total % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
} 