//
//  Inbox.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct Inbox: View {
    @State var femail: [Mail] = mails
    @State private var selectedIndex: Int = 0
    
    var filteredMails: [Mail] {
        switch selectedIndex {
        case 1: return femail.filter { !$0.isRead }      // Unread
        case 2: return femail.filter { $0.isRead }       // Read
        default: return femail                            // All Mail
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            Categories(selectedIndex: $selectedIndex)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    Section {
                        
                        ForEach(filteredMails) { mail in
                            if let idx = femail.firstIndex(where: { $0.id == mail.id }) {
                                MailRow(
                                    femail: $femail[idx],
                                    allMails: femail,     
                                    currentIndex: idx  )
                                .padding(.vertical, 8)
                            }
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
