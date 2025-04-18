import SwiftUI
 

 struct NumberSenseView: View {
  let selectedUnit: Unit
  @Binding var selectedQuestionType: QuestionType?
  @State private var activeToggles: [String: Bool] = [:]
  @State private var generatedQuestions: [String] = []
 

  var body: some View {
  Form {
  // Question Type Selection
  Picker("Question Type", selection: $selectedQuestionType) {
  Text("None").tag(nil as QuestionType?)
  ForEach(selectedUnit.questionTypes, id: \.id) { type in
  Text(type.name).tag(type as QuestionType?)
  }
  }
  // No explicit pickerStyle here - let it use the default
 

  // Dynamic Toggles
  if let type = selectedQuestionType {
  Section("Configuration") {
  ForEach(type.toggles, id: \.id) { toggle in
  Toggle(toggle.displayName,
  isOn: Binding(
  get: { activeToggles[toggle.id, default: toggle.defaultValue] },
  set: { activeToggles[toggle.id] = $0 }
  )
  )
  }
  }
 

  // Generation and Results
  Section {
  Button("Generate Questions") {
  generatedQuestions = generateQuestions(type: type, toggles: activeToggles)
  }
  .buttonStyle(.borderedProminent)
 

  List(generatedQuestions, id: \.self) { question in
  Text(question)
  }
  }
  }
  }
  .navigationTitle(selectedUnit.name)
  }
 

  private func generateQuestions(type: QuestionType, toggles: [String: Bool]) -> [String] {
  switch type.name {
  case "Simplifying Expressions":
  return SimplifyingExpressionGenerator.generate(settings: NumberSettings(), toggles: toggles)
  case "Fill in the Blanks":
  return FillInBlanksGenerator.generate(settings: NumberSettings(), toggles: toggles)
  case "Conversions":
  return ConversionGenerator.generate(settings: NumberSettings(), toggles: toggles)
  case "Evaluating Expressions":
  return BEDMASGenerator.generate(settings: NumberSettings(), toggles: toggles)
  case "Word Problems":
  return WordProblemGenerator.generate(settings: NumberSettings(), toggles: toggles)
  default:
  return ["Error: Unknown question type"]
  }
  }
 }
