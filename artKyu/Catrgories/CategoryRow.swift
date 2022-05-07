/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a scrollable list of landmarks.
*/

import SwiftUI

struct CategoryRow: View {
 

    var categoryName: String
    
    var items: [Landmark]
    
    var text : Text {
        let str = (categoryName == Landmark.Category.human.rawValue) ? "맞춰봐요!" : "끄적끄적"
        return Text(str)
    }
    
    @State private var showNav = false
    var body: some View {
        VStack(alignment: .leading) {

            
                text
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
            
            

            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    
                    ForEach(items,id:\.id) { landmark in
                        
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
//                                .onAppear{
//                                    print(landmark.name)
//                                }
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
