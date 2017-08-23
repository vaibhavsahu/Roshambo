//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Vaibhav Sahu on 8/23/17.
//  Copyright © 2017 Vaibhav Sahu. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
    let shapes = ["Rock", "Paper", "Scissors"]
    let randomChoice = Int(arc4random_uniform(3))
    return Shape(rawValue: shapes[randomChoice])!
    }
    }



class ResultsViewController: UIViewController {

    var userChoice: Shape!
    let opponentChoice:Shape = Shape.randomShape()
    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func displayResult(){
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultView.image = UIImage(named: imageName)
        resultLabel.text = text
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
        
    }
}
