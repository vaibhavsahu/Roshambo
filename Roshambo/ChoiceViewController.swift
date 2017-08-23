//
//  ViewController.swift
//  Roshambo
//
//  Created by Vaibhav Sahu on 8/22/17.
//  Copyright © 2017 Vaibhav Sahu. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }
    @IBAction func playRock(_ sender: UIButton) {
        let controller: ResultsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.userChoice = getUserShape(sender)
        
        present(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func playPaper(_ sender: UIButton) {
        self.performSegue(withIdentifier: "scissor", sender: sender)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scissor"{
            let controller = segue.destination as! ResultsViewController
            controller.userChoice = getUserShape(sender as! UIButton)
           //print("scissor")
    }
    }

}

