//
//  MainView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                /* Icon , Profile */
                Group {
                    Header(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                }
                
                /* Calendar */
                Group {
                    MyCalendar(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.49)
                }
                
                /* Middle Group :  , Pie Chart */
                HStack {
                    
                    /* Today To do list */
                    Group {
                        GeometryReader { group_geometry in
                            Text("1")
                        }
                    }
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.265)
                    .padding(.leading, geometry.size.width * 0.025)
                    
                    /* Pie Chart */
                    Group {
                        GeometryReader { chart_geometry in
                            PieChart(geometry: chart_geometry)
                        }
                    }
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.265)
                    .padding(.leading, geometry.size.width * 0.025)
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.29, alignment: .leading)
                
                /* Buttons */
                Group {
                    Footer(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
