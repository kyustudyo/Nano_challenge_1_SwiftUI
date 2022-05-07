//
//  LandmarkSecondStatement.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/05.
//

import SwiftUI
//Do it has to be 
struct LandmarkSecondStatement: View {
//    let name: String
    let landmark: Landmark
    @State private var animateProperties: AnimateProperties = AnimateProperties()
//    @Binding var goToRoot : Bool
//    @EnvironmentObject var modelData: ModelData
    @State private var needsToNextTryView : Bool = false
//    var index : Int {
//        modelData.landmarks.firstIndex { landmark in
//            landmark.id == self.landmark.id
//        } ?? 0
//    }
    let answerInfo: AnswerInfo
    var endMent : Text {
        let str = (answerInfo.answer == landmark.name) ? "정답 !\n비슷한가요?" : "사실은\n\(landmark.name) 예요"
        return Text(str)
    }
    
    var body: some View {
        
        VStack{
            Image(landmark.imageName+"_real")
                .resizable()
                .scaledToFit()
                .border(Color.black)
                .clipped()
            
            HStack{
                endMent
                    .font(.system(size: 40, weight: .regular))
                    .padding()
                
                //A problem arises.
                //At the same time as the view changes, an upgrade occurs in the bound view, causing a problem.
                nextButton(isAddressed:
                            $needsToNextTryView, landmark:landmark)
//                           $modelData.landmarks[index].isFeatured, landmark: landmark)
            }
            NavigationLink(isActive:
                            $needsToNextTryView
//            $modelData.landmarks[index].isFeatured
            )
            {
                nextTryView(navBool:$needsToNextTryView, landmark: landmark)
            } label: {

            }
        }
    }
}

struct LandmarkSecondStatement_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkSecondStatement(landmark:modelData.landmarks[0], answerInfo: AnswerInfo(isReply: true, answer: "송혜교"))
            .environmentObject(modelData)
    }
}
