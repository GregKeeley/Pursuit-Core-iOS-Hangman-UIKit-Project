//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var mainImage: UIImageView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    userInput.delegate = self
  }

    @IBAction func inputBegin(_ sender: UITextField) {
        hangmanBrain()
    }
    
    
}

