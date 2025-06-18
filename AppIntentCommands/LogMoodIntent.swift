import AppIntents

@available(iOS 18.0, *)
struct LogMoodIntent: AppIntent {
    static var title: LocalizedStringResource = "Log Mood"
    static var description = IntentDescription("Save your current mood and alertness score securely on-device.")

    @Parameter(title: "Mood Score", default: 5)
    var moodScore: Int

    func perform() async throws -> some IntentResult {
        let entry = MoodEntry(score: moodScore)
        MoodLogService.shared.saveMoodEntry(entry)
        return .result()
    }
} 