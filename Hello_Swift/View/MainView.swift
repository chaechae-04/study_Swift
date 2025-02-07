//
//  MainView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var isLoggedIn: Bool = true
    @State public var action: String = "main"
    
    var body: some View {
        if isLoggedIn {
            /* Main */
            ZStack {
                if action == "main" {
                    VStack {
                        /* Icon , Profile */
                        Group {
                            GeometryReader { geometry_header in
                                Header(width: geometry_header.size.width, height: geometry_header.size.height, isLoggedIn: $isLoggedIn)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                        .padding(.top, UIScreen.main.bounds.height * 0.03)
                        
                        /* Calendar */
                        Group {
                            GeometryReader { geometry_calendar in
                                MyCalendar(width: geometry_calendar.size.width, height: geometry_calendar.size.height)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.49)
                        
                        /* Middle Group : Todo List , Pie Chart */
                        HStack {
                            
                            /* Today Todo List */
                            Group {
                                GeometryReader { geometry_group in
                                    Text("1")
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            .padding(.leading, UIScreen.main.bounds.width * 0.025)
                            
                            /* Pie Chart */
                            Group {
                                GeometryReader { geometry_chart in
                                    PieChart(width: geometry_chart.size.width, height: geometry_chart.size.height)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            .padding(.leading, UIScreen.main.bounds.width * 0.025)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.225, alignment: .leading)
                        
                        Spacer()
                        
                        /* Buttons */
                        Group {
                            GeometryReader { geometry_footer in
                                Footer(action: $action, width: geometry_footer.size.width, height: geometry_footer.size.height)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                        .padding(.top)
                    }
                    .background(Color.Colors.customGray)
                } else {
                    /* Todo View */
                    if action == "todo" {
                        TodoView(action: $action)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .animation(.easeIn(duration: 0.5), value: action != "main")
        } else {
            LoginView()
                .transition(.opacity.animation(.easeInOut(duration: 0.8)))
        }
    }
}


#Preview {
    MainView()
}
