import Foundation

protocol QuestionGenerator {
    associatedtype Question
    static func generate(settings: NumberSettings, toggles: [String: Bool]) -> [Question]
}

// Example concrete generator protocol (optional)
protocol MathQuestionGenerator: QuestionGenerator where Question == String {
    static var supportedQuestionTypes: [String] { get }
}
