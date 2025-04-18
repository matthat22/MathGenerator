import Foundation

class NumberGenerator {

    func generateNumbers(count: Int, settings: NumberSettings) -> [String] { // Using NumberSettings
        (0..<count).map { _ in generateSingleNumber(settings: settings) }
    }

    private func generateSingleNumber(settings: NumberSettings) -> String { // Using NumberSettings
        let availableTypes = getAvailableNumberTypes(settings: settings)
        let selectedType = availableTypes.randomElement() ?? .integer

        switch selectedType {
        case .integer: return generateInteger(settings: settings)
        case .decimal: return generateDecimal(settings: settings)
        case .fraction: return generateFraction(settings: settings)
        }
    }

    // MARK: - Helper Methods
    private enum NumberType { case integer, decimal, fraction }

    private func getAvailableNumberTypes(settings: NumberSettings) -> [NumberType] { // Using NumberSettings
        var types = [NumberType]()
        if true { types.append(.integer) } // settings.allowsIntegers is not in NumberSettings
        if settings.allowsDecimals { types.append(.decimal) }
        if settings.fractionType != nil { types.append(.fraction) }
        return types
    }

    private func generateInteger(settings: NumberSettings) -> String { // Using NumberSettings
        let sign = settings.allowsNegatives && Bool.random() ? "-" : ""
        return "\(sign)\(Int.random(in: 1...settings.maxNumber))"
    }

    private func generateDecimal(settings: NumberSettings) -> String { // Using NumberSettings
        let sign = settings.allowsNegatives && Bool.random() ? "-" : ""
        let whole = Int.random(in: 0...settings.maxNumber)
        let fraction = Int.random(in: 1...99) // Keep it to 2 decimal places for simplicity
        return "\(sign)\(whole).\(String(format: "%02d", fraction))"
    }

    private func generateFraction(settings: NumberSettings) -> String { // Using NumberSettings
        guard let fractionType = settings.fractionType else { return "1" }

        let denominator = Int.random(in: 2...settings.maxNumber)
        let numerator: Int

        switch fractionType {
        case .properOnly:
            numerator = denominator <= 2 ? 1 :
                (Double.random(in: 0...1) < 0.7 ? Int.random(in: 2..<denominator) : 1)

        case .improperAllowed:
            numerator = Int.random(in: 1...(settings.maxNumber * 2))

        case .mixedAllowed:
            if Bool.random() {
                numerator = denominator <= 2 ? 1 :
                    (Double.random(in: 0...1) < 0.7 ? Int.random(in: 2..<denominator) : 1)
            } else {
                numerator = Int.random(in: (denominator + 1)...(settings.maxNumber * 2))
            }
        }

        let gcdValue = gcd(numerator, denominator)
        let reducedNum = numerator / gcdValue
        let reducedDen = denominator / gcdValue

        if reducedDen == 1 { return "\(reducedNum)" }

        if fractionType == .mixedAllowed && reducedNum > reducedDen {
            let whole = reducedNum / reducedDen
            let remainder = reducedNum % reducedDen
            return remainder == 0 ? "\(whole)" : "\(whole) \(remainder)/\(reducedDen)"
        }

        return "\(reducedNum)/\(reducedDen)"
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return a
    }
}
