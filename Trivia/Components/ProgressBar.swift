//
//  ProgressBar.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 359, height: 5)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.668))
            Rectangle()
                .frame(width: progress, height: 5)
                .foregroundColor(.accentColor)
                .cornerRadius(10)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 30)
    }
}
