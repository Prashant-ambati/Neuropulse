import Foundation

enum FocusSessionStatus: String, Codable {
    case active
    case completed
    case cancelled
}

struct FocusSession: Codable, Identifiable {
    let id: UUID
    let startTime: Date
    let duration: TimeInterval
    let status: FocusSessionStatus
    
    init(startTime: Date, duration: TimeInterval, status: FocusSessionStatus) {
        self.id = UUID()
        self.startTime = startTime
        self.duration = duration
        self.status = status
    }
} 