//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Don McKenzie on 21-01-2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
