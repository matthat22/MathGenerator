import Foundation

struct NumberSettings: Codable, Hashable {
    var maxNumber: Int = 15
    var allowsDecimals: Bool = false
    var allowsNegatives: Bool = false
    var fractionType: FractionType?

    enum FractionType: String, Codable, CaseIterable, Identifiable {
        case properOnly = "Proper Only"
        case improperAllowed = "Improper Allowed"
        case mixedAllowed = "Mixed Numbers"

        var id: String { rawValue }
    }

    init(maxNumber: Int = 15, allowsDecimals: Bool = false,
         allowsNegatives: Bool = false, fractionType: FractionType? = nil) {
        self.maxNumber = maxNumber
        self.allowsDecimals = allowsDecimals
        self.allowsNegatives = allowsNegatives
        self.fractionType = fractionType
    }
}
