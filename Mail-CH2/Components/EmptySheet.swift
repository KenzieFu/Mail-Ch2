//
//  EmptySheet.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 21/04/26.
//

import SwiftUI

struct EmptySheet: View {
    @Environment(MailStore.self) var mailStore
    @Binding var showSheet: Bool
    @State var toField: String = ""
    @State  var ccBccFrom: String = ""
    @State  var subject: String = ""
    @State  var bodyText: String = ""
    
    private func addMail () -> Void {
        var newMail: Mail = Mail( sender: "Kenzie", color: Color.red, subject: subject, date: Date.now, recipient: toField, summary: bodyText, isRead: false)
        mailStore.addMails(mail:   newMail)
        
    }
    
    
    @State var Contacts: [Contact]
    var body: some View {
        NavigationStack{
            VStack() {
                VStack(spacing: 0) {
                    HStack {
                        Text("New Message")
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(Contacts) { contact in
                                VStack(spacing: 6) {
                                    ZStack {
                                        Circle()
                                            .fill(contact.bgColor)
                                            .frame(width: 68, height: 68)
                                        Text(String(contact.name.prefix(1)).uppercased())
                                            .font(.system(size: 30, weight: .bold))
                                            .foregroundColor(contact.textColor)
                                    }
                                    Text(contact.name)
                                        .font(.system(size: 12))
                                        .foregroundColor(.secondary)
                                }
                                .onTapGesture {
                                    toField = contact.name
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 16)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("To :")
                                .foregroundColor(.secondary)
                            TextField("", text: $toField)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                        
                        HStack {
                            Text("Cc/Bcc From :")
                                .foregroundColor(.secondary)
                                .frame(width: 110, alignment: .leading)
                            TextField("", text: $ccBccFrom)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                        
                        HStack {
                            Text("Subject :")
                                .foregroundColor(.secondary)
                            TextField("", text: $subject)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        
                        Divider().padding(.leading, 20)
                    }
                    TextEditor(text: $bodyText)
                        .tint(.primary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button { showSheet = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addMail()
                        showSheet = false
                        
                    } label: {
                        Image(systemName: "arrow.up")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        
    }
}
#Preview {
    EmptySheet(showSheet: .constant(true),toField: "hello@gmail.com", Contacts: Contacts).environment(MailStore())
}
