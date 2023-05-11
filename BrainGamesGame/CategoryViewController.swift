//
//  CategoryViewController.swift
//  BrainGamesGame
//
//  Created by Chandrakant Shingala on 04/01/23.
//

import UIKit

struct Game{
    
    var id: Int
    var name: String
    
}

class CategoryViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var gameCollectionView: UICollectionView!
    // MARK: - Variable
    var arrGames: [Game] = []
    var arrGameImage: [String] = ["Math Dual","math equvation","Find Operator logo","Spelling Occurrence","Remamber Spelling logo","Tap on the Number","Gusee Week Day","Odd man out","Wrong Answer","Find the Card","Choose Right Color","Choose the wrong color","Color Intensity","Choose Random color"]
    var selectedIndex: Int = -1
    var numberOfItemsInRow: Int = 3
    var interItemSapce: CGFloat = 16
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        loadGames()
        configureCategorycollectionView()
    }
    
    private func loadGames(){
        let mathDual: Game = Game(id: 1, name: "MathDual")
        let mathEquation: Game = Game(id: 2, name: "MathEquation")
        let findPoerator: Game = Game(id: 3, name: "FindPoerator")
        let spellingOccurrence: Game = Game(id: 4, name: "SpellingOccurrence")
        let rememberSpelling: Game = Game(id: 5, name: "RememberSpelling")
        let tapOnTheNumber: Game = Game(id: 6, name: "TapOnTheNumber")
        let guessWeekDay: Game = Game(id: 7, name: "GuessWeekDay")
        let oddManOut: Game = Game(id: 8, name: "OddManOut")
        let wrongAnswer: Game = Game(id: 9, name: "WrongAnswer")
        let findTheCard: Game = Game(id: 10, name: "FindTheCard")
        let chooseRightColor: Game = Game(id: 11, name: "ChooseRightColor")
        let chooseWrongColor: Game = Game(id: 12, name: "ChooseWrongColor")
        let colorIntensity: Game = Game(id: 13, name: "ColorIntensity")
        let chooseRandomColor: Game = Game(id: 14, name: "ChooseRandomColor")
        
        arrGames = [mathDual, mathEquation, findPoerator, spellingOccurrence, rememberSpelling, tapOnTheNumber, guessWeekDay, oddManOut, wrongAnswer, findTheCard, chooseRightColor, chooseWrongColor, colorIntensity, chooseRandomColor]
    }
    
    private func configureCategorycollectionView(){
        let nibFile: UINib = UINib(nibName: "GameCollectionViewCell", bundle: nil)
        gameCollectionView.register(nibFile, forCellWithReuseIdentifier: "GameCollectionViewCell")
    }
    
    
    private func displayValidation() {
        let alert: UIAlertController = UIAlertController(title: "Sorry", message: "Game is not Devloped yet", preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Okay", style: .default) { button in
            print("Okay Button tapped") }
        
        let cancelButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    
    func displayGameExplianValidation() {
        let alert: UIAlertController = UIAlertController(title: " Remember Spelling \n", message: "1. There will be one Spelling.\n 2. If spelling comes for thr first time, press 'No'\n3. If spelling occurrence is more than one press 'Yes'", preferredStyle: .alert)
        let playButton: UIAlertAction = UIAlertAction(title: "Play", style: .default) { button in
            print("Play Button tapped") }
        
        alert.addAction(playButton)
        alert.view.tintColor = .blue

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let selectModeViewController: SelectModeViewController = storyBoard.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
            navigationController?.pushViewController(selectModeViewController, animated: true)
        present(alert, animated: true, completion: nil)
    }
}
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        let cell: GameCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
        
        cell.gameImage.image = UIImage(named: arrGameImage[indexPath.row])
        
        let game = arrGames[indexPath.row]
        cell.nameLabel.text = "\(game.name) \n$\(game.id)"
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            let game = arrGames[indexPath.row]
            selectedIndex = indexPath.row
            print(game.name)
            print(game.id)
            collectionView.reloadData()
        }

        let gameid = arrGames[indexPath.row]

        if gameid.id == 5 {
            displayGameExplianValidation()
        } else {
            displayValidation()
        }
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let selectModeViewController: SelectModeViewController = storyBoard.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
//        navigationController?.pushViewController(selectModeViewController, animated: true)
        
    }
    
}

extension CategoryViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
        //        if indexPath.section == 0 {
        //            let spacing = CGFloat(numberOfItemsInRow+1) * interItemSapce
        //            let avilableWidth = collectionView.frame.width - spacing
        //            let cellWidth = avilableWidth / CGFloat(numberOfItemsInRow)
        //            return CGSize(width: cellWidth, height: cellWidth)
        //        } else {
        //            let spacing = CGFloat(numberOfItemsInRow+1) * interItemSapce
        //            let avilabelWidth = collectionView.frame.width - spacing
        //            let cellWidth = avilabelWidth / CGFloat(numberOfItemsInRow)
        //            return CGSize(width: cellWidth, height: 80)
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
