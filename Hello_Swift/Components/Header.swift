//
//  Header.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct Header: View {
    
    @Binding var isIconActive: Bool
    @State private var iconName: String = "sun.haze"
    let geometry: GeometryProxy
    
    var body: some View {
        HStack {
            /* 아이콘 */
            Button(action: {
                isIconActive.toggle()
                if isIconActive {
                    iconName = "moon.haze"
                } else {
                    iconName = "sun.haze"
                }
                
            }) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 8)
                    .padding(.leading, geometry.size.width / 12)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Text("User")
                .fontWeight(.bold)
                .font(.system(size: geometry.size.width / 18))
                .padding(.top, geometry.size.height / 70)
            /* 프로필 */
            Button(action: {
                
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 10)
                    .padding(.trailing, geometry.size.width / 12)
                    .foregroundColor(.black)
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 10)
    }
}


