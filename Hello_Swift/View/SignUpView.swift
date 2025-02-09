//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Group {
                    Text("Go to Login View")
                        .onTapGesture {
                            navState.currentScreen = .logIn
                        }
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
                .border(Color.Colors.customGray)
                
                Group {
                    Text("Main")
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.7)
                .border(Color.Colors.customGray)
                
                Group {
                    Text("Footer")
                }
                .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
                .border(Color.Colors.customGray)
            }
        }
    }
}

#Preview {
    SignUpView()
}
