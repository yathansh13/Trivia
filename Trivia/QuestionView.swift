//
//  QuestionView.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Trivia!")
                    .btitle()
                Spacer()
                Text("\(triviaManager.index+1) out of 10")
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
            }
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20){
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager) 
                }

                
                
                
            }
            Button{
                triviaManager.goToNextQuestion()
                
            } label: {
                butt(title: "Next", color: triviaManager.answerSelected ? Color.accentColor : Color.gray)
            }
            .disabled(!triviaManager.answerSelected)
            
            Spacer()
                
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.151, green: 0.181, blue: 0.315))
        .navigationBarHidden(true)
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
