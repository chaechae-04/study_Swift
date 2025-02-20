//
//  TodoInfo.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/20/25.
//

import SwiftUI

struct TodoInfo: View {
    
    @EnvironmentObject var navState: NavigationState
    @EnvironmentObject var alertState: AlertState
    @EnvironmentObject var todoState: TodoState
    
    var body: some View {
        
        VStack {
            Button(action: {
                navState.currentScreen = .todo
            }) {
                Text("back")
            }
        }
    }
}

#Preview {
    TodoInfo()
//    ContentView()
}
