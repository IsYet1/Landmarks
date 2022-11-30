//
//  CircleImage.swift
//  Landmarks
//
//  Created by Don McKenzie on 11/8/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(radius: 7)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
