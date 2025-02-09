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
        Text("Go to Main View")
            .onTapGesture {
                navState.currentScreen = .main
            }
    }
}

#Preview {
    DiaryView()
}
