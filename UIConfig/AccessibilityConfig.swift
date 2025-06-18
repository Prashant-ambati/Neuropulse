import SwiftUI

struct AccessibilityConfig {
    static func applyAccessibility(to view: some View, label: String, hint: String? = nil) -> some View {
        view.accessibilityLabel(Text(label))
            .accessibilityHint(Text(hint ?? ""))
    }
    // Add more accessibility helpers as needed
} 