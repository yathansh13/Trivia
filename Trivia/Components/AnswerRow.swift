//
//  AnswerRow.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager

    var answer: Answer
    @State private var isSelected = false
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
            
            if isSelected{
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor( triviaManager.answerSelected ? (isSelected ? .accentColor : .gray) : .accentColor)
        .background(.black)
        .cornerRadius(15)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected{
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }

        }
        
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "James", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
