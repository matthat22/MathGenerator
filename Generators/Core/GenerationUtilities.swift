import Foundation

enum GenerationUtilities {
    static func randomFraction(maxDenominator: Int) -> String {
        let denom = Int.random(in: 2...maxDenominator)
        let numer = Int.random(in: 1..<denom)
        return "\(numer)/\(denom)"
    }

    static func formatDecimal(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
