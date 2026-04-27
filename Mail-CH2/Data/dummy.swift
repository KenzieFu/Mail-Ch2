//
//  mail.swift
//  Mail-CH2
//
//  Created by Kenzie Fubrianto on 18/04/26.
//

let colors :[ColorsRecentItem]=[
    ColorsRecentItem(background: "#EBCFFF", text: "#754DA6"),
    ColorsRecentItem(background: "#CBECFF", text: "#229EBF"),
    ColorsRecentItem(background: "#E9FFDB", text: "#589C83"),
    ColorsRecentItem(background: "#FFDBA7", text: "#DB9446"),
    ColorsRecentItem(background: "#FF9E97", text: "#E7475B")
]
import SwiftUI
    
    //Data for Email Previews
    let mail1 =
        Mail(sender: "Grab",
             color:Color.green,
             subject:"Your Grab E-Receipt",
             date:Date(),
             recipient:"KenzieFun",
             summary:"""
                 We hope you enjoyed your trip! \n
                 Hi KenzieFun, \n
                 Thanks for riding with Grab. Here’s your e-receipt for your recent order, and we hope everything arrived fresh and just the way you like it. \n
                 Order details, including the total amount, delivery address, and payment method, can be found in your Grab app. If anything seems off or you need help, you can easily access support directly from your order history. \n
                 We’re always working to make your experience smoother and more enjoyable, so your feedback is always welcome. Let us know how we did! \n
                 Thanks again for choosing Grab. We look forward to serving you again soon. \n
                 Best regards,
                 Grab
                 """,
             isRead: false,

        )

let mail2 =
Mail(sender: "The Miro Team",
     color:Color.yellow,
     subject:"New Activity",
     date:Date(),
     recipient:"Ethereal",
     summary:"""
            New edits and comments on your board, take a look at what changed \n
            Hi Ethereal,\n
            There’s been some new activity on your Miro board. Your collaborators have made edits and left comments, so you can quickly catch up on what’s changed and keep things moving forward. \n
            You can review all updates directly in your board, where you’ll find highlighted changes and discussion threads to help you stay aligned with your team. \n
            If you’d like to manage notifications or control what updates you receive, you can adjust your settings anytime in your Miro account. \n
            Stay in the loop and keep collaborating seamlessly with your team. \n
            Best regards,
            The Miro Team
            """,
             isRead: false,
        
        )

let mail3 =
Mail(sender: "Linkedin",
     color:Color.blue,
     subject:"Apple Academy is Hiring",
     date:Date(),
     recipient:"Dori",
     summary:"""
                Hi Dori, Seeing your amazing unbelievable talent, we think you might be a great fit in Apple Academy as a Senior Learner \n
                We came across your profile and were genuinely impressed by your experience and creative work. Based on what we’ve seen, we believe you could be a strong fit for an opportunity at Apple Academy. \n
                We’re currently looking for a Senior Learner who is passionate about growth, collaboration, and building impactful projects alongside a dynamic community. Your background and skills stood out to us as someone who could thrive in this environment. \n
                If this sounds like something you’d be interested in, we encourage you to learn more about the role and consider applying through LinkedIn. \n
                We’d love to see what you could bring to the Apple Academy community. \n
                Best regards,
                LinkedIn
                """,
             isRead: true,
          
        )

    let mail4 =
        Mail(sender: "Starbucks",
             color:Color.green,
             subject:"Celebrate your 31st Birthday!",
             date:Date(),
             recipient:"Runi",
             summary:"""
                Hi Runi, Congratulations on turning 31! Enjoy a birthday treat on us, claim your reward today! \n
                Happy 31st birthday! We’re so glad to be part of your special day and wanted to celebrate with you. \n
                To make your day a little sweeter, we’ve prepared a special birthday treat just for you. You can claim your reward at your nearest Starbucks store or through the app. \n
                Whether it’s your favorite drink or something new you’ve been wanting to try, we hope it adds a little extra joy to your celebration. \n
                Don’t forget to redeem your reward before it expires, and treat yourself—you deserve it. \n
                Wishing you a wonderful year ahead filled with great moments and even better coffee. \n
                Best regards,
                Starbucks
                """,
     isRead: false,
)
let mail5 =
Mail(sender: "TMZ",
     color:Color.red,
     subject:"Possible Job Opportunity",
     date:Date(),
     recipient:"Baeni",
     summary:"""
                Hi Baeni, we would be honored to have you join our team as our new lead photographer \n
                We’ve been following your work and are incredibly impressed by your eye for detail and ability to capture compelling moments. Your style and consistency really stood out to us. \n
                We’d be honored to invite you to join TMZ as our new Lead Photographer. This role would involve covering high-profile events, capturing exclusive content, and working alongside a fast-paced media team. \n
                We believe your creative direction and experience would be a perfect match for what we’re building, and we’re excited about the possibility of you bringing your perspective to our platform. \n
                If you’re interested, we’d love to discuss the opportunity further and walk you through the next steps. \n
                Looking forward to hearing from you. \n
                Best regards,
                TMZ
                """,
     isRead: true,
)

