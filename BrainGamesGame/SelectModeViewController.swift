//
//  SelectModeViewController.swift
//  BrainGamesGame
//
//  Created by Chandrakant Shingala on 07/01/23.
//

import UIKit

class SelectModeViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var selectModeLabel: UILabel!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    // MARK: - Variable
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func easyButtonTapped(_ sender: UIButton){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameViewController: MainGameViewController = storyBoard.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        navigationController?.pushViewController(mainGameViewController, animated: true)
    }
    
    @IBAction func mediumButtonTapped(_ sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameViewController: MainGameViewController = storyBoard.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        navigationController?.pushViewController(mainGameViewController, animated: true)
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameViewController: MainGameViewController = storyBoard.instantiateViewController(withIdentifier: "MainGameViewController") as! MainGameViewController
        navigationController?.pushViewController(mainGameViewController, animated: true)
    }

}
