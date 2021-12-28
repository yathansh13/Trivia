//
//  QuestionView.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Trivia!")
                    .btitle()
                Spacer()
                Text("1 out of 10")
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
            }
            ProgressBar(progress: 70)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Greenland is covered with grass and Iceland covered with ice.")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                AnswerRow(answer: Answer(text: "True", isCorrect: false))
                AnswerRow(answer: Answer(text: "False", isCorrect: true))
                
                
                
            }
            butt(title: "Next")
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
    }
}
