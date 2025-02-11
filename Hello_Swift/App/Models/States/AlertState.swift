//
//  AlertState.swift
//  Hello_Swift
//
//  Created by 이영수 on 2/11/25.
//

import Foundation

class AlertState: ObservableObject {
    @Published var isPresented: Bool = false
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var buttonType: AlertButtonType = .single
    var primaryAction: (() -> Void)?
    var secondaryAction: (() -> Void)?
}
