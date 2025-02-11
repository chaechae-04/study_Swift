//
//  Footer.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct Footer: View {
    
    @EnvironmentObject var navState: NavigationState
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        /* 하단 메뉴 */
        HStack(spacing: width * 0.125) {
            /* 버튼 1 */
            Button(action: {
                navState.currentScreen = .todo
            }) {
                Image(systemName: "list.bullet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.12)
            }
            /* 버튼 2 */
            Button(action: {
                navState.currentScreen = .diary
            }) {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.12)
            }
            /* 버튼 3 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.12)
            }
            /* 버튼 4 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.12)
            }
        }
        .frame(width: width)
        .foregroundStyle(Color.Colors.customBlack)
    }
}

#Preview {
    MainView()
}
