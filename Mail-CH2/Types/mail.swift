//
//  mail.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//
import SwiftUI

enum MailCategory: String, CaseIterable, Identifiable {
    case important, normal
    
    var id: String { self.rawValue }
}

struct Mail: Identifiable {
    var id: UUID = UUID()
    
    //characteristic
    var sender: String
    var color: Color
    var subject: String
    var date: Date
    var recipient: String
    var summary: String
    var isRead: Bool
    var categories: MailCategory
    
    init(sender: String, color: Color, subject: String, date: Date, recipient: String, summary: String, isRead: Bool, categories: MailCategory = MailCategory.normal) {
        self.sender = sender
        self.color = color
        self.subject = subject
        self.date = date
        self.recipient = recipient
        self.summary = summary
        self.isRead = isRead
        self.categories = categories
    }
    
   

}


struct FrequentMail: Identifiable, Hashable {
    var id: UUID = UUID()
    //characteristic
    var sender: String
    var count: Int
    
    init(sender: String,count : Int = 0) {
        self.sender = sender
        self.count = count
    }
    
   

}
