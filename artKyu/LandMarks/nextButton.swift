//
//  nextButton.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/05.
//

import SwiftUI

struct nextButton: View {
    @Binding var isAddressed: Bool
    let landmark : Landmark
//    @EnvironmentObject var modelData : ModelData
//    var index : Int {
//        modelData.landmarks.firstIndex { landmark in
//            landmark.id == self.landmark.id
//        } ?? 0
//    }
    var body: some View {
        Button(action: {
            isAddressed = true
            
//            modelData.landmarks[index].isFeatured = true
                    }) {
                        HStack {
                            Text("다음")
                        }
                        .padding(10)
                        .accentColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                    }
                    .padding()
    }
}

struct nextButton_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        nextButton(isAddressed: .constant(true),landmark:modelData.landmarks[0])
    }
}
