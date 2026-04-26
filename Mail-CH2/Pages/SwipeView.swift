//
//  SwipeView.swift
//  Mail-CH2

//  Created by Kenzie Fubrianto on 21/04/26.
//

import SwiftUI

struct SwipeView: View {
    @Environment(MailStore.self) var mailStore
    var body: some View {
        
                ZStack{
                  
                    
                    CardStack().frame(maxWidth:.infinity, maxHeight:.infinity).background(Color(hex:"#727272")).ignoresSafeArea().navigationBarTitleDisplayMode(.inline).toolbar{
                        ToolbarItem(placement:.title){
                            Text("Focus Card") .font(.headline)
                                .foregroundColor(.white)
                        }
                         ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                print("Swipe View")
                            }) {
                                Image(systemName: "ellipsis")
                            }
                        }
                    }
                    VStack{
                        HStack{
                            Image(systemName: "envelope.open.fill").font(Font.system(size: 30, weight: .bold)).foregroundColor(.red)
                            Spacer()
                            Image(systemName: "bookmark.fill").font(Font.system(size: 30, weight: .bold)).foregroundColor(.green)

                        }.frame(maxWidth:.infinity).padding(.horizontal,30).padding(.vertical,20).opacity(0.3)
                       
                    Spacer()
                    }.frame(maxWidth:.infinity,maxHeight:.infinity)
                }
               
            
     
        
    }
}

// MARK: - Swipe Direction
enum SwipeDirections {
    case trash,important,none
}


struct CardStack: View {
    @Environment(MailStore.self) var mailStore
    @State private var cardMails: [Mail] = []
    @State var showSheet: Bool = false
    @State var selectedMail: Mail? = nil
    
    // MARK: Actions
    private func handleSwipe(_ direction: SwipeDirections, mail: Mail)->Void {
        
        switch direction{
        case .important:
            mailStore.marksAsImportant(mail:mail)
            mailStore.markAsRead(mail:mail)
            break;
        case .trash:
            mailStore.markAsRead(mail:mail)
            break;
        case.none:
            break
        }
        
        cardMails.removeAll { $0.id == mail.id }
        selectedMail = cardMails.first
    }
    var body: some View{
        GeometryReader{ geo in
            
            ZStack {
                ForEach(Array(cardMails.prefix(3).enumerated().reversed()), id: \.element.id) { index, mail in
                    Swipeable(mail: .constant(mail)) { direction in
                        handleSwipe(direction,mail:mail)
                    }
                    .zIndex(Double(3 - index))
                    //                .scaleEffect(1 - CGFloat(index) * 0.04)
                    .offset(y: CGFloat(index) * 8)
                    .allowsHitTesting(index == 0)
                }
                if !cardMails.isEmpty {
                    VStack {
                        Spacer()
                        HStack(alignment: .center, spacing: 8) {
                            Button {
                            } label: {
                                Image(systemName: "clock")
                                    .font(.system(size: 24))
                                    .frame(width: 56, height: 56)
                            }
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                            
                            Button {
                                showSheet=true
                            } label: {
                                Image(systemName: "arrowshape.turn.up.left.fill")
                                    .font(.system(size: 28))
                                    .frame(width: 64, height: 64)
                            }
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                            
                            Button {
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 24))
                                    .frame(width: 56, height: 56)
                            }
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 70)
                    }
                }
             
                
                
            }.frame(width:geo.size.width,height:geo.size.height)
                .sheet(isPresented: $showSheet) {
                    EmptySheet(showSheet: $showSheet, toField:selectedMail?.sender ?? "", Contacts: Contacts)
        .presentationDragIndicator(.visible)
                }.onAppear {
                    cardMails = mailStore.unreadMail()
                    selectedMail = cardMails.first ?? nil
                }
        }
        
      
     
       
    }
}


struct Swipeable: View {

    @Binding var mail: Mail;
    var swipeThreshold:CGFloat = 100;
    let  onSwipe: (SwipeDirections) -> Void;
    
    
    // posititon of the object
    @State private var offset: CGSize = .zero   // CGSize is like Vector2
    @State private var isDragging = false
    
    var importantOpacity: Double {
        max(0, Double(offset.width / swipeThreshold)*0.4)
    }
 
    var trashOpacity: Double {
        max(0, Double(-offset.width / swipeThreshold)*0.4)
    }
    
    private func flyOut (direction: SwipeDirections){ // this will be inside the onchange func on drag gesture
        let movementBehaviour: CGFloat = direction == .important ? 600 : -600
        withAnimation(.easeOut(duration:0.5)){
            offset = CGSize(width:movementBehaviour, height:100)
        }// animation for moving the offset
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // make sure animation done , before triggering this func
                    onSwipe(direction)
        }
        
    }

    
    private var dragGesture : some Gesture {
        DragGesture()
            .onChanged{ value in
        
            offset = value.translation
            isDragging = true // calculate current position of the cursor position
          
        }
            .onEnded{value in
                 // make it stay back in position after not dragging
                isDragging=false
                let tx = value.translation.width
                if tx > swipeThreshold{
                    flyOut(direction: .important)
                    
                }
                else if tx < -swipeThreshold{
                    flyOut(direction: .trash)
                }
                else {
                    withAnimation(.spring()) { offset = .zero }
                }
               
        }
    }
    
    private var rotationAngle: CGFloat{
        Double(offset.width / 20)   // tilt is depends on the width of the object being dragged from the position.  the small is the division the more degree it will be
    }

    
    var body: some View{
        
        ZStack{
            if offset.width < 0 && isDragging {
                HStack {
                             // warm ambient glow filling the background
                             LinearGradient(
                                 colors: [
                                     Color.red.opacity(trashOpacity * 1.2),
                                     Color.red.opacity(trashOpacity * 0.6),
                                     Color.clear
                                 ],
                                 startPoint: .leading,
                                 endPoint: .trailing
                             )
                             .ignoresSafeArea()

                             // bright sun core bursting from the right edge
//                             RadialGradient(
//                                 colors: [
//                                     Color.white.opacity(importantOpacity * 1.5),
//                                     Color.green.opacity(importantOpacity),
//                                     Color.green.opacity(importantOpacity * 0.8),
//                                     Color.clear
//                                 ],
//                                 center: UnitPoint(x: 1.1, y: 0.5), // slightly off-screen right
//                                 startRadius: 0,
//                                 endRadius: 300
//                             )
//                             .ignoresSafeArea()
                }
                
            }else if offset.width > 0 && isDragging {
//                HStack(spacing:0){
//                    Spacer()
//                    Color.green
//                        .ignoresSafeArea()
//                        .containerRelativeFrame(.horizontal,alignment: .trailing){length, _ in length/2}
//                        .opacity(importantOpacity)
                HStack {
                             // warm ambient glow filling the background
                             LinearGradient(
                                 colors: [
                                     Color.green.opacity(importantOpacity * 1.2),
                                     Color.green.opacity(importantOpacity * 0.6),
                                     Color.clear
                                 ],
                                 startPoint: .trailing,
                                 endPoint: .leading
                             )
                             .ignoresSafeArea()

                            
                }
            }
            SwipeCard(mail:mail).offset(offset)   // add state offset so the object can update its position
                .rotationEffect(.degrees(rotationAngle))  // add tilt
                .gesture(dragGesture)  // add the gesture
                .animation(.interactiveSpring(), value: offset)  // animation
                .scaleEffect(1 + (isDragging ? 0.1 : 0))
                .shadow(color: .gray, radius: 20,x: 0,y: 10)
               
                
            
            
        }
        
       
          
    }
}

#Preview {
    SwipeView()
}