let mail6 =
Mail(sender: "Pertamina",
     color:Color.red,
     subject:"Hello Elite Premium Member ⭐️",
     date:Date(),
     recipient:"Rayne",
     summary:"""
                Hello Rayne, you have been upgraded to Pertamina's Elite Permium Member ⭐️ Exclusive perks are waiting for you, unlock your benefits now \n
                Congratulations! You’ve officially been upgraded to Pertamina’s Elite Premium Member status. This tier unlocks a range of exclusive benefits designed to give you a more rewarding experience. \n
                As an Elite Premium Member, you’ll enjoy special privileges such as priority services, exclusive offers, and access to limited-time rewards tailored just for you. \n
                Be sure to explore your benefits through the Pertamina app or at participating locations to make the most of your new status. \n
                We’re excited to have you as part of our premium community and look forward to serving you even better. \n
                Best regards,
                Pertamina
                """,
     isRead: false,
)

let mail7 =
Mail(sender: "Steam",
     color:Color.blue,
     subject:"Congrats on Your First Game!",
     date:Date(),
     recipient:"Mask",
     summary:"""
                Congratulations Mask! Your game is live and ready to play, share it with friends \n
                Congratulations on launching your very first game on Steam! This is a huge milestone, and you should be proud of bringing your creation to life. \n
                Your game is now live and available for players around the world to discover, play, and enjoy. It’s the perfect time to share it with your friends, community, and audience to start building momentum. \n
                Be sure to keep an eye on player feedback, reviews, and engagement as your game reaches more people. This is just the beginning of your journey as a creator. \n
                We’re excited to see how your game grows and what you’ll create next. \n
                Best regards,
                Steam
                """,
     isRead: false,
)

let mail8 =
Mail(sender: "Traveloka",
     color:Color.green,
     subject:"Your Flight Receipt to Singapore",
     date:Date(),
     recipient:"Vitha",
     summary:"""
                Hi Vitha, Your booking details are confirmed, view your full receipt anytime \n
                Your flight booking to Singapore has been successfully confirmed, and your receipt is now available for your reference. \n
                You can review your full booking details, including flight schedule, passenger information, and payment summary, directly through your Traveloka account at any time. \n
                If you need to make any changes or require assistance, our support team is ready to help ensure your journey goes smoothly. \n
                We wish you a pleasant trip and hope you have a wonderful time in Singapore. \n
                Best regards,
                Traveloka
                """,
     isRead: true,
)

let mail9 =
Mail(sender: "Strava",
     color:Color.orange,
     subject:"Wow! Nice Work, You ran 120yds",
     date:Date(),
     recipient:"SamJOYCE",
     summary: """
                Congrats Sam, you've ran the distance of an entire american football field. Your latest activity has been recorded, keep up the momentum \n
                Nice work on your latest run! Hitting 120 yards is a great step forward, and every bit of distance adds up toward your bigger goals. \n
                Your activity has been successfully recorded, and you can check out your stats, pace, and progress anytime on your Strava profile. \n
                Consistency is key, and you’re building great momentum—keep it going and see how far you can push yourself next. \n
                Whether it’s a quick run or a long session, every effort counts. \n
                Keep moving and stay motivated. \n
                Best regards,
                Strava
                """,
     isRead: false,
)

