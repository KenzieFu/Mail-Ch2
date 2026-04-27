//
//  MailStore.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 24/04/26.
//

import Foundation
import SwiftUI

@Observable
class MailStore {
    var mails: [Mail] = MailDummyData.mails
    
    
    //function
    func readMail()->[Mail] {
        return mails.filter { $0.isRead == true }
    }
    
    func unreadMail()->[Mail] {
        return mails.filter { $0.isRead == false }
    }
    
    func markAsRead(mail: Mail){
        if let index = mails.firstIndex(where:{$0.id == mail.id}){
            mails[index].isRead = true
        }
    }
    
    func marksAsImportant(mail: Mail){
        if let index = mails.firstIndex(where: { $0.id == mail.id }) {
            mails[index].categories = .important
            print("Marked \(mails[index].sender) as important")  // debug
        } else {
            print("Mail not found!")  // debug
        }
    }
    
    func filterImportanMail()->[Mail]{
        return mails.filter{$0.categories == MailCategory.important}
    }
    
    func recentMail()->[Mail]{
        let recents = mails.sorted(by: { $0.date > $1.date })
        return recents
    }
    
    func filterMail(mail: Mail)->Int{
        return mails.firstIndex(where: { $0.id == mail.id })!
    }
    
    func addMails(mail:Mail){
        mails.append(mail)
    }
    
    func frequentMail()->[Mail]{
        var filteredMails: [Mail] = []
        var seen = Set<String>()
        var freqMails: [FrequentMail] = []

        for mail in mails {
            if seen.insert(mail.sender).inserted {
                let count = mails.filter { $0.sender == mail.sender }.count
                freqMails.append(FrequentMail(sender: mail.sender, count: count))
            }
        }

        let ordered = freqMails.sorted { $0.count > $1.count }
        
        for freq in ordered {
            let email = mails.first(where: { $0.sender == freq.sender })!
            filteredMails.append(email)
        }
        return filteredMails
    }
    
    
}
