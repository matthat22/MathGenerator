import Foundation

struct ConversionGenerator: QuestionGenerator {
    static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [String] {
        // Safely unwrap the optional Bool? and provide a default value
        let toFraction = toggles["conversionDirection"] ?? true
        let allowRepeating = toggles["allowRepeatingDecimals"] ?? false

        if toFraction {
            let decimal = allowRepeating ? "0.\\overline{3}" : "0.75"
            return ["Convert to fraction: \(decimal)"]
        } else {
            let fraction = "\(Int.random(in: 1...3))/\(Int.random(in: 2...4))"
            return ["Convert to decimal: \(fraction)"]
        }
    }
}
