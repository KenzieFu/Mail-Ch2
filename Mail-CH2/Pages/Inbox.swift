//
//  Inbox.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct Inbox: View {

    var body: some View {
        
        
        NavigationStack {
            Categories()
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    Section {
                        ForEach(mails) { maile in
                            MailRow(femail: maile)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Inbox()
}
