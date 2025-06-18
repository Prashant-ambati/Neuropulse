import Foundation

final class MoodLogService {
    static let shared = MoodLogService()
    private let storageKey = "MoodEntries"
    
    private init() {}
    
    func saveMoodEntry(_ entry: MoodEntry) {
        var entries = fetchMoodEntries()
        entries.append(entry)
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    func fetchMoodEntries() -> [MoodEntry] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let entries = try? JSONDecoder().decode([MoodEntry].self, from: data) else {
            return []
        }
        return entries
    }
} 