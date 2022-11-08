//
//  ViewController.swift
//  Sonia_C0872364_FT
//
//  Created by MacStudent on 2022-11-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var evenNumber: UILabel!
    @IBOutlet weak var oddNumber: UILabel!
    @IBOutlet weak var correctIncorrect: UIImageView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupEvenLabelTap()
        self.setupOddLabelTap()
        
        self.randomNumber.isHidden = false
        
        timer =  Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
            
            self.setRandomvalue()
            
            
        }
        
    }
    
    
    @IBAction func evenLabelTap(_ sender: UITapGestureRecognizer) {
        let currentNumber = Int(randomNumber.text!)
        if isEven(currentNumber!){
            correctIncorrect.image = UIImage(named: "correct")
        }else{
            correctIncorrect.image = UIImage(named: "wrong")
            self.showWrongAlert("Odd")
        }
    }
    
    
    func setupEvenLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.evenLabelTap(_:)))
        self.evenNumber.isUserInteractionEnabled = true
        self.evenNumber.addGestureRecognizer(labelTap)
        
    }
    
    
    
    @IBAction func oddLabelTap(_ sender: UITapGestureRecognizer) {
        let currentNumber = Int(randomNumber.text!)
        if isEven(currentNumber!){
            correctIncorrect.image = UIImage(named: "wrong")
            self.showWrongAlert("Even")
        }else{
            correctIncorrect.image = UIImage(named: "correct")
        }
        
        
    }
    
    
    func setupOddLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.oddLabelTap(_:)))
        self.oddNumber.isUserInteractionEnabled = true
        self.oddNumber.addGestureRecognizer(labelTap)
        
    }
    
    
    private func setRandomvalue(){
        
        let randomInt = Int.random(in: 1..<100)
        randomNumber.text = "\(randomInt)"
        //RandomNumber.isHidden = false
    }
    
    func isEven(_ n: Int) -> Bool {
        if n%2 == 0 {
            return true
        }else{
            return false
        }
       
    }
    
    func showWrongAlert(_ correctAns: String){
        timer?.invalidate()
        let alert = UIAlertController(title: "Result", message: "Oops..Wrong answer.. \n Correct answer is \(correctAns)", preferredStyle: .alert)
        let actionOne =  UIAlertAction(title: "Play Again!", style: .default)
        
        alert.addAction(actionOne)
        
        let actionTwo =  UIAlertAction(title: "Show Progress", style: .default)
        alert.addAction(actionTwo)
        
        present(alert, animated: true)
    }
    
}


