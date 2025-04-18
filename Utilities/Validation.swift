// 1. First, define the Question model (simplest version for now)
 struct Question {
  let text: String
  let answer: String
  var requiredMaxNumber: Int // Used for validation
 }
 

 // 2. Create a Validation struct to contain our static methods
 struct Validation {
 

  ///  Checks if a question complies with number constraints
  static func validateQuestion(_ question: Question, against settings: NumberSettings) -> Bool { // Change is here
  if question.requiredMaxNumber > settings.maxNumber {
  print("Warning: Question exceeded max number constraint.")
  return false // or allow with warning based on project needs
  }
  return true
  }
 

  ///  Add other validation methods here later
  // static func validateAnotherThing(...) { ... }
 }
