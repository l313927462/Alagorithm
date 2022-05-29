//
//  Alagorithm.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/26.
//

import Foundation


class Alagorithm {
    
    
    /**
     【靠谱的车】 程序员小明打了一辆出租车去上班。出于职业敏感，他注意到这辆出租车的计费表有点问题，总是偏大。 出租车司机解释说他不喜欢数字4，所以改装了计费表，任何数字位置遇到数字4就直接跳过，其余功能都正常。
     比如：
     1. 23再多一块钱就变为25；
     2. 39再多一块钱变为50；
     3. 399再多一块钱变为500；
     小明识破了司机的伎俩，准备利用自己的学识打败司机的阴谋。 给 出计费表的表面读数，返回实际产生的费用。 输入描述： 只有一行，数字N，表示里程表的读数。 (1<=N<=888888888)。 输出描述：
     示例1：
     输入：5
     输出：4
     
     */
    
    func check(_ num:Int64) -> Int64 {
        var  result: Int64 = num
        
        let inputStr = String(num)
        let strArray = Array(inputStr)
        var count = strArray.count
        var unit:Int64 = 0
        for i in 0..<strArray.count {
            let char =  strArray[count - i - 1]
            let currentNum = Int64(String(char))!
            if currentNum % 10 > 4 {
                result = result - (currentNum - 1) * unit  - Nfang_10(10, i)
            } else  {
                result = result - currentNum  * unit
            }
            unit = (10 - 1) * unit + Nfang_10(10, i)
        }
        return result
        
    }
    
        
        
    
    
    
    
    func Nfang_10(_ base: Int64,_ time:Int) -> Int64 {
        
       
        
        if time <= 0 {
            return 1
        }
        
        var s = time
        var res = Int64(1)
        while s >= 1 {
            
            res = res * base
            s -= 1
        }
        return res
    }
    
    
    /**
     【找朋友】 在学校中，N个小朋友站成一队， 第i个小朋友的身高为height[i]， 第i个小朋友可以看到的第一个比自己身高更高的小朋友j，那么j是i的好朋友(要求j > i)。 请重新生成一个列表，对应位置的输出是每个小朋友的好朋友位置，如果没有看到好朋友，请在该位置用0代替。 小 朋友人数范围是 [0, 40000]。
     输入描述：
     输出描述： 输出N个小朋友的好朋友的位置
     示例1：
     输入： 2
     100 95
     输出： 0 0
     **/
    
    
    func findFriend(_ heightArray: [Int]) -> [Int] {
        let totalCount = heightArray.count
        var  res = [Int]()
        for i in 1...totalCount {
            var j = totalCount - i - 1
            while j >= 0 {
                if heightArray[j] > heightArray[totalCount - i] {
                    res.insert(j, at: 0)
                    break
                }
                
                j -= 1
            }
            if  j < 0 {
                res.insert(0, at: 0)
            }
        }
        print(res)
        return res
    }
    
    /*
     【判断一组不等式是否满足约束并输出最大差】给定一组不等式，判断是否成立并输出不等式的最大差(输出浮点数的整数部分)，
     要求：1）不等式系数为double类 型， 是一个二维数组；
     2）不等式的变量为int类型，是一维数组；
     3）不等式的目标值为double类型，是一维数组；
     4）不等式约束为字符串数组，只能 是：">",">=","<","<=","="，例如,不等式组：
     a11*x1+a12*x2+a13*x3+a14*x4+a15*x5<=b1;
     a21*x1+a22*x2+a23*x3+a24*x4+a25*x5<=b2;
     a31*x1+a32*x2+a33*x3+a34*x4+a35*x5<=b3;
     最大差=max{ (a11*x1+a12*x2+a13*x3+a14*x4+a15*x5-b1), (a21*x1+a22*x2+a23*x3+a24*x4+a25*x5-b2), (a31*x1+a32*x2+a33*x3+a34*x4+a35*x5-b3) }，类型为整数(输出浮点数的整数部分)
     输入描述：
     1） 不等式组系数(double类型)： a11,a12,a13,a14,a15 a21,a22,a23,a24,a25 a31,a32,a33,a34,a35
     2） 不等式变量(int类型)： x1,x2,x3,x4,x5
     3） 不等式目标值(double类型)：b1,b2,b3 4） 不等式约束(字符串类型):<=,<=,<=
     输入：a11,a12,a13,a14,a15;a21,a22,a23,a24,a25;a31,a32,a33,a34,a35;x1,x2,x3,x4,x5;b1,b2,b3;<=,<=,<=
     输出描述： true 或者 false, 最大差
     示例1：
     输入:2.3,3,5.6,7,6;11,3,8.6,25,1;0.3,9,5.3,66,7.8;1,3,2,7,5;340,670,80.6;<=,<=,<=
     输出:false 458
     **/
    func inequationArray(_ input: String) {
        var array = input.split(separator: ";")
        var operators = array.last?.split(separator: ",")
        array.removeLast()
        var rightValus = array.last?.split(separator: ",")
        array.removeLast()
        var vars = array.last?.split(separator: ",")
        array.removeLast()
        
        
        var isOK = true
        var maxValue:Double = 0.0
        for i in 0..<array.count {
            let ar = array[i].split(separator: ",")
            var letftotal:Double = 0.0
            for j in 0..<ar.count {
                letftotal = letftotal + Double(ar[j])! * Double(vars![j])!
            }
            
            if isOK{
                isOK = inequationIsRight(letftotal, Double(rightValus![i])!, String(operators![i]))
            }
            
            let newValue = abs(letftotal - Double(rightValus![i])!)
            if  maxValue < newValue {
                maxValue = newValue
            }
        }
        print("\(isOK),\(Int(maxValue))")
        
    }
    
    
    func inequationIsRight(_ left: Double,_ right: Double,_ operatorSymbol: String) -> Bool {
        var isRight = false
        switch operatorSymbol {
        case "=": isRight = left == right
        case ">=": isRight = left >= right
        case "<=": isRight = left <= right
        case ">": isRight = left > right
        case "<": isRight = left < right
        default:
            break
        }
        return isRight
    }
    
    
    
    
    /**
     【矩形绘制】实现一个简单的绘图模块，绘图模块仅支持矩形的绘制和擦除，当新绘制的矩形与之前的图形重叠时，对图形取并集；当新擦除的矩形与之前的图形重叠时， 对图形 取差集。给定一系列矩形的绘制和擦除操作，计算最终图形的面积。 下面给出示例1和示例2的图示
     
     示例1: 两步绘制的矩形如左侧所示，取并集后得到的图形如右侧所示
     
     示例2:第一步绘制的矩形在左侧用实线表示，第二步擦除的矩形在左侧用虚线表示，取差集后得到的图形如右侧所示
     
     输入描述： 绘图模块采用二维坐标系，输入第一行为操作的数量N，接下来的N行格式为： d x1 y1 x2 y2，d表示进行绘制操作，(x1, y1)为矩形左上角坐标，(x2, y2)为矩形右下角坐标，或者e x1 y1 x2 y2，e表示进行擦除操作，(x1, y1)为矩形左上角坐标，(x2, y2)为矩形右下角坐标 坐标为整数，且数据范围为[-100, 100]，用例保证坐标有效
     输出描述： 输出最终图形的面积
     示例1：
     输入:2d 0 2 2 0 d -1 1 1 -1
     输出:7
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
