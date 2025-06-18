import Foundation
import UIKit

final class HapticsManager {
    static let shared = HapticsManager()
    private init() {}
    
    func trigger(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
} 