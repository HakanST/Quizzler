//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var questionNumber = 0
    var score = 0
    var progress = 0
    
    let qBank = QuestionBank()
    var pickedAnswer: Bool = false
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        updateUI()
        
        if questionNumber == 13{
            let alert = UIAlertController(title: "Finished", message: "Please select the following" , preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver()})
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
        }
            
        else {
            nextQuestion()
        }
  
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score*10)"
        progressLabel.text = "\(score)/ \(questionNumber)"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber+1)
        
    }
    
    func nextQuestion() {
        
        questionNumber = questionNumber + 1
        questionLabel.text = qBank.list[questionNumber-1].question
        
    }
    
    func checkAnswer() {
        
        if pickedAnswer == qBank.list[questionNumber-1].answer{
            ProgressHUD.showSuccess("Correct!")
            score+=1
        }
        
        else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        progress = 0
        
        updateUI()
        nextQuestion()
        
    }
}
