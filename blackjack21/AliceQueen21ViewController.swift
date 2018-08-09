//
//  AliceQueen21ViewController.swift
//  blackjack21_01
//
//  Created by Chang Sophia on 2018/7/17.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import GameKit

class AliceQueen21ViewController: UIViewController {
    //aliceCard
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    //queenCard
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var card7: UIImageView!
    @IBOutlet weak var card8: UIImageView!
    @IBOutlet weak var card9: UIImageView!
    @IBOutlet weak var card10: UIImageView!
    //alice&queenCover
    @IBOutlet weak var aliceCover: UIImageView!
    @IBOutlet weak var queenCover: UIImageView!
    //alice&queenChip
    @IBOutlet weak var queenChipLabel: UILabel!
    @IBOutlet weak var aliceChipLabel: UILabel!
    //function BTN
    @IBOutlet weak var dealBTN: UIButton!
    @IBOutlet weak var hitBTN: UIButton!
    @IBOutlet weak var openBTN: UIButton!
    //alice&queenScore
    @IBOutlet weak var queenScoreLabel: UILabel!
    @IBOutlet weak var aliceScoreLabel: UILabel!
    //playagain
    @IBOutlet weak var playagain: UIButton!
    
    
    
    //var
    var aliceScore = 0
    var queenScore = 0
    var aliceChip = 500
    var queenChip = 500
    var number = 0
    var score = 0
    var count = 0
    var alert = 0
    var numberRandom = GKShuffledDistribution(lowestValue: 1, highestValue:array.count-1 )
 
    
   
//deal
    @IBAction func dealAction(_ sender: UIButton) {
        dealAction()
        dealBTN.isEnabled = false
        hitBTN.isEnabled = true
        openBTN.isEnabled = true
        }
        
