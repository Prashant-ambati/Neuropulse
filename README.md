# NeuroPulse

**NeuroPulse** is a fully on-device, AI-powered focus and energy tracker designed for iOS 18+ (internal iOS 26 guidelines). It leverages the latest Apple technologies for privacy, intelligence, and adaptive design.

---

## 🚀 Project Overview
- **Modern Architecture:** Uses AppIntents, Widgets, Live Activities, and on-device CoreML—showing up-to-date iOS 18+ skills.
- **Privacy-First:** No network/cloud, all local storage—demonstrates privacy-first app design.
- **SwiftUI 6.0 & Accessibility:** Adaptive, accessible, and beautiful UI.
- **Machine Learning Integration:** Placeholder model demonstrates CoreML workflow understanding.
- **HealthKit/ScreenTime Hooks:** Shows knowledge of Apple's health and device APIs.
- **Well-Structured Codebase:** Clear separation of concerns (Models, Services, Views, etc.).

---

## ✅ What's Ready
- Architecture, folder structure, and code organization.
- Use of latest Apple frameworks and design patterns.
- Privacy and accessibility focus.

## 🚧 What's Half-Baked
- **No real CoreML model yet:** The model is a placeholder, not trained on real data.
- **HealthKit/ScreenTime:** Only partially implemented (dummy values).
- **UI/UX:** Some views are stubs or not fully interactive.
- **No App Store polish:** No icons, launch screen, or onboarding flow in-app.
- **Testing:** No unit/UI tests or real-world validation.

---

## 🛠️ Next Steps
- Replace the CoreML model placeholder with your trained `.mlmodel`.
- Expand HealthKit and ScreenTime data retrieval as APIs allow.
- Connect remaining UI elements and widgets to AppIntents and services for full interactivity.
- Test on-device for HealthKit/ScreenTime permissions and CoreML predictions.

---

## 🧠 Machine Learning
- Uses a local CoreML model (`FocusEnergyPredictor.mlmodel`) trained with CreateML.
- Inputs: TimeOfDay, MoodScore, SleepQuality (optional), StepCount (optional), ScreenTimeHours.
- Output: Predicted FocusLevel (0.0 to 1.0).

---

## 📜 Privacy
**Your data is processed securely on your device. No sync. No cloud. No tracking.**

On first launch, users see:
> "Your data is processed securely on your device. No sync. No cloud. No tracking."

---

## 📂 Project Structure
* AppIntentCommands/
* Models/
* Services/
* Views/
* Widgets/
* LiveActivities/
* SystemIntegration/
* UIConfig/

---

## 📚 References
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [CoreML](https://developer.apple.com/documentation/coreml)
- [HealthKit](https://developer.apple.com/documentation/healthkit)
- [WidgetKit](https://developer.apple.com/documentation/widgetkit)

---

## 🔗 Repository
[GitHub: Prashant-ambati/Neuropulse](https://github.com/Prashant-ambati/Neuropulse.git)

---

© 2024 NeuroPulse. All rights reserved. 