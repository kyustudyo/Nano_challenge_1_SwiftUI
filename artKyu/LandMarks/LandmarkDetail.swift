//It needs to be scrolled down when the answer shows up.
//If the animation is already watched before, then there is no need for animation to show.


import SwiftUI

struct LandmarkDetail: View {
//    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
//    @State var percentage: CGFloat = 0//If it starts at 0.5, the results are different.
//    @Binding var goToRoot : Bool
    @State var animateProperties = AnimateProperties()
    @State var answerInfo : AnswerInfo = AnswerInfo()
   
//    var index: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
    
    var body: some View {
        ScrollView{
            VStack {
                landmark.image
                    .resizable()
                    .scaledToFit()
                    .border(Color.black)
                        .clipped()
                        .padding()
                //it needs to have features about landscape..
                        .frame(width: UIScreen.main.bounds.width - 40)
                Spacer().frame(height:50)
                //if it is not used with .top, something incomprehensible situation happens.
                
                


                ZStack(alignment:.top){
                    LandmarkFirstStatement(answerInfo: $answerInfo, landmark: landmark)
                        .opacity(answerInfo.isReply == false ? 1 : 0)
                        .animation(.easeInOut(duration: 1.5), value: answerInfo.isReply)
                        
                    
                    LandmarkSecondStatement(landmark:landmark, answerInfo:answerInfo)
                        .opacity(answerInfo.isReply == false ? 0 : 1)
                        .animation(.easeInOut(duration: 2), value: answerInfo.isReply)
                }
                
            }.onAppear {
//                print(modelData.landmarks[0].isFeatured)
            }
           
//            .fullScreenCover(isPresented: $modelData.landmarks[index].isFeatured, content: {
//                nextTryView()
//            })
            
        }

        
    }
}




struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)

    }
}

struct AnswerInfo{
    var isReply : Bool = false
    var answer: String = ""
}

