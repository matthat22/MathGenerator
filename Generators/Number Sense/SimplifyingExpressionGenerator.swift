struct SimplifyingExpressionGenerator {
    static func generate(toggles: [String: Bool]) -> [String] {
        let includeFractions = toggles["includeFractions"] ?? false
        let includeNegatives = toggles["includeNegatives"] ?? false
        
        // Example generation logic
        if includeFractions {
            return ["Simplify: 2/3 + (-4/5)", "Simplify: 1/2 × 3/4"]
        } else {
            return ["Simplify: -5 + 3 - 2", "Simplify: 10 ÷ (-2)"]
        }
    }
}
