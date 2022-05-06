//
//  nextTryView.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/05.
//

import SwiftUI

struct nextTryView: View {
    @EnvironmentObject var modelData : ModelData
    @EnvironmentObject var appState: AppState
    @Binding var navBool : Bool
    let landmark : Landmark
        var index : Int {
            modelData.landmarks.firstIndex { landmark in
                landmark.id == self.landmark.id
            } ?? 0
        }
//    @Binding var goToRoot : Bool
    var body: some View {
        VStack{
            
            Text("또 도전?")
                .frame(height: 50)
                .font(.system(size: 35, weight: .regular))
            Button(action: {
                //Is it because modelData is modified, From CategoryHome to LandmarkDetail the effect come?
                modelData.landmarks[index].isFeatured = true
                appState.hasOnboarded = true

                        }) {
                            HStack {
                                Text(" 도전 ")
                                
                            }
                            .padding(10)
                            .accentColor(.white)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        .padding(.top)
            
            Button(action: {
                modelData.landmarks[index].isFeatured = true
                        }) {
                            HStack {
                                Text(" 그만 ")
                                
                            }
                            .padding(10)
                            .accentColor(.white)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        .padding()


        }
        
//        .onAppear {
//            modelData.landmarks[index].isFeatured = true
//        }
        
    }
}

struct nextTryView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static let appState = AppState(hasOnboarded: false)
    static var previews: some View {
        nextTryView(navBool: .constant(false), landmark: modelData.landmarks[0]).environmentObject(modelData)
            .environmentObject(appState)
    }
}
    
