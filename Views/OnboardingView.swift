//
//  OnboardingView.swift
//  Restart
//
//  Created by Berk Dogan on 24/3/2022.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // For the button
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            
            Color.blue.ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                // MARK: Header
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        . fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("It's not how much we give but how much love we put into giving.")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                // MARK: Center
                
                ZStack {
                    // Using our CircleGroupView
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-man")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                
                // MARK: Footer
                ZStack {
                    // 1. Static Background
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call to action (static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    
                    // 3. Capsule (dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color.red.opacity(0.9))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    // MARK: 4. Circle (draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.red)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        // MARK: GESTURES
                        .gesture(DragGesture()
                                 
                            .onChanged{ gesture in
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }}
                                 
                            .onEnded {
                                _ in
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                } else {
                                    buttonOffset = 0
                                }
                            }
                                 
                        )
                        
                        // simple declaractive code :)
                        
                        
                        
                        Spacer() // push the button to the left
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                
            }
        }
    }
}

// MARK: Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
