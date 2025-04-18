import Foundation
struct SimplifyingExpressionGenerator: QuestionGenerator {
  static let requiredToggles = ["includeFractions", "includeNegatives", "maxTerms"]
 

  static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [String] {
  let useFractions = toggles["includeFractions"] ?? false
  let useNegatives = toggles["includeNegatives"] ?? false
  let maxTerms = toggles["maxTerms"] as? NSNumber ?? 4 // Default value
  let maxTermsInt = maxTerms.intValue
 

  return [
  useFractions ?
  generateFractionExpression(negatives: useNegatives, termCount: maxTermsInt) :
  generateIntegerExpression(negatives: useNegatives, termCount: maxTermsInt)
  ]
  }
 

  private static func generateIntegerExpression(negatives: Bool, termCount: Int) -> String {
  let operations = ["+", "-"].randomElement()! // Basic operations only
  let numbers = (1...termCount).map { _ in
  negatives ? "\(Int.random(in: -10...10))" : "\(Int.random(in: 1...10))"
  }
  return numbers.joined(separator: " \(operations) ")
  }
 

  private static func generateFractionExpression(negatives: Bool, termCount: Int) -> String {
  let operations = ["+", "-"].randomElement()!  // Basic operations only
  let fractions = (1...termCount).map { _ in
  negatives ? "(\(generateSignedFraction()))" : generateSignedFraction()
  }
  return fractions.joined(separator: " \(operations) ")
  }
 

  private static func generateSignedFraction() -> String {
  let sign = Bool.random() ? "" : "-"
  return "\(sign)\(Int.random(in: 1...10))/\(Int.random(in: 1...10))"
  }
 }
