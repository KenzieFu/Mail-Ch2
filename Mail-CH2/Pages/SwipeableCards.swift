////
////  SwipeableCards.swift
////  Mail-CH2
////
////  Created by Kenzie Fubrianto on 21/04/26.
////
//
//
//import SwiftUI
// 
//// MARK: - Data Model (replace with your own)
//struct Person: Identifiable {
//    let id = UUID()
//    let name: String
//    let age: Int
//    let city: String
//    let emoji: String
//    let tags: [String]
//}
// 
//let dummyData: [Person] = [
//    Person(name: "Andreea M.", age: 27, city: "Berlin",  emoji: "🧘", tags: ["yoga", "coffee", "travel"]),
//    Person(name: "Kai T.",     age: 31, city: "Tokyo",   emoji: "🎸", tags: ["music", "hiking", "ramen"]),
//    Person(name: "Sofia R.",   age: 24, city: "Lisbon",  emoji: "📸", tags: ["photography", "surf", "design"]),
//    Person(name: "Marcus J.",  age: 29, city: "NYC",     emoji: "🍳", tags: ["cooking", "jazz", "books"]),
//    Person(name: "Yuki N.",    age: 26, city: "Seoul",   emoji: "🎮", tags: ["gaming", "kpop", "cats"]),
//]
// 
//// MARK: - Swipe Direction
//enum SwipeDirection {
//    case like, nope
//}
// 
//// MARK: - Card View (swap this body with your own card design)
//struct CardView: View {
//    let person: Person
// 
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            // Card image / hero area
//            ZStack {
//                RoundedRectangle(cornerRadius: 16)
//                    .fill(Color(.systemGray6))
//                    .frame(height: 200)
//                Text(person.emoji)
//                    .font(.system(size: 80))
//            }
// 
//            VStack(alignment: .leading, spacing: 6) {
//                Text("\(person.name), \(person.age)")
//                    .font(.title2).fontWeight(.semibold)
//                Text(person.city)
//                    .font(.subheadline).foregroundStyle(.secondary)
// 
//                // Tags
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 8) {
//                        ForEach(person.tags, id: \.self) { tag in
//                            Text(tag)
//                                .font(.caption)
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 5)
//                                .background(Color(.systemGray6))
//                                .clipShape(Capsule())
//                        }
//                    }
//                }
//                .padding(.top, 4)
//            }
//            .padding(16)
//        }
//        .background(Color(.systemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
//    }
//}
// 
//// MARK: - Swipeable Card (handles drag gesture + stamps)
//struct SwipeableCard: View {
//    let person: Person
//    let onSwipe: (SwipeDirection) -> Void
// 
//    @State private var offset: CGSize = .zero
//    @State private var isDragging = false
// 
//    private let swipeThreshold: CGFloat = 100
// 
//    var rotationAngle: Double {
//        Double(offset.width / 20)
//    }
// 
//    var likeOpacity: Double {
//        max(0, Double(offset.width / swipeThreshold))
//    }
// 
//    var nopeOpacity: Double {
//        max(0, Double(-offset.width / swipeThreshold))
//    }
// 
//    var body: some View {
//        CardView(person: person)
//            .overlay(stampOverlay)
//            .rotationEffect(.degrees(rotationAngle))
//            .offset(offset)
//            .gesture(dragGesture)
//            .animation(.interactiveSpring(), value: offset)
//    }
// 
//    // MARK: Stamp overlay
//    private var stampOverlay: some View {
//        ZStack {
//            // LIKE stamp
//            Text("LIKE")
//                .font(.title).fontWeight(.bold)
//                .foregroundStyle(.green)
//                .padding(.horizontal, 12).padding(.vertical, 6)
//                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.green, lineWidth: 3))
//                .rotationEffect(.degrees(-15))
//                .opacity(likeOpacity)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                .padding(24)
// 
//            // NOPE stamp
//            Text("NOPE")
//                .font(.title).fontWeight(.bold)
//                .foregroundStyle(.red)
//                .padding(.horizontal, 12).padding(.vertical, 6)
//                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.red, lineWidth: 3))
//                .rotationEffect(.degrees(15))
//                .opacity(nopeOpacity)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                .padding(24)
//        }
//    }
// 
//    // MARK: Drag gesture
//    private var dragGesture: some Gesture {
//        DragGesture()
//            .onChanged { value in
//                offset = value.translation
//                isDragging = true
//            }
//            .onEnded { value in
//                isDragging = false
//                let tx = value.translation.width
// 
//                if tx > swipeThreshold {
//                    flyOut(direction: .like)
//                } else if tx < -swipeThreshold {
//                    flyOut(direction: .nope)
//                } else {
//                    // Snap back
//                    withAnimation(.spring()) { offset = .zero }
//                }
//            }
//    }
//    
//    private func flyOut(direction: SwipeDirection) {
//        let targetX: CGFloat = direction == .like ? 600 : -600
//        withAnimation(.easeOut(duration: 0.3)) {
//            offset = CGSize(width: targetX, height: 40)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            onSwipe(direction)
//        }
//    }
//}
// 
//
//
//// MARK: - Card Stack View
//struct CardStackView: View {
//    @State private var cards: [Person] = dummyData
//    @State private var lastSwipe: SwipeDirection? = nil
// 
//    var body: some View {
//        VStack(spacing: 24) {
//            // Counter
//            Text(cards.isEmpty ? "" : "\(cards.count) remaining")
//                .font(.caption)
//                .foregroundStyle(.secondary)
// 
//            // Stack
//            ZStack {
//                if cards.isEmpty {
//                    emptyState
//                } else {
//                    ForEach(Array(cards.prefix(3).enumerated().reversed()), id: \.element.id) { index, person in
//                        SwipeableCard(person: person) { direction in
//                            handleSwipe(direction)
//                        }
//                        .scaleEffect(scaleFor(index: index))
//                        .offset(y: offsetFor(index: index))
//                        // Only the top card is interactive
//                        .allowsHitTesting(index == 0)
//                    }
//                }
//            }
//            .frame(width: 320, height: 460)
// 
//            // Buttons
//            if !cards.isEmpty {
//                HStack(spacing: 40) {
//                    Button { programmaticSwipe(.nope) } label: {
//                        Image(systemName: "xmark")
//                            .font(.title2)
//                            .frame(width: 56, height: 56)
//                            .background(Color(.systemBackground))
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color(.systemGray4), lineWidth: 0.5))
//                    }
//                    Button { programmaticSwipe(.like) } label: {
//                        Image(systemName: "heart.fill")
//                            .font(.title2)
//                            .foregroundStyle(.pink)
//                            .frame(width: 56, height: 56)
//                            .background(Color(.systemBackground))
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color(.systemGray4), lineWidth: 0.5))
//                    }
//                }
//            }
//        }
//        .padding()
//    }
// 
//    // MARK: Stack positioning
//    private func scaleFor(index: Int) -> CGFloat {
//        let scales: [CGFloat] = [1.0, 0.96, 0.92]
//        return index < scales.count ? scales[index] : 0.88
//    }
// 
//    private func offsetFor(index: Int) -> CGFloat {
//        let offsets: [CGFloat] = [0, 8, 16]
//        return index < offsets.count ? offsets[index] : 24
//    }
// 
//    // MARK: Actions
//    private func handleSwipe(_ direction: SwipeDirection) {
//        withAnimation { cards.removeFirst() }
//        lastSwipe = direction
//    }
// 
//    private func programmaticSwipe(_ direction: SwipeDirection) {
//        // Triggers the top card's button action via state;
//        // simplest approach: call handleSwipe directly since
//        // button-driven swipe doesn't need the fly animation.
//        guard !cards.isEmpty else { return }
//        handleSwipe(direction)
//    }
// 
//    private var emptyState: some View {
//        VStack(spacing: 16) {
//            Text("🎉").font(.system(size: 60))
//            Text("You've seen everyone!")
//                .font(.headline)
//                .foregroundStyle(.secondary)
//            Button("Start over") {
//                withAnimation { cards = dummyData }
//            }
//            .buttonStyle(.bordered)
//        }
//    }
//}
// 
//// MARK: - Preview
//#Preview {
//    CardStackView()
//}
// 
