//
//  MainGameViewController.swift
//  BrainGamesGame
//
//  Created by Chandrakant Shingala on 07/01/23.
//

import UIKit

struct QuestionAndAnswer{
    var question: String
    var answers: [String]
    var answer: Int
}

class MainGameViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButton: [UIButton]!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: - Variable
    
    var question = [QuestionAndAnswer]()
    var questionNumber: Int = 0
    var answerNumber = Int()
    var timerCount: Double = 10
    var timer: Timer!
    var counter: Int = 0
    
    // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        question = [QuestionAndAnswer(question: "Boat", answers: ["Yes","No"], answer: 1),
                    QuestionAndAnswer(question: "Bird", answers: ["Yes","No"], answer: 2),
                    QuestionAndAnswer(question: "Dog", answers: ["Yes","No"], answer: 2),
                    QuestionAndAnswer(question: "Boat", answers: ["Yes","No"], answer: 1),
                    QuestionAndAnswer(question: "Girl", answers: ["Yes","No"], answer: 2),
                    QuestionAndAnswer(question: "Dog", answers: ["Yes","No"], answer: 1),
                    QuestionAndAnswer(question: "Watch", answers: ["Yes","No"], answer: 2),
                    QuestionAndAnswer(question: "Watch", answers: ["Yes","No"], answer: 1),
                    QuestionAndAnswer(question: "Bird", answers: ["Yes","No"], answer: 1),]
        pickQuestion()
        configureProgressView()
    }
    
    //    For Progress Bar
    
    private func configureProgressView(){
        timer = Timer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        progressBar.setProgress(1, animated: true)
    }
    
    @objc
    func updateTime(){
        if timerCount > 0{
            timerCount = timerCount - 1
            progressBar.setProgress(Float(timerCount/1), animated: true)
        } else {
            timer.invalidate()
        }
        
        if timerCount == 1{
            let alert: UIAlertController = UIAlertController(title: "Game Over", message: "Score : \(counter)\n Highest Score : \(counter)", preferredStyle: .alert)
            let playAgainButton: UIAlertAction = UIAlertAction(title: "Play Again", style: .default)
            let homeButton: UIAlertAction = UIAlertAction(title: "Home", style: .default)
            
            alert.addAction(playAgainButton)
            alert.addAction(homeButton)
            present(alert, animated: true, completion: nil)
        }
       
    }
    

    
    func pickQuestion(){
        if question.count > 0{
//            questionNumber = 0
            questionLabel.text = question[questionNumber].question
            
            answerNumber = question[questionNumber].answer
            
            for index in 0..<answerButton.count{
                answerButton[index].setTitle(question[questionNumber].answers[index], for: UIControl.State.normal)
            }
            question.remove(at: questionNumber)
        } else {
            NSLog("Done!")
        }
    }
    
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        
        if answerNumber != 0{
            pickQuestion()
        } else {
            displayAlert()
        }
        counter = counter + 1
        counterLabel.text = "\(counter)"
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        
        if answerNumber <= 0{
            pickQuestion()
        } else {
            displayAlert()
        }
        counter = counter + 0
        counterLabel.text = "\(counter)"
    }
    
    
    private func displayAlert(){
        let alert: UIAlertController = UIAlertController(title: "Game Over", message: "Score : \(counter)\n Highest Score : \(counter)", preferredStyle: .alert)
        let playAgainButton: UIAlertAction = UIAlertAction(title: "Play Again", style: .default)
        let homeButton: UIAlertAction = UIAlertAction(title: "Home", style: .default)
        
        alert.addAction(playAgainButton)
        alert.addAction(homeButton)
        present(alert, animated: true, completion: nil)

    }
}

