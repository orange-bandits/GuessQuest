//
//  ContentView.swift
//  GuessQuest
//
//  Created by Tukan van der Borgh on 18/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var questionsAsked = 0
    @State private var score = 0
    
    @State private var showingFinalScore = false
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy",
                     "Nigeria", "Poland", "Ukraine", "Spain", "United Kingdom",
                     "United States"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2) // Which "button" holds the correct answer
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess Quest")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                        .foregroundStyle(.secondary)
                        .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            onTapFlag(number)
                        } label: {
                            Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                .foregroundStyle(.white)
                .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: continueGame)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game over!", isPresented: $showingFinalScore) {
            Button("Play again", action: playAgain)
        } message: {
            Text("Good job! Your score was \(score) out of 8.")
        }
    }
    
    func onTapFlag(_ number: Int) {
        if number == correctAnswer {
            score += 1
            continueGame()
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            showingScore = true
        }
    }
    
    func playAgain() {
        questionsAsked = 0
        score = 0
        
        askQuestion()
    }
    
    func continueGame() {
        questionsAsked += 1

        if (questionsAsked == 8) {
            showingFinalScore = true
        } else {
            askQuestion()
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
