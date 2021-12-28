//
//  Trivia.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import Foundation

struct Trivia: Decodable {
    
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID{
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correct_answer: String
        var incorrect_answers: [String]
        
        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
                
            } catch{
                print("Error: \(error)")
                return ""
            }
        }
        
        var answers: [Answer]{
            do{
                let correct = [Answer(text: try AttributedString(markdown: correct_answer), isCorrect: true)]
                let incorrect = try incorrect_answers.map{ answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAns = correct + incorrect
                return allAns.shuffled()
                 
            } catch{
                print("Error: \(error)")
                return []
            }
        }
    }
}
 
