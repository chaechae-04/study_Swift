//
//  MainView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navState: NavigationState
    
    var body: some View {
        VStack {
            /* Icon , Profile */
            Group {
                GeometryReader { geometry_header in
                    Header(width: geometry_header.size.width, height: geometry_header.size.height)
                }
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
            .padding(.top, ScreenSize.height * 0.03)
            
            /* Calendar */
            Group {
                GeometryReader { geometry_calendar in
                    MyCalendar(width: geometry_calendar.size.width, height: geometry_calendar.size.height)
                }
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.49)
            
            /* Middle Group : Todo List , Pie Chart */
            HStack {
                
                /* Today Todo List */
                Group {
                    GeometryReader { geometry_group in
                        Text("1")
                    }
                }
                .frame(width: ScreenSize.width * 0.45, height: ScreenSize.height * 0.2)
                .padding(.leading, ScreenSize.width * 0.025)
                
                /* Pie Chart */
                Group {
                    GeometryReader { geometry_chart in
                        PieChart(width: geometry_chart.size.width, height: geometry_chart.size.height)
                    }
                }
                .frame(width: ScreenSize.width * 0.45, height: ScreenSize.height * 0.2)
                .padding(.leading, ScreenSize.width * 0.025)
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.225, alignment: .leading)
            
            Spacer()
            
            /* Buttons */
            Group {
                GeometryReader { geometry_footer in
                    Footer(width: geometry_footer.size.width, height: geometry_footer.size.height)
                }
            }
            .frame(width: ScreenSize.width, height: ScreenSize.height * 0.1)
            .padding(.top)
        }
        .background(Color.Colors.customGray)
    }
}


#Preview {
    MainView()
}

