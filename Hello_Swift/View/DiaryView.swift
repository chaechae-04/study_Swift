//
//  DiaryView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/9/25.
//

import SwiftUI

struct DiaryView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                /* HEADER */
                HStack {
                    Spacer()
                    
                    Button(action: {
                        navState.currentScreen = .main
                    }) {
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.025)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.Colors.customBlack)
                    }
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
                .border(.red)
                
                /* MAIN */
                Group {
                    Text("Diary")
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.7)
                .border(.blue)
                
                /* FOOTER */
                Group {
                    Text("Footer")
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
                .border(.red)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(Color.Colors.customGray)
        }
    }
}

#Preview {
    DiaryView()
}
