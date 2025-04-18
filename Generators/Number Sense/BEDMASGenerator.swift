struct BEDMASGenerator: QuestionGenerator {
    static let requiredToggles = ["exponentComplexity", "nestedParentheses"]
    
    static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [String] {
        let baseExpr = "\(Int.random(in: 2...5)) \(["+", "-", "×"].randomElement()!) \(Int.random(in: 2...5))"
        let withParens = "(\(baseExpr)) \(["+", "-"].randomElement()!) \(Int.random(in: 2...5))"
        
        return ["Evaluate: \(withParens)"]
    }
}
