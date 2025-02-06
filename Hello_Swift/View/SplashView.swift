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
                .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2.75)
            Text("Splash View")
                .fontWeight(.bold)
                .font(.system(size: geometry.size.width / 15))
                .frame(width: geometry.size.width, height: 0)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .padding()
    }
}

//#Preview {
//    SplashView()
//}
