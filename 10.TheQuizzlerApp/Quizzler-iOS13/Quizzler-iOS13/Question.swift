import Foundation

struct Question {
    let question : String
    let options : [String]
    let answer : String
    init(q questions : String, a options : [String], correctAnswer : String){
        self.question = questions
        self.options = options
        self.answer = correctAnswer
    }
}
