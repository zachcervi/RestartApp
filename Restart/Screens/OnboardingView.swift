//
//  OnboardingView.swift
//  Restart
//
//  Created by Zach Cervi on 5/30/22.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                //HEADER
                
                Spacer()
                
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size:60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
It's not how much we give but how much love we put into giving
""").font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal, 10)
                } // :HEADER
                
                //CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                
                Spacer()
                //FOOTER
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }.foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }.onEnded { _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                  
                                    
                                }
                            )//: GESTURE
                        Spacer()
                    } //: HSTACK
                    
                }.frame(width: buttonWidth, height: 80, alignment: .center).padding() //: FOOTER
            }//: VSTACK
        }//: ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
