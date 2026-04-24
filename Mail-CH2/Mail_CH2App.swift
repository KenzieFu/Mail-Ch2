//
//  Mail_CH2App.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 17/04/26.
//

import SwiftUI
import Combine

@main
struct Mail_CH2App: App {
    @State private var mailStore = MailStore()
    var body: some Scene {
        WindowGroup {
            Root().environment(mailStore)
        }
    }
}
