import Foundation

 class CurriculumManager {
  static let shared = CurriculumManager()

  private(set) var grade9Units: [Unit] = []

  init() {
  loadGrade9Curriculum()
  }

  private func loadGrade9Curriculum() {
  guard let url = Bundle.main.url(forResource: "Grade9Units", withExtension: "json") else {
  fatalError("Missing Grade9Units.json")
  }

  do {
  let data = try Data(contentsOf: url)
  let decoder = JSONDecoder()
  grade9Units = try decoder.decode([Unit].self, from: data)
  } catch {
  print("Error loading curriculum:", error)
  // Fallback to default units if decoding fails
  grade9Units = defaultUnits()
  }
  }

  private func defaultUnits() -> [Unit] {
  return [
  Unit(name: "Number Sense & Operations", questionTypes: [
  QuestionType(name: "Calculations", description: "Basic calculations", toggles: [
  QuestionType.ToggleOption(
  id: "allowFractions",
  displayName: "Allow Fractions",
  defaultValue: false
  ),
  QuestionType.ToggleOption(
  id: "allowDecimals",
  displayName: "Allow Decimals",
  defaultValue: false
  )
  ]),
  QuestionType(name: "Word Problems", description: "Solve word problems", toggles: [
  QuestionType.ToggleOption(
  id: "realWorldContext",
  displayName: "Real-World Context",
  defaultValue: true
  )
  ])
  ]),
  Unit(name: "Linear Relations", questionTypes: [
  QuestionType(name: "Graph Plotting", description: "Plot linear graphs", toggles: [
  QuestionType.ToggleOption(id: "showGrid", displayName: "Show Grid", defaultValue: true)
  ])
  ])
  ]
  }
 }

 extension CurriculumManager {
  private static let numberSenseToggles: [String: QuestionType.ToggleOption] = [
  "includeFractions": .init(
  id: "includeFractions",
  displayName: "Include Fractions",
  defaultValue: false
  )
  // Add other toggles from the JSON here
  ]

  func getToggle(for id: String) -> QuestionType.ToggleOption? {
  Self.numberSenseToggles[id]
  }
 }
