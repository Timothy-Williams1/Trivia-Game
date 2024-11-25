//
//  ContentView.swift
//  Trivia Game
//
//  Created by Student on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message = "when was the first video game made?"
    @State private var questionIndex = 0
    
    @State private var showingScore = false

    @State private var finalAlert = false
    @State private var questionNumber = 0
    
    @State private var gameStarted = false
    @State private var questions = ["when was the first video game made?", "What was the first video game created?","What company made the first video game system?","What video game sold the most copies?","What video game was made first?","Game over!"]
    @State private var answers = [
        [
            ["1970's", "Wrong"],
            ["1960's", "Wrong"],
            ["1950's", "Correct"],
            //The first video game was made in 1952.
            ["1940's", "Wrong"]
        ],
        [
            ["Tetris", "Wrong"],
            ["Tennis for Two", "Wrong"],
            ["Pong", "Wrong"],
            ["OXO", "Correct"]
            //OXO was made by A.S. Douglas in 1952, Then tennis for two in 1958,Then Pong in 1972, Then Tetris in 1985.
        ],
        [
            ["Sega", "Wrong"],
            ["Atari", "Wrong"],
            ["Sanders Associates", "Correct"],
            //The first company to receive a patent for a video game system was Sanders Associates in 1964 named The Brown Box after that Magnavox purchased the patent and began producing video game systems in the early 1970s.
            ["Magnavox", "Wrong"]
        ],
        [
            ["Tetris", "Correct"],
            ["Sonic the Hedgehog", "Wrong"],
            ["Pacman", "Wrong"],
            ["Mario Bros.", "Wrong"]
        ],
        [
            ["Sonic the Hedgehog", "Wrong"],
            ["Mario Bros.", "Wrong"],
            ["Donkey Kong", "Correct"],
            //Donkey Kong was made in 1981 followed by mario bros. in 1983, then Tetris in 1984-1985, last was Sonic the Hedgehog in 1991
            ["Tetris", "Wrong"]
        ],
        [
            ["", "Wrong"],
            ["", "Wrong"],
            ["", "Correct"],
            //The first video game was made in 1952.
            ["", "Wrong"]
        ]
    ]
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.4, blue: 0.55), location: 0.25),
                .init(color: Color(red: 0.3, green: 0.65, blue: 0.4), location: 0.65),
                .init(color: Color(red: 0.1, green: 0.8, blue: 0.54), location: 0.99)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            if gameStarted == true {
                VStack{
                    if questionIndex == 5 {
                        Text("Game Over!")
                            .font(.largeTitle)
                            .foregroundStyle(.mint)
                    } else {
                        Text(message)
                            .font(.largeTitle)
                            .foregroundStyle(.cyan)
                        
                        Button {
                            checkAnswer(ans: 0)
                        } label: {
                            Text(answers[questionIndex][0][0])
                                .font(.largeTitle)
                        }
                        
                        Button {
                            checkAnswer(ans: 1)
                        } label: {
                            Text(answers[questionIndex][1][0])
                                .font(.largeTitle)
                        }
                        
                        Button {
                            checkAnswer(ans: 2)
                        } label: {
                            Text(answers[questionIndex][2][0])
                                .font(.largeTitle)
                        }
                        
                        Button {
                            checkAnswer(ans: 3)
                        } label: {
                            Text(answers[questionIndex][3][0])
                                .font(.largeTitle)
                        }
                        
                        Button {
                            nextQuestion()
                        } label: {
                            Text("Next Question")
                                .font(.largeTitle)
                        }
                    }
                }
                
            } else {
                
                VStack {
                    
                    Text("Old Video Game Trivia")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.blue)
                    
                    Button("Start Game!", action: startGame)
                        .foregroundStyle(.cyan)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 200)
                .clipShape(.rect(cornerRadius: 20))
            }
        }
    }
    
    func startGame() {
        gameStarted = true
    }
    
    func nextQuestion() {
        questionIndex += 1
        message = questions[questionIndex]
    }
    
    func checkAnswer(ans: Int){
        if (answers[questionIndex][ans][1] == "Correct") {
            message = "CORRECT"
        } else {
            message = "WRONG"
        }
    }
}

#Preview {
    ContentView()
}
