/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a single category item.
*/

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    @EnvironmentObject var modelData : ModelData
    var index : Int {
        modelData.landmarks.firstIndex { landmark in
            landmark.id == self.landmark.id
        } ?? 0
    }
    var text : String {
        if landmark.category == .basic {
            return ""
        }
        return modelData.landmarks[index].isFeatured == true ? landmark.name : "?"
    }
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(text)
                .foregroundColor(.primary)
                .font(.caption)
        }
       
        .padding(.leading, 15)
    }
}

//struct CategoryItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryItem(landmark: ModelData().landmarks[0])
//    }
//}
