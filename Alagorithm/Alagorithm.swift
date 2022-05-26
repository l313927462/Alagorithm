//
//  Alagorithm.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/26.
//

import Foundation


class Alagorithm {
    /**
     【矩形绘制】实现一个简单的绘图模块，绘图模块仅支持矩形的绘制和擦除，当新绘制的矩形与之前的图形重叠时，对图形取并集；当新擦除的矩形与之前的图形重叠时， 对图形 取差集。给定一系列矩形的绘制和擦除操作，计算最终图形的面积。 下面给出示例1和示例2的图示
     
     示例1 两步绘制的矩形如左侧所示，取并集后得到的图形如右侧所示
     
     示例2 第一步绘制的矩形在左侧用实线表示，第二步擦除的矩形在左侧用虚线表示，取差集后得到的图形如右侧所示
     
     输入描述： 绘图模块采用二维坐标系，输入第一行为操作的数量N，接下来的N行格式为： d x1 y1 x2 y2，d表示进行绘制操作，(x1, y1)为矩形左上角坐标，(x2, y2)为矩形右下角坐标，或者e x1 y1 x2 y2，e表示进行擦除操作，(x1, y1)为矩形左上角坐标，(x2, y2)为矩形右下角坐标 坐标为整数，且数据范围为[-100, 100]，用例保证坐标有效
     输出描述： 输出最终图形的面积
     示例1：
     输入2d 0 2 2 0 d -1 1 1 -1
     输出7
     */
    func drawRectangke(_ count: Int, _ des: [String]) {
        var set:Set<String> = []
        for item in des {
            let ar = item.split(separator: " ")

            let left = Int(ar[1])!
            let up = Int(ar[2])!
            let right = Int(ar[3])!
            let dowm = Int(ar[4])!
            
            if abs(left) > 100 ||  abs(up) > 100 ||  abs(right) > 100 ||  abs(dowm) > 100 {
                print(" \(item) more than 100 ")
                continue
            }
            
            if right - left == 0 || up - dowm == 0  {
                print(" \(item) Input is not a correct rectangle ")
                continue
            }
                
            
            if ar.first == "d" {
                for h in (left + 1)...right {
                    for v in (dowm + 1)...up {
                        let content = String(h-1) + String(v) + String(h) + String(v-1)
                        set.insert(content)
                    }
                }
                
            } else  if ar.first == "e" {
                for h in (left + 1)...right {
                    for v in (dowm + 1)...up {
                        let content = String(h-1) + String(v) + String(h) + String(v-1)
                        if set.contains(content) {
                            set.remove(content)
                        }
                    }
                }
                
            } else {
                print("Input error！Do not have a correct iniial character")
                continue
            }
            
            
        }
        print("面积 == \(set.count)")
    }
    
    
    
    
    
    /**
     *  https://www.cnblogs.com/Jukim/p/16061865.html
     *   有一个数列A[n]，从A[0]开始每一项都是一个数字，数列中A[n+1]都是A[n]的描述，其中A[0]=1
     规则如下
     A[0]:1
     A[1]:11 含义其中A[0]=1是1个1 即11，  表示A[0]从左到右连续出现了1次1
     A[2]:21 含义其中A[1]=11是2个1 即21，  表示A[1]从左到右连续出现了2次1
     A[3]:1211 含义其中A[2]从左到右是由一个2和一个1组成 即1211，  表示A[2]从左到右连续出现了一次2又连续出现了一次1
     A[4]:111221  含义A[3]=1211 从左到右是由一个1和一个2两个1 即111221，  表示A[3]从左到右连续出现了一次1又连续出现了一次2又连续出现了2次1

     输出第n项的结果
     0<= n <=59
     输入描述：
     数列第n项   0<= n <=59
     4
     输出描述
     数列内容
     111221
     */
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
