import Foundation

struct Unit: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String?
    let questionTypes: [QuestionType]
    
    init(id: UUID = UUID(), name: String, description: String? = nil, questionTypes: [QuestionType]) {
        self.id = id
        self.name = name
        self.description = description
        self.questionTypes = questionTypes
    }
}
