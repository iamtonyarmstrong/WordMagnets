//
//  ViewController.swift
//  WordMagnets
//
//  Created by Anthony Armstrong on 4/12/15.
//  Copyright (c) 2015 openinformant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let wordList = ["Out","of","the","night","that","covers","me","Black","as","the","pit","from","pole","to","pole","I","thank","whatever","gods","may","be","For","my","unconquerable","soul","In","the","fell","clutch","of","circumstance","I","have","not","winced","nor","cried","aloud","Under","the","bludgeonings","of","chance","My","head","is","bloody","but","unbowed"]

    let secondWordList = ["Beyond","this","place","of","wrath","and","tears","Looms","but","the","Horror","of","the","shade","And","yet","the","menace","of","the","years","finds","and","shall","find","me","unafraid","It","matters","not","how","strait","the","gate","How","charged","with","punishments","the","scroll","I","am","the","master","of","my","fate","I","am","the","captain","of","my","soul"]

    // Get screen size for the individual device
    let screenSize:CGRect = UIScreen.mainScreen().bounds


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let backgroundColorGreen = UIColor.greenColor()
        self.view.backgroundColor = backgroundColorGreen

        // Get width and height
        let screenHeight:CGFloat = self.screenSize.height
        let screenWidth:CGFloat = self.screenSize.width

        println("device size: \(screenHeight) x \(screenWidth)")
        let capitalizedStrings:[String] = drawWordLabelsFromArrayOfWords(self.wordList)

        for word in capitalizedStrings {
            let x = CGFloat(arc4random_uniform(UInt32(screenWidth)))
            let y = CGFloat(arc4random_uniform(UInt32(screenHeight)))

            let wordLabel = UILabel()
            wordLabel.backgroundColor = UIColor.whiteColor()
            wordLabel.textColor = UIColor.blackColor()
            wordLabel.font = UIFont.boldSystemFontOfSize(20.0)
            wordLabel.text = word
            wordLabel.sizeToFit()
            wordLabel.center = CGPoint(x:x, y:y)
            self.view.addSubview(wordLabel)

            var panGesture:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
            wordLabel.userInteractionEnabled = true
            wordLabel.addGestureRecognizer(panGesture)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Change Capitalization
    func drawWordLabelsFromArrayOfWords(array:[String]) -> [String] {
        var capitalizedArray = [String]()

        for word in array {
            capitalizedArray.append(word.capitalizedString)
        }

        return capitalizedArray
    }


    // MARK: - Pan Gesture Handler
    func handlePanGesture(panGesture:UIPanGestureRecognizer) -> () {
        //println("pan")

        // Get Translation
        var translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view) // Set the point to zero after each move so that each move results in new point being set as starting point


        // What is the dx and dy as a result of the drag
        var touchedLabel = panGesture.view as! UILabel
        // println(touchedLabel.text!)

        // Set a new center for the label
        touchedLabel.center = CGPoint(x: touchedLabel.center.x + translation.x, y: touchedLabel.center.y + translation.y)

        //println(translation)


    }

}

