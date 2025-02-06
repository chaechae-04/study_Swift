//
//  Header.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/4/25.
//

import SwiftUI

struct Header: View {
    
    @State private var iconName: String = "sun.haze"
    @State private var isIconActive: Bool = false
    @State private var showSideMenu: Bool = false
    
    let geometry: GeometryProxy
    @Binding var isLoggedIn: Bool
    
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
            
            Text(UserDefaultsManager.shared.getCurrentUser()?.name ?? "User")
                .fontWeight(.bold)
                .font(.system(size: geometry.size.width / 18))
                .padding(.top, geometry.size.height / 70)
            /* 프로필 */
            Button(action: {
                showSideMenu.toggle()
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 10)
                    .padding(.trailing, geometry.size.width / 12)
                    .foregroundColor(.black)
            }
        }
        .sheet(isPresented: $showSideMenu) {
            VStack {
                Text("프로필")
                    
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showSideMenu = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isLoggedIn = false
                            UserDefaultsManager.shared.clearUser()
                        }
                    }
                }) {
                    Text("Logout")
                        .foregroundColor(.red)
                }
                Spacer()
            }
        }
    }
}

//#Preview {
//    MainView()
//}
