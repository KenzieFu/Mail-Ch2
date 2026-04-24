//
//  Inbox.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct Inbox: View {
    @Environment(MailStore.self) var mailStore

    @State private var selectedIndex: Int = 0
    
    var filteredMails: [Mail] {
        switch selectedIndex {
        case 1: return mailStore.unreadMail()    // Unread
        case 2: return mailStore.readMail()       // Read
        default: return mailStore.mails                        // All Mail
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            Categories(selectedIndex: $selectedIndex)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    Section {
                        
                        ForEach(filteredMails) { mail in
                            let idx = mailStore.mails.firstIndex(where: { $0.id == mail.id }) ?? 0
                            MailRow(
                                femail: mail,
                                allMails: mailStore.mails,
                                currentIndex: idx
                            )
                            .padding(.vertical, 8)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Inbox().environment(MailStore())
}
