//
//  SplashView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { geometry in
            Image(systemName: "sun.haze")
                .resizable()
                .scaledToFit()
                .frame(width: ScreenSize.width * 0.4, height: ScreenSize.height * 0.2)
                .position(x: geometry.size.width / 2, y: ScreenSize.height / 3)
                .foregroundStyle(Color.Colors.customBlack)
            
            Text("Splash View")
                .fontWeight(.bold)
                .font(.system(size: ScreenSize.width / 15))
                .frame(width: ScreenSize.width, height: 0)
                .position(x: geometry.size.width / 2, y: ScreenSize.height / 2)
                .foregroundStyle(Color.Colors.customBlack)
        }
        .padding()
        .background(Color.Colors.customWhite)
    }
}

#Preview {
    SplashView()
}
