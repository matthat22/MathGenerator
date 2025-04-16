import Foundation

struct Unit: Codable, Identifiable, Hashable { // Keep Hashable, remove manual implementation
    var id = UUID() // Can be 'let' if you don't need decoding
    let name: String
    let questionTypes: [QuestionType]
    
    // No need for manual Hashable conformance
}
