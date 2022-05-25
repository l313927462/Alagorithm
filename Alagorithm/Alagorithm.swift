//
//  Alagorithm.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/26.
//

import Foundation


class Alagorithm {
    func numberDetail(_ index:Int) ->  String {
        let startTime = CFAbsoluteTimeGetCurrent()
        var des = "1"
        print(des)
        var currentIndex = 0
        while index > currentIndex {
            des = generateNext(des)
            currentIndex += 1
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        print("代码执行时长：%f 毫秒", (endTime - startTime))
        print("des ==== \(des)")
        print("des.length ==== \(des.count)")
        return des
    }

    func generateNext(_ previous:String) -> String {
        var count = 0
        var flag:Character = previous.first!
        var des = ""
        for char in previous {
            
            if char == flag {
                count += 1
            } else {
                des  += String(count) + String(flag)
                flag = char
                count = 1
            }
        }
        des += String(count) + String(flag)
        return des
    }
}


extension Alagorithm {
    /**
     【用连续自然数之和来表达整数】一个整数可以由连续的自然数之和来表示。给定一个整数，计算该整数有几种连续自然数之和的表达式，且打印出每种表达式。 输入描述： 一个目标整数T (1 <=T<= 1000)
     */
    
    public func subNumberSerial(_ number:Int) -> [String] {
        var des = [String]()
        var subCount = 1
        var item = String(number) + " = "
        while(subCount < number/2) {
            
            if subCount % 2 == 0 {
                let remain = number % subCount
                if remain*10 / subCount == 5 {
                    
                    let origin = number / subCount - (subCount/2 - 1)
                    if origin > 0 {
                        
                        
                        for i in 0..<subCount{
                            if i == 0 {
                                item += String(origin + i)
                            }
                            else {
                                item +=  "+" +  String(origin + i)
                            }
                        }
                        des.append(item)
                        item = String(number) + " = "
                        
                    }
                }
            } else  {
                if number % subCount == 0 {

                    
                    let middle = number / subCount
                    let origin  = middle - subCount/2
                    for i in 0..<subCount{
                        if i == 0 {
                            item += String(origin + i)
                        }
                        else {
                            item +=  "+" +  String(origin + i)
                        }
                    }
                    des.append(item)
                    item = String(number) + " = "
                }
            }
            
            subCount += 1
        }
        return des
    }
}
