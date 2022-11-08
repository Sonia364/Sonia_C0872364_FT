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
    var count = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.setupEvenLabelTap()
//        self.setupOddLabelTap()
        
        self.randomNumber.isHidden = false
        
        timer =  Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
            
            self.setRandomvalue()
            
            
        }
        
    }
    
    private func setRandomvalue(){
        
        let randomInt = Int.random(in: 1..<100)
        randomNumber.text = "\(randomInt)"
        //RandomNumber.isHidden = false
    }
    
    func isPrime(_ n: Int) -> Bool {
        guard n >= 2     else { return false }
        guard n != 2     else { return true  }
        guard n % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }
    
}


