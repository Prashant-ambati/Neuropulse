import SwiftUI

struct WeeklyEnergyGraphView: View {
    let energyLevels: [Float] // 7 values, one per day
    @Namespace private var animation
    
    init() {
        let entries = MoodLogService.shared.fetchMoodEntries()
        var levels = Array(repeating: Float(0.5), count: 7)
        let calendar = Calendar.current
        for entry in entries {
            let weekday = calendar.component(.weekday, from: entry.timestamp) - 1
            if weekday >= 0 && weekday < 7 {
                levels[weekday] = Float(entry.score) / 10.0
            }
        }
        self.energyLevels = levels
    }
    
    var body: some View {
        ZStack {
            Canvas { context, size in
                let center = CGPoint(x: size.width/2, y: size.height/2)
                let radius = min(size.width, size.height) / 2 - 16
                let angleStep = .pi * 2 / CGFloat(energyLevels.count)
                for (i, level) in energyLevels.enumerated() {
                    let angle = angleStep * CGFloat(i) - .pi/2
                    let valueRadius = radius * CGFloat(level)
                    let point = CGPoint(x: center.x + cos(angle) * valueRadius, y: center.y + sin(angle) * valueRadius)
                    var path = Path()
                    path.move(to: center)
                    path.addLine(to: point)
                    context.stroke(path, with: .color(.tint), lineWidth: 4)
                }
            }
            .frame(width: 220, height: 220)
            .matchedGeometryEffect(id: "radialGraph", in: animation)
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
} 