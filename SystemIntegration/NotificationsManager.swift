import Foundation
import UserNotifications

final class NotificationsManager {
    static let shared = NotificationsManager()
    private init() {}
    
    func scheduleReminder(at date: Date, message: String) {
        let content = UNMutableNotificationContent()
        content.title = "NeuroPulse"
        content.body = message
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: max(date.timeIntervalSinceNow, 1), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
} 