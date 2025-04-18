import SwiftUI
 

 struct ContentView: View {
  @State private var generatedContent: [String] = []
  @State private var settings = NumberSettings()
  @State private var questionCount = 10
  @State private var selectedUnit: Unit?
  @State private var selectedQuestionType: QuestionType?
 

  // Curriculum Data
  private let units = CurriculumManager.shared.grade9Units
 

  var body: some View {
  NavigationStack {
  Form {
  // MARK: - Curriculum Selection
  Section("Curriculum") {
  Picker("Select Unit", selection: $selectedUnit) {
  Text("None").tag(nil as Unit?)
  ForEach(CurriculumManager.shared.grade9Units) { unit in
  Text(unit.name).tag(unit as Unit?)
  }
  }
 

  if let unit = selectedUnit {
  NumberSenseView(selectedUnit: unit, selectedQuestionType: $selectedQuestionType)
  }
  }
 

  // MARK: - Universal Toggles
  Section("Generation Settings") {
  HStack {
  Text("Number of Questions:")
  TextField("Count", value: $questionCount, format: .number)
  #if os(iOS)
  .keyboardType(.numberPad)
  #endif
  .textFieldStyle(.roundedBorder)
  .frame(width: 80)
  .onChange(of: questionCount) { oldValue, newValue in
  questionCount = min(max(newValue, 1), 100)
  }
 

  Stepper("", value: $questionCount, in: 1...100)
  .labelsHidden()
  }
 

  NumberSettingsView(settings: $settings) // Only one instance here
  }
 

  // MARK: - Results
  Section("Results") {
  Button("Generate Content") {
  generateContent()
  }
  .buttonStyle(.borderedProminent)
 

  List(generatedContent, id: \.self) { item in
  Text(item)
  }
  }
  }
  .navigationTitle("Math Generator")
  .onChange(of: selectedUnit) { oldValue, newValue in
  selectedQuestionType = nil
  }
  }
  }
 

  private func generateContent() {
  let generator = NumberGenerator()
  generatedContent = generator.generateNumbers(
  count: questionCount,
  settings: settings
  )
 

  if let unit = selectedUnit, let type = selectedQuestionType {
  print("Generating \(questionCount) \(type.name) questions for \(unit.name)")
  }
  }
 }
 

 // Preview
 #Preview {
  ContentView()
 }
