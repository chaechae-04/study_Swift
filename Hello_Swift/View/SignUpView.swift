//
//  SignUpView.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/6/25.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("Go to Login View")
            .onTapGesture {
                dismiss()
            }
    }
}

//#Preview {
//    LoginView()
//}
