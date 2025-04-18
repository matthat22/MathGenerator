import Foundation

struct QuestionType: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    let toggles: [ToggleOption]

    struct ToggleOption: Codable, Hashable {
        let id: String
        let displayName: String
        let defaultValue: Bool
        var options: [String]? // Added optional options

        init(id: String, displayName: String, defaultValue: Bool = false, options: [String]? = nil) {
            self.id = id
            self.displayName = displayName
            self.defaultValue = defaultValue
            self.options = options
        }
    }

    init(id: UUID = UUID(), name: String, description: String, toggles: [ToggleOption]) {
        self.id = id
        self.name = name
        self.description = description
        self.toggles = toggles
    }
}
