//
//  mail.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

import SwiftUI
    
    //Data for Email Previews
    let mail1 =
        Mail(sender: "Grab",
             subject:"Your Grab E-Receipt",
             date:Date(),
             recipient:"KenzieFun",
             summary:"Enjoy your meal! 🍽️",
        )
    let mail2 =
        Mail(sender: "The Miro Team",
             subject:"New Activity",
             date:Date(),
             recipient:"Ethereal",
             summary:"New edits and comments on your board, take a look at what changed")

    let mail3 =
        Mail(sender: "Linkedin",
             subject:"Apple Academy is Hiring",
             date:Date(),
             recipient:"Dori",
             summary:"Seeing your amazing unbelievable talent, we think you might be a great fit in Apple Academy as a Senior Leaner")

    let mail4 =
        Mail(sender: "Starbucks",
             subject:"Celebrate your 31st Birthday!",
             date:Date(),
             recipient:"Runi",
             summary:"Congratulations on turning 31! Enjoy a birthday treat on us, claim your reward today!")

    let mail5 =
        Mail(sender: "TMZ", subject:"Possible Job Opportunity",
             date:Date(),
             recipient:"Baeni",
             summary:"Hi Baeni, we would be honored to have you join our team as our new lead photographer")

    let mail6 =
        Mail(sender: "Pertamina",
            subject:"Hello Elite Premium Member ⭐️",
             date:Date(),
             recipient:"Rayne",
             summary:"Hello Rayne, you have been upgraded to Pertamina's Elite Permium Member ⭐️ Exclusive perks are waiting for you, unlock your benefits now")

    let mail7 =
        Mail(sender: "Steam",
             subject:"Congrats on Your First Game!",
             date:Date(),
             recipient:"Mask",
             summary:"Congratulations Mask! Your game is live and ready to play, share it with friends")

    let mail8 =
        Mail(sender: "Traveloka",
             subject:"Your Flight Receipt to Singapore",
             date:Date(),
             recipient:"Vitha",
             summary:"Your booking details are confirmed, view your full receipt anytime")

    let mail9 =
        Mail(sender: "Strava",
             subject:"Wow! Nice Work, You ran 120yds",
             date:Date(),
             recipient:"SamJOYCE",
             summary:"Congrats Sam, you've ran the distance of an entire american football field. Your latest activity has been recorded, keep up the momentum")

    let mail10 =
        Mail(sender: "Tokopedia",
             subject:"Pesanan Selesai: Microwave",
             date:Date(),
             recipient:"Moreno",
             summary:"Your order has been delivered successfully, we hope you enjoy it!")

    let mail11 =
        Mail(sender: "Medium",
             subject:"Read about Healthy Bowels Movement",
             date:Date(),
             recipient:"Capybarra",
             summary:"We've heard you've been having issues, here's a new article you might find useful, start reading now")

    let mail12 =
        Mail(sender: "Hevy",
             subject:"Check out your progress",
             date:Date(),
             recipient:"Choki",
             summary:"Choki, you've lifted 10x your body weight. Keep up the great work!")

let mails: [Mail] = [mail1,mail2,mail3, mail4,mail5,mail6,mail7,mail8,mail9,mail10,mail11,mail12]
// 16 February
