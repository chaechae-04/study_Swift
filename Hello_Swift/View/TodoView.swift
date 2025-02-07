//
//  TodoView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/7/25.
//

import SwiftUI

struct TodoView: View {
    
    @Binding var action: String
    
    var body: some View {
        ZStack {
            if action == "todo" {
                GeometryReader { geometry in
                    VStack {
                        /* HEADER */
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                action = "main"
                            }) {
                                Image(systemName: "chevron.forward")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.025)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.Colors.customBlack)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                        .border(.red)
                        
                        /* MAIN */
                        Group {
                            Text("Main")
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
                        .border(.blue)
                        
                        /* FOOTER */
                        Group {
                            Text("Footer")
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                        .border(.red)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                    .background(Color.Colors.customGray)
                }
            } else {
                if action == "main" {
                    MainView()
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .animation(.easeOut(duration: 0.5), value: action == "main")
    }
}

#Preview {
    TodoView(action: .constant("todo"))
}
