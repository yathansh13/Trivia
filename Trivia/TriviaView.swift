//
//  TriviaView.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(alignment: .center, spacing: 20) {
                Text("Trivia!")
                    .btitle()
                
                Text("Congratulations, you have completed the game!")
                    .multilineTextAlignment(.center)
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    butt(title: "Play again")
                }
            }
            .foregroundColor(Color.accentColor)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.151, green: 0.181, blue: 0.315))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
