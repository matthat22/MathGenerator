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
                QuestionType(name: "Calculations", toggles: ["allowFractions", "allowDecimals"]),
                QuestionType(name: "Word Problems", toggles: ["realWorldContext"])
            ]),
            Unit(name: "Linear Relations", questionTypes: [
                QuestionType(name: "Graph Plotting", toggles: ["showGrid"])
            ])
        ]
    }
}

extension CurriculumManager {
    private static let numberSenseToggles: [String: QuestionType.ToggleOption] = [
        "includeFractions": .init(id: "includeFractions",
                                displayName: "Include Fractions",
                                defaultValue: false),
        // Add other toggles from the JSON here
    ]
    
    func getToggle(for id: String) -> QuestionType.ToggleOption? {
        Self.numberSenseToggles[id]
    }
}
