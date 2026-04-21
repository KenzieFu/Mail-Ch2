//
//  DetailedScreenView.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 20/04/26.
//

import SwiftUI

struct DetailScreenView: View {
    
    @State private var showSheet = false
    @Binding var femail: Mail
    var allMails: [Mail]
    var currentIndex: Int
    
    var previousMail: Mail? { currentIndex > 0 ? allMails[currentIndex - 1] : nil }
    var nextMail: Mail? { currentIndex < allMails.count - 1 ? allMails[currentIndex + 1] : nil }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(femail.color.gradient)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text(String(femail.sender.prefix(1)).uppercased())
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(femail.sender)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("To: \(femail.recipient)")
                                .font(.body)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(femail.date, format: .dateTime.day().month().year())
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                    
                    Text(femail.subject)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Rectangle()
                        .fill(.gray.opacity(0.1))
                        .frame(width: .infinity, height: 10)
                        .padding(.horizontal, -16)
                    
                    Text(femail.summary)
                        .font(.title3)
                    
                    
                    Spacer()
                }
                .padding()
            }
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    // Navigate to previous mail
                    NavigationLink(destination: {
                        if let prev = previousMail,
                           let idx = allMails.firstIndex(where: { $0.id == prev.id }) {
                            DetailScreenView(
                                femail: .constant(prev),
                                allMails: allMails,
                                currentIndex: idx
                            )
                        }
                    }) {
                        Image(systemName: "chevron.up")
                    }
                    .disabled(previousMail == nil)
                    
                    NavigationLink(destination: {
                        if let next = nextMail,
                           let idx = allMails.firstIndex(where: { $0.id == next.id }) {
                            DetailScreenView(
                                femail: .constant(next),
                                allMails: allMails,
                                currentIndex: idx
                            )
                        }
                    }) {
                        Image(systemName: "chevron.down")
                    }
                    .disabled(nextMail == nil)
                }
                
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Add Device", systemImage: "archivebox") { }
                    Button("Add Device", systemImage: "folder") { }
                    Button("Add Device", systemImage: "arrowshape.turn.up.backward") { }
                    Spacer()
                    Button("Add Device", systemImage: "square.and.pencil") { }
                }
            }
            .onAppear {
                femail.isRead = true
            }
        }
    }
}

#Preview {
    DetailScreenView(
        femail: .constant(mail1),
        allMails: mails,
        currentIndex: 0
    )
}
