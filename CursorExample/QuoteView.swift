//
//  Project: CursorExample
//  File: QuoteView.swift
//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger

import SwiftUI

struct Quote: Identifiable {
    let id = UUID()
    let text: String
    let author: String
}

struct QuoteView: View {
    let onLogout: () -> Void
    
    @State private var currentQuote: Quote = Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"
    )
    
    private let quotes: [Quote] = [
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(text: "Innovation distinguishes between a leader and a follower.", author: "Steve Jobs"),
        Quote(text: "Life is what happens to you while you're busy making other plans.", author: "John Lennon"),
        Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
        Quote(text: "It is during our darkest moments that we must focus to see the light.", author: "Aristotle"),
        Quote(text: "The way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Don't let yesterday take up too much of today.", author: "Will Rogers"),
        Quote(text: "You learn more from failure than from success.", author: "Unknown"),
        Quote(text: "If you are working on something exciting that you really care about, you don't have to be pushed. The vision pulls you.", author: "Steve Jobs"),
        Quote(text: "People who are crazy enough to think they can change the world, are the ones who do.", author: "Rob Siltanen"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "In this life we cannot do great things. We can only do small things with great love.", author: "Mother Teresa"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt")
    ]
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.indigo.opacity(0.7), Color.pink.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Logout button
                HStack {
                    Spacer()
                    Button(action: onLogout) {
                        HStack(spacing: 6) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Log Out")
                        }
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 10)
                }
                
                Spacer()
                
                // Quote display
                VStack(spacing: 20) {
                    Image(systemName: "quote.opening")
                        .font(.system(size: 50))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text(currentQuote.text)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.15))
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        )
                    
                    Text("— \(currentQuote.author)")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.9))
                        .italic()
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Inspire Me button
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        getRandomQuote()
                    }
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "sparkles")
                            .font(.title3)
                        Text("Inspire Me")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color.purple, Color.pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
        }
    }
    
    private func getRandomQuote() {
        var newQuote: Quote
        repeat {
            newQuote = quotes.randomElement() ?? quotes[0]
        } while newQuote.id == currentQuote.id && quotes.count > 1
        
        currentQuote = newQuote
    }
}

#Preview {
    QuoteView(onLogout: {})
}

