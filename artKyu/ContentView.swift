//
//  ContentView.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI
import AVKit
struct ContentView: View {
    
    var body: some View {
        
        CategoryHome()
//        VideoPlayer(player: AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=imBsoVC8fWg")!))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
