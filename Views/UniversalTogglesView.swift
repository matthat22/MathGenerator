import SwiftUI

 struct UniversalTogglesView: View {
  @Binding var questionCount: Int
  @Binding var randomizeOrder: Bool
  @Binding var showAnswerKey: Bool

  var body: some View {
  Section("Global Settings") {
  HStack {
  Text("Questions:")
  TextField("Count", value: $questionCount, format: .number)
  #if os(iOS)
  .keyboardType(.numberPad)
  .textFieldStyle(.roundedBorder)
  #else
  .textFieldStyle(.squareBorder) // Or another appropriate style for macOS
  #endif
  .frame(width: 60)
  .onChange(of: questionCount) { oldValue, newValue in
  questionCount = min(max(newValue, 1), 100)
  }

  Stepper("", value: $questionCount, in: 1...100)
  .labelsHidden()
  }

  Toggle("Randomize Order", isOn: $randomizeOrder)
  Toggle("Show Answer Key", isOn: $showAnswerKey)
  }
  }
 }
