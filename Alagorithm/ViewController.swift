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
        
        
//        let inputArray = ["d 0 2 2 0",
//                          "d -2 4 4 0",
//                          "e -1 1 1 -1"]
//
//        invoker.drawRectangke(inputArray.count, inputArray)
        
//        invoker.inequationArray("2.3,3,5.6,7,6;11,3,8.6,25,1;0.3,9,5.3,66,7.8;1,3,2,7,5;340,670,80.6;<=,<=,<=")
        
//        invoker.findFriend([1,23,8,7,45,1,98])
    
//        print(invoker.check(6))
//        print(invoker.check(17))
//        print(invoker.check(100))
//        print(invoker.check(500))
//        print(invoker.check(5368))
        
      
//        print(invoker.treePath([0,3,5,7,-1,-1,2,4]))
        
//        invoker.minAbs([-3 ,-1 ,5, 7 ,11 ,15])
//         print(invoker.maxMoney([27,26,36,23], 78))
//        print(invoker.virtul([1,0,1,0,0,0,1,0,1]))
        
//        let  res = invoker.event(m: 4, n: 5, r: 5, a: [1, 5, 5, 10], b: [1 ,3, 8, 8, 20])

        
//        let res = invoker.userConsume(count: 3, a: [15 ,8, 17], b: [12 ,20 ,9], c: [11 ,7, 5])
        
        
        
//        let res = invoker.kidQueue(5,[4,1,3,5,2])
//        let res =  invoker.queryNum(n: 5, k: 1)
        
  
        let res = invoker.allCombain(count: 3, data: ["a","b","c"])
       
        print(res)
        
        
    }
 

}



