//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//MARK: Outlets
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var beginGameButton: UIButton!
    @IBOutlet weak var mainGameLabel: UILabel!
    @IBOutlet weak var incorrectLettersLabel: UILabel!
    @IBOutlet weak var incorrectGuessCounter: UILabel!
    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    
 //MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    userInput.delegate = self
  }
    
// MARK: Actions
    
    @IBAction func beginGameButtonPressed(_ sender: UIButton) {
        beginGameButton.isHidden = true
       // beginGameButton.isEnabled = false
        resetGame()
        mainGameLabel.text = String(underscoresFromRandomWord)
        incorrectLettersLabel.text = ("Tap \"Begin Game\" to start")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hangmanBrain(textField.text ?? "0")
        mainGameLabel.text = String(underscoresFromRandomWord)
        userInput.text = ""
        incorrectLettersLabel.text = lettersGuessed.uppercased()
        incorrectGuessCounter.text = String(guessCounter)
         
            if randomWord == (String(underscoresFromRandomWord)) {
                winOrLoseLabel.text = "WINNER!!!"
                beginGameButton.isHidden = false
              //  beginGameButton.isEnabled = true
                beginGameButton.setTitle("Tap here to play again", for: .normal)
                view.backgroundColor = .green
            } else if guessCounter > 5 {
                winOrLoseLabel.text = "You lost..."
                beginGameButton.isHidden = false
             //   beginGameButton.isEnabled = true
                beginGameButton.setTitle("Tap here to play again", for: .normal)
                view.backgroundColor = .red
                mainGameLabel.text = randomWord
            }
        
           switch guessCounter {
            case 0:
                mainImage.image = #imageLiteral(resourceName: "hang1")
            case 1:
                mainImage.image = #imageLiteral(resourceName: "hang2")
            case 2:
                mainImage.image = #imageLiteral(resourceName: "hang3")
            case 3:
                mainImage.image = #imageLiteral(resourceName: "hang4")
            case 4:
                mainImage.image = #imageLiteral(resourceName: "hang5")
            case 5:
                mainImage.image = #imageLiteral(resourceName: "hang6")
            case 6:
                mainImage.image = #imageLiteral(resourceName: "hang7")
            default:
                mainImage.image = #imageLiteral(resourceName: "hang1")
            }
        return userInput.resignFirstResponder()
        
    }
    
}