    func dealAction(){
        count = count + 1
        queenCover.isHidden = false
        aliceCover.isHidden = false
        number = numberRandom.nextInt()
        card6.image = UIImage(named: array[number].name)
        queenScore += array[number].score
        card6.isHidden = true
        number = numberRandom.nextInt()
        card1.image = UIImage(named: array[number].name)
        aliceScore += array[number].score
        card1.isHidden = true
        print("alice's score\(aliceScore)")
        print("queen's score\(queenScore)" )
    }

    
//hit
    @IBAction func hitAction(_ sender: UIButton) {
        hitAction()
    }
    func hitAction(){
    count = count + 1
    if count == 1 && aliceScore <= 21{
    number = numberRandom.nextInt()
    card1.image = UIImage(named: array[number].name)
    aliceScore += array[number].score
    aliceScoreLabel.text = "\(aliceScore)"
    card1.isHidden = false
    }
    if count == 2 && aliceScore <= 21{
    number = numberRandom.nextInt()
    card2.image = UIImage(named: array[number].name)
    aliceScore += array[number].score
    aliceScoreLabel.text = "\(aliceScore)"
    card2.isHidden = false
    }
    if count == 3 && aliceScore <= 21{
    number = numberRandom.nextInt()
    card3.image = UIImage(named: array[number].name)
    aliceScore += array[number].score
    aliceScoreLabel.text = "\(aliceScore)"
    card3.isHidden = false
    }
    if count == 4 && aliceScore <= 21{
    number = numberRandom.nextInt()
    card4.image = UIImage(named: array[number].name)
    aliceScore += array[number].score
    aliceScoreLabel.text = "\(aliceScore)"
    card4.isHidden = false
        }
    if count == 5 && aliceScore <= 21{
    number = numberRandom.nextInt()
    card5.image = UIImage(named: array[number].name)
    aliceScore += array[number].score
    aliceScoreLabel.text = "\(aliceScore)"
    card5.isHidden = false
    dealBTN.isEnabled = false
    hitBTN.isEnabled = false
        }
    if count > 5 {
            count = 0
        }
        if aliceScore > 21 {
        bust()
        }
        if aliceScore == 21 {
        win()
        }
    }
//next
    func next(){
        
        dealBTN.isEnabled = true
        openBTN.isEnabled = false
        hitBTN.isEnabled = false
        card1.image = aliceCover.image
        card2.image = aliceCover.image
        card3.image = aliceCover.image
        card4.image = aliceCover.image
        card5.image = aliceCover.image
        card6.image = queenCover.image
        card7.image = queenCover.image
        card8.image = queenCover.image
        card9.image = queenCover.image
        card10.image = queenCover.image
        queenScore = 0
        aliceScore = 0
        count = 0
        queenChipLabel.text = "$\(queenChip)"
        aliceChipLabel.text = "$\(aliceChip)"
        queenScoreLabel.text = ""
        aliceScoreLabel.text = ""
        
    }
    func Okhandler(action: UIAlertAction){
        next()
        if aliceChip == 0 || queenChip == 0 {
            dealBTN.isEnabled = false
            hitBTN.isEnabled = false
            openBTN.isEnabled = false
        }
    }
    
    
    @IBAction func playagainAction(_ sender: UIButton) {
        queenChipLabel.text = ""
        aliceChipLabel.text = ""
        queenScoreLabel.text = ""
        aliceScoreLabel.text = ""
        queenChipLabel.text = "500"
        aliceChipLabel.text = "500"
        aliceChip = 500
        queenChip = 500
        dealBTN.isEnabled = true
        openBTN.isEnabled = false
        hitBTN.isEnabled = false
        card1.image = aliceCover.image
        card2.image = aliceCover.image
        card3.image = aliceCover.image
        card4.image = aliceCover.image
        card5.image = aliceCover.image
        card6.image = queenCover.image
        card7.image = queenCover.image
        card8.image = queenCover.image
        card9.image = queenCover.image
        card10.image = queenCover.image
        queenScore = 0
        aliceScore = 0
        count = 0
    }
    
// lose
        func lose(){
            let controller = UIAlertController(
                title: "You Lose!",
                message:"Scores：\(aliceScore)" ,
                preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Professor Micky took your money!", style: UIAlertActionStyle.default, handler: Okhandler)
            controller.addAction(action)
            show(controller, sender: nil)
            aliceChip = aliceChip - 100
            queenChip = queenChip + 100
            aliceCover.isHidden = true
            queenCover.isHidden = true
            card1.isHidden = false
            card6.isHidden = false
           
        }
        
// win
        func win(){
            let controller = UIAlertController(
                title: "You Win！",
                message:"Scores：\(aliceScore)" ,
                preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Welcome to Harvard!", style: UIAlertActionStyle.default, handler: Okhandler)
            controller.addAction(action)
            show(controller, sender: nil)
            aliceChip = aliceChip + 100
            queenChip = queenChip - 100
            aliceCover.isHidden = true
            queenCover.isHidden = true
            card1.isHidden = false
            card6.isHidden = false
        }
// bust
        func bust(){
            let controller = UIAlertController(
                title: "Bust！",
                message: "Scores：\(aliceScore)",
                preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Always account for variable change!", style: UIAlertActionStyle.default, handler: Okhandler)
            controller.addAction(action)
            show(controller, sender: nil)
            aliceChip = aliceChip - 100
            queenChip = queenChip + 100
            aliceCover.isHidden = true
            queenCover.isHidden = true
            card1.isHidden = false
            card6.isHidden = false
        }
    // tie
        func tie(){
            let controller = UIAlertController(
                title: "Tie！",
                message: "Score：\(aliceScore)",
                preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Winner, winner, chicken closer!", style: UIAlertActionStyle.default, handler: Okhandler)
            controller.addAction(action)
            show(controller, sender: nil)
            aliceCover.isHidden = true
            queenCover.isHidden = true
            card1.isHidden = false
            card6.isHidden = false
           
        }
    
//open
      @IBAction func openBTNPress(_ sender: UIButton) {
            card1.isHidden = false
            card6.isHidden = false
            queenCover.isHidden = true
            aliceCover.isHidden = true
            
            while queenScore < 14 {
                number = numberRandom.nextInt()
                card7.image = UIImage(named: array[number].name)
                queenScore += array[number].score
                card7.isHidden = false
                number = numberRandom.nextInt()
                card8.image = UIImage(named: array[number].name)
                queenScore += array[number].score
                card8.isHidden = false
            }
            queenScoreLabel.text = "\(queenScore)"
            
            if aliceScore > queenScore || queenScore > 21 || count >= 4 && aliceScore <= 21{
                win()
            }else if queenScore > aliceScore {
                lose()
            }else if aliceScore == queenScore {
                tie()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queenScoreLabel.text = ""
        aliceScoreLabel.text = ""
        queenCover.isHidden = true
        aliceCover.isHidden = true
   
        
        }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}

