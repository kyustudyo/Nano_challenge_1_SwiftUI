//
//  artKyuApp.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/04.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}
@main
struct artKyuApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject var appState = AppState(hasOnboarded: false)
    var body: some Scene {
        
        WindowGroup {
            if appState.hasOnboarded {
                CategoryHome()
                    .environmentObject(appState)
                    .environmentObject(modelData)
            }
            
            else if !appState.hasOnboarded{
                ContentView()
                    .environmentObject(modelData)
                    .environmentObject(appState)
            }
            
        }
    }
}
