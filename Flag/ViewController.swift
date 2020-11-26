//
//  ViewController.swift
//  Flag
//
//  Created by Hovo on 9/17/20.
//  Copyright © 2020 Hovo. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonImage2: UIButton!
    @IBOutlet weak var buttonImage1: UIButton!
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var scoreTitle: UILabel!
    var score = 0
    var askedQuestions = 0
    var correctAnswer = 0
    var flagArray = ["ԱՄՆ", "Բրազիլիա", "Արգենտինա", "Հայաստան", "Ֆրանսիա", "Հոլանդիա", "Ռումինիա", "ՌԴ", "Իսպանիա"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        flagArray.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        buttonImage.setImage(UIImage(named: flagArray[0]), for: .normal)
        buttonImage1.setImage(UIImage(named: flagArray[1]), for: .normal)
        buttonImage2.setImage(UIImage(named: flagArray[2]), for: .normal)
        
        let uppercasedCountry = flagArray[correctAnswer]
        countryLabel.text = "Ընտրեք \(uppercasedCountry) -ի դրոշը"
        askedQuestions += 1
    }
    
    func startNewGame(action: UIAlertAction) {
        score = 0
        askedQuestions = 0
        scoreTitle.text! = String(score)
        askQuestion()
    }
    
    
    @IBAction func answerBtn(_ sender: UIButton) {
        let menuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MenuController") as? MenuController
        if sender.tag == correctAnswer {
            title = "Ճիշտ է"
            score += 1
            scoreTitle.text! = String(score)
        } else {
            title = "Սխալ է դա \(flagArray[sender.tag]) -ի դրոշն է"
            score = 0
            scoreTitle.text! = String(score)
            askQuestion()
        }
        
        if askedQuestions < 10 {
            let alertController = UIAlertController(title: title, message: "Հաշիվ՝ \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Շարունակել", style: .default, handler: askQuestion))
            if sender.tag != correctAnswer {
                alertController.addAction(UIAlertAction(title: "Գլխավոր", style: .default, handler: { (alert) in
                    UIApplication.shared.windows.first?.rootViewController = menuVC
                }))
            }
            present(alertController, animated: true)
        } else {
            let finalAlertController = UIAlertController(title: "Խաղն ավարտված է", message: "Հաշիվ՝ \(score)", preferredStyle: .alert)
            finalAlertController.addAction(UIAlertAction(title: "Սկսել նոր խաղ", style: .default, handler: startNewGame))
            finalAlertController.addAction(UIAlertAction(title: "Գլխավոր", style: .default, handler: { (alert) in
                UIApplication.shared.windows.first?.rootViewController = menuVC
            }))
            present(finalAlertController, animated: true)
            
        }
    }
}
