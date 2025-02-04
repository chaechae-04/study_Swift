//
//  Footer.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct Footer: View {
    
    let geometry: GeometryProxy
    
    var body: some View {
        /* 하단 메뉴 */
        HStack(spacing: geometry.size.width / 7) {
            /* 버튼 1 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 12)
                    .foregroundColor(.black)
            }
            /* 버튼 2 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 12)
                    .foregroundColor(.black)
            }
            /* 버튼 3 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 12)
                    .foregroundColor(.black)
            }
            /* 버튼 4 */
            Button(action: {
                
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 12)
                    .foregroundColor(.black)
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height / 10)
    }
}
