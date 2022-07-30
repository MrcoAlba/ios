//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivDice1: UIImageView!
    @IBOutlet weak var ivDice2: UIImageView!
    
    let imagesArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    /* The app does not need to load anything before it executes, so next function will be commented */
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //"#imageLiteral(" to make the frame appear and then you choose the correct image you want
//        ivDice1.image = #imageLiteral(resourceName: "DiceSix")
//        ivDice1.alpha = 0.5
//        ivDice2.image = #imageLiteral(resourceName: "DiceTwo")
//    }
    
    @IBAction func btnRollPressed(_ sender: UIButton) {
        //randomElement gives u a random element from the array
        ivDice1.image = imagesArray.randomElement()
        //Int.random(in: x...y) gives u a random number from x to y 
        ivDice2.image = imagesArray[Int.random(in: 0...5)]
    }
    

}