let mail10 =
Mail(sender: "Tokopedia",
     color:Color.green,
     subject:"Pesanan Selesai: Microwave",
     date:Date(),
     recipient:"Moreno",
     summary:"""
                Hey Moreno, Your order has been delivered successfully, we hope you enjoy it! \n
                Pesanan Anda untuk microwave telah berhasil доставkan dan kini sudah sampai di tujuan. Kami harap produk yang Anda terima sesuai dengan harapan dan dapat digunakan dengan baik. \n
                Anda dapat melihat detail pesanan, termasuk informasi pengiriman dan pembayaran, melalui akun Tokopedia Anda kapan saja. \n
                Jika ada kendala dengan pesanan Anda, jangan ragu untuk menghubungi penjual atau pusat bantuan kami untuk mendapatkan bantuan lebih lanjut. \n
                Terima kasih telah berbelanja di Tokopedia, kami tunggu pesanan Anda berikutnya. \n
                Best regards,
                Tokopedia
                """,
     isRead: false,
)

let mail11 =
Mail(sender: "Medium",
     color:Color.black,
     subject:"Read about Healthy Bowels Movement",
     date:Date(),
     recipient:"Capybarra",
     summary:"""
                We've heard you've been having issues, here's a new article you might find useful, start reading now \n
                Hi Capybarra,\n
                We came across an article that might be helpful for you, especially if you’ve been exploring ways to improve your digestive health. \n
                This piece covers healthy bowel movements, offering practical tips, insights, and habits that can support a more comfortable and balanced routine. \n
                You can start reading anytime on Medium and explore more articles tailored to your interests and well-being. \n
                We hope you find it informative and helpful. \n
                Best regards,
                Medium
                """,
     isRead: true,
)

let mail12 =
Mail(sender: "Hevy",
     color:Color.black,
     subject:"Check out your progress",
     date:Date(),
     recipient:"Choki",
     summary:"""
                Choki, you've lifted 10x your body weight. Keep up the great work! \n
                We just took a look at your recent training progress, and it’s seriously impressive. You’ve reached a milestone of lifting a total volume equivalent to 10x your body weight. \n
                This kind of consistency and effort shows real dedication to your strength journey. Every session is clearly adding up, and your progress reflects the work you’ve been putting in. \n
                You can view your full stats, track your lifts, and see how far you’ve come anytime in the Hevy app. \n
                Keep pushing, stay consistent, and keep building on this momentum. \n
                Best regards,
                Hevy
                """,
     isRead: true,
)


let mail13 =
Mail(sender: "Tokopedia",
     color:Color.green,
     subject:"Pesanan Selesai: Microwave",
     date:Date(),
     recipient:"Moreno",
     summary:"""
                Hey Moreno, Your order has been delivered successfully, we hope you enjoy it! \n
                Pesanan Anda untuk microwave telah berhasil доставkan dan kini sudah sampai di tujuan. Kami harap produk yang Anda terima sesuai dengan harapan dan dapat digunakan dengan baik. \n
                Anda dapat melihat detail pesanan, termasuk informasi pengiriman dan pembayaran, melalui akun Tokopedia Anda kapan saja. \n
                Jika ada kendala dengan pesanan Anda, jangan ragu untuk menghubungi penjual atau pusat bantuan kami untuk mendapatkan bantuan lebih lanjut. \n
                Terima kasih telah berbelanja di Tokopedia, kami tunggu pesanan Anda berikutnya. \n
                Best regards,
                Tokopedia
                """,
     isRead: false,
)

let mail14 =
Mail(sender: "Tokopedia",
     color:Color.green,
     subject:"Pesanan Selesai: Microwave",
     date:Date(),
     recipient:"Moreno",
     summary:"""
                Hey Moreno, Your order has been delivered successfully, we hope you enjoy it! \n
                Pesanan Anda untuk microwave telah berhasil доставkan dan kini sudah sampai di tujuan. Kami harap produk yang Anda terima sesuai dengan harapan dan dapat digunakan dengan baik. \n
                Anda dapat melihat detail pesanan, termasuk informasi pengiriman dan pembayaran, melalui akun Tokopedia Anda kapan saja. \n
                Jika ada kendala dengan pesanan Anda, jangan ragu untuk menghubungi penjual atau pusat bantuan kami untuk mendapatkan bantuan lebih lanjut. \n
                Terima kasih telah berbelanja di Tokopedia, kami tunggu pesanan Anda berikutnya. \n
                Best regards,
                Tokopedia
                """,
     isRead: false,
)

