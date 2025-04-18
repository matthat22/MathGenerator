struct FillInBlanksGenerator: QuestionGenerator {
    static let requiredToggles = ["operationTypes", "requireNegativeSolutions"]
    
    static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [String] {
        let operations = ["+", "-", "×", "÷"].shuffled()
        let missingPos = Int.random(in: 0...2)
        let nums = (1...2).map { _ in Int.random(in: 1...9) }
        
        var components = ["\(nums[0])", "__", "\(nums[1])", "=", "?"]
        components[missingPos] = "__"
        
        return ["Fill in the blanks: \(components.joined(separator: " "))"]
    }
}
