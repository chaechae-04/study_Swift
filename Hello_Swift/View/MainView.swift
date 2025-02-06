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
                /* 상단 아이콘 및 프로필 */
                Group {
                    Header(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                }
//                .border(.red)
                
                Group {
                    MyCalendar(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.49)
                }
//                .border(.blue)
                
                HStack {
                    
                    Group {
                        GeometryReader { group_geometry in
                            Text("1")
                        }
                    }
//                    .border(.black)
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.265)
                    .padding(.leading, geometry.size.width * 0.025)
                    
                    Group {
                        GeometryReader { chart_geometry in
                            PieChart(geometry: chart_geometry)
                        }
                    }
//                    .border(.black)
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.265)
                    .padding(.leading, geometry.size.width * 0.025)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.29, alignment: .leading)
//                .border(.gray)
                
                /* 하단 메뉴 */
                Group {
                    Footer(geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                }
//                .border(.green)
                
            }
            .padding(.bottom, geometry.size.height * 0.02)
        }
    }
}

#Preview {
    MainView()
}
