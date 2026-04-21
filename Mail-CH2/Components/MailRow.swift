//
//  MailRow.swift
//  Mail-CH2
//
//  Created by Michelle Aldorino on 18/04/26.
//

import SwiftUI

struct MailRow: View {
    @Binding var femail: Mail
    var allMails: [Mail]
    var currentIndex: Int
    var body: some View {
        NavigationLink(destination: DetailScreenView(
            femail: $femail,
            allMails: allMails,
            currentIndex: currentIndex)) {
                HStack(spacing: 12){
                    Circle()
                        .foregroundStyle(femail.isRead ? Color.clear : Color.blue)
                        .frame(width: 8)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(femail.color.gradient)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Text(String(femail.sender.prefix(1)).uppercased())
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                        )
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text(femail.sender)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Spacer()
                            
                            HStack{
                                Text(femail.date, format: .dateTime.day().month().year())
                                Image(systemName: "chevron.right.circle")
                            }
                            .foregroundColor(.gray)
                            .font(.caption)
                        }
                        
                        Text(femail.subject)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(femail.summary)
                            .lineLimit(2)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal)
            }
    }
}
#Preview {
    NavigationStack {
        MailRow(
            femail: .constant(mail1),
            allMails: mails,
            currentIndex: 0
        )
    }
}
