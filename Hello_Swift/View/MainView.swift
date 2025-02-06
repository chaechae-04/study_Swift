//
//  MainView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var isLoggedIn: Bool = true
    
    var body: some View {
        if isLoggedIn {
            GeometryReader { geometry in
                
                VStack {
                    /* Icon , Profile */
                    Group {
                        Header(geometry: geometry, isLoggedIn: $isLoggedIn)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                    }
                    
                    /* Calendar */
                    Group {
                        MyCalendar(geometry: geometry)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.49)
                    }
                    
                    /* Middle Group : Todo List , Pie Chart */
                    HStack {
                        
                        /* Today Todo List */
                        Group {
                            GeometryReader { group_geometry in
                                Text("1")
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.265)
                        .padding(.leading, UIScreen.main.bounds.width * 0.025)
                        
                        /* Pie Chart */
                        Group {
                            GeometryReader { chart_geometry in
                                PieChart(geometry: chart_geometry)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.265)
                        .padding(.leading, UIScreen.main.bounds.width * 0.025)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.29, alignment: .leading)
                    
                    /* Buttons */
                    Group {
                        Footer(geometry: geometry)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                    }
                }
            }
        } else {
            LoginView()
                .transition(.opacity.animation(.easeInOut(duration: 0.8)))
        }
    }
}

//#Preview {
//    MainView()
//}
