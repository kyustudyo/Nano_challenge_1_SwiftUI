//
//  Animate.swift
//  artKyu
//
//  Created by Hankyu Lee on 2022/05/05.
//

import Foundation
import SwiftUI
struct opacityModifier: AnimatableModifier {

  var totalOpacity: CGFloat
  var percentage: CGFloat
  var onReachedDestination: () -> () = {}

  private var opacity: CGFloat { percentage * totalOpacity }

  func body(content: Content) -> some View {
    content
          .opacity(opacity)
  }
    
    //Computed property
    var animatableData: CGFloat {
        get { percentage }
        set {
//            print(newValue)
          percentage = newValue
          checkIfFinished()
        }
      }

      func checkIfFinished() -> () {
        if percentage == 1 {
          DispatchQueue.main.async {
            self.onReachedDestination()
          }
        }
      }
}
