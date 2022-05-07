//
//  LandmarkFirstStatement.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/05.
//

import SwiftUI

//After learning about animation, the code needs to be upgraded.
struct LandmarkFirstStatement: View {
    @State private var animateProperties: AnimateProperties = AnimateProperties()
    @State private var answer : String = ""
    
    @Binding var answerInfo : AnswerInfo
    @EnvironmentObject var modelData : ModelData
    let landmark: Landmark
    var index : Int {
        modelData.landmarks.firstIndex { landmark in
            landmark.id == self.landmark.id
        } ?? 0
    }
    
    private func checkTheAnswer(answer: String) {
        modelData.landmarks[index].isFeatured = true
        answerInfo.isReply = true
        answerInfo.answer = answer
    }
    
    var body: some View {
        VStack{
            Text("제가 그렸어요")
                .frame(height: 50)
                .font(.system(size: 40, weight: .regular))
                .padding()
                .modifier(opacityModifier(totalOpacity: 1, percentage: animateProperties.iPaintedPercentage) {
                    
                    withAnimation(.easeOut(duration: 2.5)) {
                        animateProperties.iPaintedComplete = true
                        animateProperties.whoIsPercentage = 1
                    }
               
                })
            
            
                
                if animateProperties.iPaintedComplete {
                    Text("누구게요?")
                        .frame(height: 50)
                        .font(.system(size: 35, weight: .regular))
                        .modifier(opacityModifier(totalOpacity: 1, percentage: animateProperties.whoIsPercentage, onReachedDestination: {
                           
                        }))
                    Spacer().frame(height:40)
                    HStack(spacing:10){
                        TextField("예)홍길동", text: $answer)
                            
                           
                                        .frame(width:150,height: nil)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .cornerRadius(5)
                                        .font(Font.system(size: 25, design: .rounded))
//                                        .border(Color.blue)
                                                .multilineTextAlignment(.center)
                        Button(action: {
                                      checkTheAnswer(answer: answer)
                                    }) {
                                        HStack {
                                            Text("확인")
                                        }
                                        .padding(10)
                                        .accentColor(.white)
                                        .background(Color.accentColor)
                                        .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                                    }
                                    .padding()
                    }
                }
        }
        .onAppear {
            print("kkkk")
            withAnimation(.easeIn(duration: 2.5)) {
                animateProperties.iPaintedPercentage = 1
            }
        }
    }
}

struct LandmarkFirstStatement_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkFirstStatement(answerInfo: .constant(AnswerInfo()), landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}

struct AnimateProperties {
    var iPaintedPercentage:CGFloat = 0
    var whoIsPercentage:CGFloat = 0
   
    var iPaintedComplete : Bool = false
    var whoIsComplete : Bool = false
   
}
