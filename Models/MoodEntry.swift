import Foundation

struct MoodEntry: Codable, Identifiable {
    let id: UUID
    let timestamp: Date
    let score: Int
    
    init(score: Int, timestamp: Date = Date()) {
        self.id = UUID()
        self.timestamp = timestamp
        self.score = score
    }
} 