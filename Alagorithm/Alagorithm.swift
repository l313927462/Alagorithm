//
//  Alagorithm.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/31.
//

import Foundation

extension Alagorithm {
    /**
     【高矮个子排队】现在有一队小朋友，他们高矮不同，我们以正整数数组表示这一队小朋友的身高，如数组{5,3,1,2,3}。 我们现在希望小朋友排队，以“高”“矮”“高”“矮”顺序排列，每一个“高”位置的小朋友要比相邻的位置高或者相等；每一个“矮”位置的小朋友要比相邻的 位置 矮或者相等； 要求小朋友们移动的距离和最小，第一个从“高”位开始排，输出最小移动距离即可。 例如，在示范小队{5,3,1,2,3}中，{5, 1, 3, 2, 3}是排序结果。{5, 2, 3, 1, 3} 虽然也满足“高”“矮”“高”“矮”顺序排列，但小朋友们的移动距离大，所以不是最优结 果。
     移动距离的定义如下所示： 第二位小朋友移到第三位小朋友后面，移动距离为1，若移动到第四位小朋友后面，移动距离为2；
     输入描述：
     
     排序前的小朋友，以英文空格的正整数： 4 3 5 7 8 注：小朋友<100个
     
     输出描述：
     排序后的小朋友，以英文空格分割的正整数： 4
     3 7 5 8
     
     备注：
     4（高）3（矮）7（高）5（矮）8（高）， 输出结果为最小移动距离，只有5和7交换了位置，移动距离都是1。
     示例1：
     输入 4 1 3 5 2
     输出 4 1 5 2 3
     */
    
    func kidQueue(_ count:Int,_ input:[Int]) ->[Int] {
        var result = input
        var distance = 0
        for i in 0..<result.count {
            let j = i + 1
            if j >= result.count {
                break            }
            if i % 2 == 0, result[i] < result[j] {
                let  tmp = result[i]
                result[i] = result[j]
                result[j] = tmp
                distance += j - i
            }
            else if i % 2 == 1, result[i] > result[j] {
                let  tmp = result[i]
                result[i] = result[j]
                result[j] = tmp
                distance += j - i
            }
        }
        print("移动距离 ：\(distance)")
        return result
    }
    /**
     【第k个排列】给定参数n，从1到n会有n个整数：1,2,3,…,n，这n个数字共有 n! 种排列。按大 小顺序升序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下： "123" "132" "213" "231" "312" "321" 给定 n 和 k，返回第 k 个排列。输 入描述
     "123" "132" "213" "231" "312" "321" 给定 n 和 k，返回第 k 个排列。输 入描述
     
     输入两行，第一行为n，第二行为k，给定 n 的范围是 [1,9]，给定 k 的范围是[1,n!]。
     
     输出描述：
     输出排在第k位置的数字。
     示例1：
     输出
     3
     3
     输入213
     */
    
    func queryNum(n n:Int, k k :Int) -> Int {
        var  arr:[Int] =  [1,2,3,4,5,6,7,8,9]
        let tmp  = arr.prefix(n)
        var numberArray =  Array(tmp)
        if n < 1 || n > 9 {
            print("输入n值超出范围")
            return  -1
        }
        var kvalue = 1
        var i = 1
        while i <= n {
            kvalue = kvalue  * i
            i += 1
        }
        
        print("total ==== \(kvalue)")
        
        if k > kvalue {
            print("输入k值超出范围")
            return  -1
        }
        
        
        var total = k
        var unit:Int = kvalue / numberArray.count
        var currentIndex:Int =  k
        
         if currentIndex % unit != 0 ,currentIndex / unit > 0 {
            currentIndex = currentIndex / unit + 1
            
        } else {
            currentIndex = currentIndex / unit
        }

        
        
        var nexIndex = total - (currentIndex - 1) * unit
    
        
        while numberArray.count  != 1 {
            
            print("currindex == \(currentIndex),\(unit),\(nexIndex)")
            print(numberArray[currentIndex - 1])
            numberArray.remove(at: currentIndex - 1 )
            currentIndex = nexIndex
            
            unit = unit / numberArray.count
            if currentIndex % unit != 0 ,currentIndex / unit > 0 {
               currentIndex = currentIndex / unit + 1
               
           } else {
               currentIndex = currentIndex / unit
           }
            
            
            
            nexIndex = nexIndex - (currentIndex - 1) * unit
            
        }
        print(numberArray)
        
       
        
        return 0
    }
    
}
