//
//  ContentView.swift
//  Trivia
//
//  Created by Yathansh Raj on 25/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                Text("Trivia!")
                    .btitle()
                    
                Text("Are you ready to test your knowledge?")
                    .font(.caption)
                    .foregroundColor(.accentColor)
                
                NavigationLink {
                    TriviaView()
                }label:{
                    butt(title: "Lets Go!")
                        .padding(20)
                }

            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
        .background(Color(red: 0.151, green: 0.181, blue: 0.315))
        }
        
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

