//
//  TodoView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import SwiftUI

struct TodoView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
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
                        .frame(width: ScreenSize.width * 0.15, height: ScreenSize.height * 0.025)
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
        .padding(.top, ScreenSize.height * 0.05)
        .frame(width: ScreenSize.width, height: ScreenSize.height, alignment: .top)
    }
}

#Preview {
    TodoView()
}
