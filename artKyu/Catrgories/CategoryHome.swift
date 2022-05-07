/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var appState : AppState
    @State private var showingProfile = false
    @State private var animateProperties: AnimateProperties = AnimateProperties()
    @State private var opacity:Double = 0.3
    @State private var see: Bool = false
    
    var count : Int {
        modelData.landmarks.filter { landmark in
            landmark.isFeatured == true
        }.count
    }
    var body: some View {
        NavigationView {
            VStack(alignment:.trailing){
                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                    
                }
                .listStyle(.inset)
                
                HStack {
//                        Image("long")
//                        .resizable()
//                        .scaledToFit()
//                        .border(Color.black)
//                        .opacity(see ? 1 : 0)
//                            .clipped()
//                            .padding()
                
                        Text(count == 0 ? "시\n보실래요?" : "\(count)개나\n봐주시다니\n감사해요")
                            .onTapGesture {
                                see.toggle()
                            }
                            .opacity(opacity)
                            .font(.system(size: 25, weight: .regular))
                            .padding()
                    }

                .sheet(isPresented: $see) {
                    Image("long")
                        .resizable()
                        .scaledToFit()
                        .border(Color.black)
                        .clipped()
                        .padding()
                        .shadow(radius: 5)
                        .background(Color.white)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                                see = false
                            })
                        }
                    
                           
                }
               
                                    
                    
                    
                
                
                
            }
            
            
            .navigationTitle("Art kyu")
            .toolbar {
                Button {
//                    showingProfile.toggle()
                    appState.hasOnboarded = false
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .onAppear {
//                print("kkkk")
//                withAnimation(.easeOut(duration: 1.5)) {
//                    animateProperties.iPaintedPercentage = 1
                let baseAnimation = Animation.easeInOut(duration: 1)
                                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        opacity = 1
                    }
//                }
            }
//            .sheet(isPresented: $showingProfile) {
//                ProfileHost()
//                    .environmentObject(modelData)
//            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
