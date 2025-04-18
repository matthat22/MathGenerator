struct WordProblemGenerator: QuestionGenerator {
    static let requiredToggles = ["contextType", "multiStep"]
    
    static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [String] {
        let contexts = [
            "finance": "If you save $\(Int.random(in: 5...20)) each week for \(Int.random(in: 3...6)) weeks...",
            "science": "A chemical reaction uses \(Int.random(in: 2...5))mL per trial..."
        ]
        
        let contextKey = toggles["contextType"] ?? false ? "finance" : "science"
        return ["Problem: \(contexts[contextKey]!) How much in total?"]
    }
}
