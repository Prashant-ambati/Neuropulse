import AppIntents

@available(iOS 18.0, *)
struct StartFocusIntent: AppIntent {
    static var title: LocalizedStringResource = "Start Focus Session"
    static var description = IntentDescription("Begin a new focus session to track your productivity and energy.")

    func perform() async throws -> some IntentResult {
        // TODO: Start a new focus session
        return .result()
    }
} 