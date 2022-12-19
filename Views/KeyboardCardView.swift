/*
 KeyboardCardView
 */

import SwiftUI

struct KeyboardCardView: View {
    // PROPERTIES
    
    
    // BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // KEYBOARD IMAGE
                Image("keyboard-test")
                    .resizable()
                    .scaledToFit()
                // KEYBOARD TITLE
                // KEYBOARD HEADLINE
                // BUTTON START
                Text("Keyboard!")
                
            } // VSTACK
        } // ZSTACK
        
    }
}
