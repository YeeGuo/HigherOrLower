//
//  ViewController.swift
//  HigherOrLower
//
//  Created by 張凱棋 on 2023/3/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentDice1: UIImageView!
    
    @IBOutlet weak var opponentDice2: UIImageView!
    
    @IBOutlet weak var playerDice1: UIImageView!
    
    @IBOutlet weak var playerDice2: UIImageView!
    
    @IBOutlet weak var bigBtn: UIButton!
    
    @IBOutlet weak var smallBtn: UIButton!
    
    @IBOutlet weak var goBtn: UIButton!
    
    @IBOutlet weak var resultText: UILabel!
    
    let diceNums : [Int] = [1,2,3,4,5,6]
    var bigBtnFlag : Bool = false
    var smallBtnFlag : Bool = false
    var opponentNum1 = 0
    var opponentNum2 = 0
    var playerNum1 = 0
    var playerNum2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        opponentDice1.image = UIImage(systemName: "die.face.1.fill")
        opponentDice2.image = UIImage(systemName: "die.face.1.fill")
        playerDice1.image = UIImage(systemName: "die.face.1.fill")
        playerDice2.image = UIImage(systemName: "die.face.1.fill")
    }
    
    @IBAction func chooseHigher(_ sender: Any) {
        updateUI()
        bigBtnFlag = true
    }
    
    @IBAction func chooseLower(_ sender: Any) {
        updateUI()
        smallBtnFlag = true
    }
    
    @IBAction func go(_ sender: Any) {
        randomDice()
        result()
        restartBtn()
    }
    
    func updateUI(){
        bigBtn.isEnabled = false
        smallBtn.isEnabled = false
        goBtn.isEnabled = true
    }
    func randomDice(){
        for i in 1...4{
            let randomNum = diceNums.randomElement()
            switch i {
            case 1:
                opponentNum1 = randomNum!
                opponentDice1.image = UIImage(systemName: "die.face.\(randomNum!).fill")
            case 2:
                opponentNum2 = randomNum!
                opponentDice2.image = UIImage(systemName: "die.face.\(randomNum!).fill")
            case 3:
                playerNum1 = randomNum!
                playerDice1.image = UIImage(systemName: "die.face.\(randomNum!).fill")
            case 4:
                playerNum2 = randomNum!
                playerDice2.image = UIImage(systemName: "die.face.\(randomNum!).fill")
            default:
                print("error")
            }
        }
    }
    func result(){
        let opponentPoints = opponentNum1 + opponentNum2
        let playerPoints = playerNum1 + playerNum2
        if bigBtnFlag == true && playerPoints > opponentPoints{
            resultText.text = "Winner！"
        }
        else if smallBtnFlag == true && playerPoints < opponentPoints{
            resultText.text = "Winner！"
        }
        else if bigBtnFlag == true && playerPoints < opponentPoints{
            resultText.text = "Loser！"
        }
        else if smallBtnFlag == true && playerPoints > opponentPoints{
            resultText.text = "Loser！"
        }
        else{
            resultText.text = "Draw"
        }
    }
    func restartBtn(){
        bigBtnFlag = false
        smallBtnFlag = false
        opponentNum1 = 0
        opponentNum2 = 0
        playerNum1 = 0
        playerNum2 = 0
        bigBtn.isEnabled = true
        smallBtn.isEnabled = true
        goBtn.isEnabled = false
    }
}