let mail15 =
Mail(sender: "Hevy",
     color:Color.black,
     subject:"Check out your progress",
     date:Date(),
     recipient:"Choki",
     summary:"""
                Choki, you've lifted 10x your body weight. Keep up the great work! \n
                We just took a look at your recent training progress, and it’s seriously impressive. You’ve reached a milestone of lifting a total volume equivalent to 10x your body weight. \n
                This kind of consistency and effort shows real dedication to your strength journey. Every session is clearly adding up, and your progress reflects the work you’ve been putting in. \n
                You can view your full stats, track your lifts, and see how far you’ve come anytime in the Hevy app. \n
                Keep pushing, stay consistent, and keep building on this momentum. \n
                Best regards,
                Hevy
                """,
     isRead: true,
)


struct MailDummyData {
    static let mails:[Mail] = [mail1,mail2,mail3, mail4,mail5,mail6,mail7,mail8,mail9,mail10,mail11,mail12,mail13,mail14,mail15]
}

let mails: [Mail] = [mail1,mail2,mail3, mail4,mail5,mail6,mail7,mail8,mail9,mail10,mail11,mail12]
// 16 February

// MARK: - Data for Contact-
let contact1 =
Contact(name: "KenzieFu",
        bgColor: Color(red: 0.87, green: 0.80, blue: 0.97),
        textColor: Color(red: 0.50, green: 0.15, blue: 0.75))

let contact2 =
Contact(name: "DoriGoreng",
        bgColor: Color(red: 0.78, green: 0.91, blue: 0.97),
        textColor: Color(red: 0.10, green: 0.55, blue: 0.80))

let contact3 =
Contact(name: "Ethereal",
        bgColor: Color(red: 0.84, green: 0.95, blue: 0.82),
        textColor: Color(red: 0.10, green: 0.55, blue: 0.25))

let contact4 =
Contact(name: "Capybarra",
        bgColor: Color(red: 0.98, green: 0.87, blue: 0.68),
        textColor: Color(red: 0.80, green: 0.42, blue: 0.10))

let contact5 =
Contact(name: "Mask",
        bgColor: Color(red: 0.97, green: 0.72, blue: 0.72),
        textColor: Color(red: 0.85, green: 0.25, blue: 0.25))

let contact6 =
Contact(name: "Rayne",
        bgColor: Color(red: 0.87, green: 0.80, blue: 0.97),
        textColor: Color(red: 0.50, green: 0.15, blue: 0.75))

let contact7 =
Contact(name: "Vitha",
        bgColor: Color(red: 0.78, green: 0.91, blue: 0.97),
        textColor: Color(red: 0.10, green: 0.55, blue: 0.80))

let contact8 =
Contact(name: "Baeni",
        bgColor: Color(red: 0.84, green: 0.95, blue: 0.82),
        textColor: Color(red: 0.10, green: 0.55, blue: 0.25))

let contact9 =
Contact(name: "Choki",
        bgColor: Color(red: 0.98, green: 0.87, blue: 0.68),
        textColor: Color(red: 0.80, green: 0.42, blue: 0.10))

let contact10 =
Contact(name: "Moreno",
        bgColor: Color(red: 0.97, green: 0.72, blue: 0.72),
        textColor: Color(red: 0.85, green: 0.25, blue: 0.25))

let contact11 =
Contact(name: "Runi",
        bgColor: Color(red: 0.87, green: 0.80, blue: 0.97),
        textColor: Color(red: 0.50, green: 0.15, blue: 0.75))

let contact12 =
Contact(name: "SamJOYCE",
        bgColor: Color(red: 0.78, green: 0.91, blue: 0.97),
        textColor: Color(red: 0.10, green: 0.55, blue: 0.80))

let Contacts: [Contact] = [contact1,contact2,contact3, contact4,contact5,contact6,contact7,contact8,contact9,contact10,contact11,contact12]


