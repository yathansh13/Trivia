//
//  butt.swift
//  Trivia
//
//  Created by Yathansh Raj on 25/12/21.
//

import SwiftUI

struct butt: View {
    var title: String
    var color: Color = Color.accentColor
    var body: some View {
        
        Text(title)
            .foregroundColor(Color(red: 0.151, green: 0.181, blue: 0.315))
            .frame(width: 150, height: 50)
            .background(color)
            .cornerRadius(2000)
            .shadow(color: color, radius: 90, x: 10, y: 8)
            .padding()
    }
}

struct butt_Previews: PreviewProvider {
    static var previews: some View {
        butt(title: "Next")
    }
}
