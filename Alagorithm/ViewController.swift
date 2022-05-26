//
//  ViewController.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.Al
        
        let invoker = Alagorithm()
//        invoker.numberDetail(30)
//
//        let result = invoker.subNumberSerial(960)
//        for i in result {
//
//            print(i)
//        }
        
        
        let inputArray = ["d 0 2 2 0",
                          "d -2 4 4 0",
                          "e -1 1 1 -1"]
        
        invoker.drawRectangke(inputArray.count, inputArray)
    }
 

}



