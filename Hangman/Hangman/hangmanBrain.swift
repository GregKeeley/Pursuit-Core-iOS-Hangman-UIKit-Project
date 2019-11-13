//
//  hangmanBrain.swift
//  Hangman
//
//  Created by Gregory Keeley on 11/12/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

var randomWord = words.randomElement()?.lowercased() ?? "ERROR"
var underscoresFromRandomWord:[Character] = Array(String(repeating: "_", count: randomWord.count))
var hiddenWord = String(underscoresFromRandomWord)
var maxGuesses = 5
var guessCounter = 0
var lettersGuessed = ""
var repeatCondition = true
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var indices = [Int]()
var totalGuesses = (0)
var correctGuess = ""
var winWord = ""
func resetGame() -> () {
    randomWord = words.randomElement()?.lowercased() ?? "ERROR"
    underscoresFromRandomWord = Array(String(repeating: "_", count: randomWord.count))
    hiddenWord = String(underscoresFromRandomWord)
    lettersGuessed = ""
    guessCounter = 0
    repeatCondition = true
}


//=============================================================================================================
// Hangman loop
//=============================================================================================================
func hangmanBrain() {
    repeat {
        
        if randomWord == (String(underscoresFromRandomWord)) {
            let losePrompt = readLine()?.lowercased() ?? "no"
            if losePrompt == "yes" {
                resetGame()
            } else {
                break
            }
        }
        print("Enter your character here:", terminator: " ")
        let userInput = readLine()?.lowercased() ?? ""
        if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) {
            sleep(1)
            print("please try again")
            print()
            continue
        }
        if randomWord.contains(userInput) {
            print()
            for (index, char) in randomWord.enumerated() {
                if userInput.contains(char) {
                    indices.append(index)
                    correctGuess.append(userInput)
                    winWord.append(userInput)
                }
            }
            for (index, _) in underscoresFromRandomWord.enumerated() {
                if indices.contains(index) {
                    underscoresFromRandomWord[index] = Character(userInput)
                }
            }
            indices.removeAll()
        }
        if !randomWord.contains(userInput) {
            guessCounter += 1
            lettersGuessed.append(userInput + ", ")
            totalGuesses += 1
        }
        print()
        if guessCounter > maxGuesses {
            print(hangManFinal)
            print()
            print("You lost! The man has been hung")
            print()
            print("It took you \(totalGuesses) guesses to complete")
            print("The word was \"\(randomWord)\"")
            print()
            print("Would you like to play again?")
            let losePrompt = readLine()?.lowercased() ?? "no"
            if losePrompt == "yes" {
                resetGame()
            } else {
                print("Goodbye!")
                break
            }
        }
        switch guessCounter {
        case 0:
            print(hangManEmpty)
        case 1:
            print()
            print(hangMan1)
        case 2:
            print()
            print(hangMan2)
        case 3:
            print()
            print(hangMan3)
        case 4:
            print()
            print(hangMan4)
        case 5:
            print()
            print(hangMan5)
        case 6:
            print()
            print(hangManFinal)
        default:
            print()
        }
        if randomWord.contains(userInput) {
            print("You made a correct guess!")
        } else {
            print("Incorrect guess, try again")
        }
        print("Incorrect letters guessed: \(lettersGuessed)")
        print("Current progress: \(String(underscoresFromRandomWord))")
    } while repeatCondition
}
