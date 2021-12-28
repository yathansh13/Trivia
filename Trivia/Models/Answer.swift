//
//  Answer.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import Foundation


struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
