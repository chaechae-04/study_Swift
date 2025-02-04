//
//  MainView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct MainView: View {
    
    @State public var isIconActive: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                /* 상단 아이콘 및 프로필 */
                Header(isIconActive: $isIconActive, geometry: geometry)
                    .border(.red)
                
                MyCalendar(geometry: geometry)
                    .frame(width: geometry.size.width, height: geometry.size.height / 2)
                    .padding(.top, geometry.size.height / 50)
                    .border(.blue)
                
                Spacer()
                
                /* 하단 메뉴 */
                Footer(geometry: geometry)
                    .border(.green)
                
            }
            .padding(.bottom, geometry.size.height / 80)
        }
    }
}

#Preview {
    MainView()
}
