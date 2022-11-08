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
    
    var userProgress = [[String:String]]()
    
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
        correctIncorrect.isHidden = false
        var result = ""
        let currentNumber = Int(randomNumber.text!)
        if isEven(currentNumber!){
            correctIncorrect.image = UIImage(named: "correct")
            result = "correct"
            
        }else{
            correctIncorrect.image = UIImage(named: "wrong")
            result = "wrong"
            self.showWrongAlert("Odd")
            
        }
        
        let report = ["text": "\(currentNumber!) is Even ", "image": "\(result)"]
        userProgress.append(report)
    }
    
    
    func setupEvenLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.evenLabelTap(_:)))
        self.evenNumber.isUserInteractionEnabled = true
        self.evenNumber.addGestureRecognizer(labelTap)
        
    }
    
    
    
    @IBAction func oddLabelTap(_ sender: UITapGestureRecognizer) {
        correctIncorrect.isHidden = false
        var result = ""
        let currentNumber = Int(randomNumber.text!)
        if isEven(currentNumber!){
            correctIncorrect.image = UIImage(named: "wrong")
            result = "wrong"
            self.showWrongAlert("Even")
        }else{
            correctIncorrect.image = UIImage(named: "correct")
            result = "correct"
        }
        
        let report = ["text": "\(currentNumber!) is Odd ", "image": "\(result)"]
        userProgress.append(report)
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
        let actionOne =  UIAlertAction(title: "Play Again!", style: .default){_ in
            self.correctIncorrect.isHidden = true
            self.timer =  Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
                self.setRandomvalue()
            }
        }
        
        alert.addAction(actionOne)
        
        let actionTwo =  UIAlertAction(title: "Show Progress", style: .default){_ in
            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let ProgressVC = mainSB.instantiateViewController(withIdentifier: "ProgressVCScene") as? ProgressVC
            ProgressVC?.delegate = self
            ProgressVC?.progressData = self.userProgress
            if let ProgressVC = ProgressVC {
                self.navigationController?.pushViewController(ProgressVC, animated: true)
            }
        }
        alert.addAction(actionTwo)
        
        present(alert, animated: true)
    }
    
}


