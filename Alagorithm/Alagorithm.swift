//
//  Alagorithm.swift
//  Alagorithm
//
//  Created by Magus on 2022/5/26.
//

import Foundation


class Alagorithm {
    /**
     【用户调度问题】在通信系统中，一个常见的问题是对用户进行不同策略的调度，会得到不同的系统消耗和性能。 假设当前有n个待串行调度用户，每个用户可以使用A/B/C三种不同的调度策略，不同的策略会消耗不同的系统资源。请你根据如下规则进行用户调度，并返回总的 消耗资源数。
     规则：
     1. 相邻的用户不能使用相同的调度策略，例如，第1个用户使用了A策略，则第2个用户只能使用B或者C策略。
     2. 对单个用户而言，不同的调度策略对系统资源的消耗可以归一化后抽象为数值。例如，某用户分别使用A/B/C策略的系统消耗分别为15/8/17。
     3. 每个用户依次选择当前所能选择的对系统资源消耗最少的策略（局部最优），如果有多个满足要求的策略，选最后一个。 输入描述
     
     第一行表示用户个数n
     接下来每一行表示一个用户分别使用三个策略的系统消耗resA resB resC
     
     输出描述： 最优策略组合下的总的系统资源消耗数
     备注：所有策略对系统的资源消耗均为正整数，n < 1000
     
     示例1：
     输入
     3
     15 8 17
     12 20 9
     11 7 5
     输出:24
     */
    func userConsume(count count:UInt,a a:[UInt],b b:[UInt],c c:[UInt]) -> UInt {
        
        var  array:[[UInt]] = [a,b,c]
        var last = -1
        var total: UInt = 0
        for i in 0..<count {
            var min:UInt = 9999
            
            var minindex = -1
            for j in 0..<array[Int(i)].count {
                if array[Int(i)][Int(j)] < min ,j != last {
                    min = array[Int(i)][Int(j)]
                    minindex = j
                }
            }
            
            last =  minindex
            print(min,last)
            total += min
        }
        
        return total
    
    }
    
    
    /**
     【事件推送】同一个数轴X上有两个点的集合A={A1,A2, …, Am}和B={B1,B2, …,Bn}，Ai和Bj均为正整数，A、B已经按照从小到大排好序，A、B均不为空，给定一 个距离R(正整数)，列出同时满足如下条件的所有（Ai, Bj）数对：
     
     1） Ai <= Bj
     2） Ai, Bj之间的距离小于等于R
     3） 在满足1）2）的情况下，每个Ai只需输出距离最近的Bj
     4） 输出结果按Ai从小到大的顺序排序 输入描述：
     
     
     第一行三个正整数m，n，R
     第二行m个正整数，表示集合A
     第三行n个正整数，表示集合B
     输入限制： 1<=R<=100000，1<=n,m<=100000，1<=Ai,Bj<=1000000000
     
     输出描述：
     每组数对输出一行Ai和Bj，以空格隔开
     
     示例1：
     输入
     4 5 5
     1 5 5 10
     1 3 8 8 20
    输出
     1 1
     5 8
     5 8
     */
    
    func event(m m:Int,n n:Int,r r:Int,a a:[Int],b b:[Int]) ->  [(Int,Int)] {
        var  result = [(Int,Int)]()
        if a.count != m, b.count != n {
            print("输入数据无效")
            return result
        }
        
        
        for i in 0..<a.count {
            for j in 0..<b.count {
                if a[i] <= b[j] ,b[j] - a[i] <= r{
                    result.append((a[i],b[j]))
                    break
                }
            }
        }
        return result
        
    }
    
    /**
     【计算疫情扩散时间】在一个地图中(地图由n*n个区域组成），有部分区域被感染病菌。感染区域每天都会把周围（上下左右）的4个区域感染。 请根据给定的地图计算，多少天以后，全部区域都会被感染。 如果初始地图上所有区域全部都被感染，或者没有被感染区域，返回-1
     
     输入描述：
     一行N*N个数字（只包含0,1，不会有其他数字）表示一个地图，数字间用,分割，0表示未感染区域，1表示已经感染区域 每 N个数字表示地图中一行，输入数据共表示N行N列的区域地图。 例如输入1,0,1,0,0,0,1,0,1，表示地图 1,0,1 0,0,0 1,0,1
     输出描述：
     一个整数，表示经过多少天以后，全部区域都被感染
     备注：1<=N<200
     
     输入：1,0,1,0,0,0,1,0,1
     输出 2
     */
    
    func virtul(_ input:[Int]) ->Int {
        var array  = input
        let n = Int(sqrt(Double(array.count)))
        var day = 1
        if array.contains(0),array.contains(1) {
            for _ in 1...n {
                var canContinue = false
                for i in 0..<array.count {
                    if array[i] == 0 {
                        continue
                    }
                    
                    if array[i] == -1 {
                        array[i] = 1
                        continue
                    }
                    var top = 0
                    var left = 0
                    var right = 0
                    var down = 0

                    if i - n  > 0 {
                        top = array[i - n]
                        if top == 0 {
                            array[i - n] = -1
                        }
                    }
                    
                    if (i + 1) < array.count, i / n == (i + 1) / n{
                        right = array[i + 1]
                        if right == 0 {
                            array[i + 1] = -1
                        }
                    }
                    if i - 1 > 0, i / n == (i - 1) / n{
                        left = array[i - 1]
                        if left == 0 {
                            array[i - 1] = -1
                        }
                    }
                    if i + n  < array.count {
                        down = array[i + n]
                        if  down == 0 {
                            array[i + n] = -1
                        }
                    }
                    if left == 0, right == 0 ,top == 0 , down == 0 {
                        canContinue = true
                    }
                }
                if canContinue {
                    day += 1
                } else {
                    return day
                }
            }
        } else {
            return -1
        }
        
        return day
    }
    
    /**
     【最大花费金额】双十一众多商品进行打折销售，小明想购买自己心仪的一些物品，但由于受购买资金限制，所以他决定从众多心仪商品中购买三件，而且想尽可能 的花完资金，现在请你设计一个程序帮助小明计算尽可能花费的最大资金数额。 输入描述：
     
     输入第一行为一维整型数组M，数组长度小于100，数组元素记录单个商品的价格，单个商品价格小于1000。 输 入第二行为购买资金的额度R，R小于100000。
     
     输出描述： 输出为满足上述条件的最大花费额度。
     注意：如果不存在满足上述条件的商品，请返回-1
     
     备注：
     输入格式是正确的，无需考虑格式错误的情况。
     示例1：
     23,26,36,27
     78
     输出
     76
     */
    
    
    func maxMoney(_ products:[Int],_ money:Int) -> Int {
        var  max = 0
        for i in 0..<products.count {
            for j in i..<products.count {
                for k in j..<products.count {
                    if i != j, j != k {
                        let sum = products[i] + products[j] + products[k]
                        if sum < money , sum > max {
                            max = sum
                        }
                    }
                }
            }
        }
        return max
    }
    
    /**
     【两数之和绝对值最小】给定一个从小到大的有序整数序列（存在正整数和负整数）数组 nums ，请你在该数组中找出两个数，其和的绝对值(|nums[x]+nums[y]|) 为 最小值，并返回这个绝对值。 每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。 输入描述
     
     一个通过空格分割的有序整数序列字符串，最多1000个整数，且整数数值范围是 -65535~65535。 两数之和绝对值最小值
     */
    
    
    func minAbs (_ input:[Int]) {
     
        
        var  min = -1
        for i in 0..<input.count {
            for j in i+1..<input.count {
                let v =  abs(input[i] + input[j])
                if min == -1 || v < min {
                    min = v
                }
            }
        }
        print(min)
    }
    
    
    
    
    /**
     【数组二叉树】二叉树也可以用数组来存储，给定一个数组，树的根节点的值存储在下标1，对于存储在下标N的节点，它的左子节点和右子节点分别存储在下标 2*N和2*N+1，并且我们用值-1代表一个节点为空。 给定一个数组存储的二叉树，试求从根节点到最小的叶子节点的路径，路径由节点的值组成。 输入描述：
     
     输入一行为数组的内容，数组的每个元素都是正整数或表示节点为空的-1，元素间用空格分隔。注意第一个元素即为根节点的值，即数组的第N个元素对应下标N ，下标0在树的表示中没有使用，所以我们省略了。输入的树最多为7层。
     
     输出描述： 输出从根节点到最小叶子节点的路径上，各个节点的值，由空格分隔，用例保证最小叶子节点只有一个。 示例1：
     输出3 5 7 -1 -1 2 4
     输入 3 7 2
     */
    
    func treePath(_ input:[Int]) -> [Int]{
       
        var  res = [Int]()
        var  index = [Int]()
        
        for i in 1..<input.count {
            
            if input[i] == -1 {
                continue
            }
            if 2*i >= input.count , 2*i + 1 > input.count {
                res.append(input[i])
                index.append(i)
            } else   if  input[2*i] == -1  , input[2*i + 1] == -1 {
                res.append(input[i])
                index.append(i)
            }
        }
        print(res)
        print(index)
        
        var min:Int?
        var minIndex = 0
        
        for j in 0..<res.count {
            if let m = min {
                if res[j] <= m {
                    min = res[j]
                    minIndex = index[j]
                }
            } else {
                min = res[j]
                minIndex = index[j]
            }
            
        }
        print(min,minIndex)
        var  result = [Int]()
        while minIndex >= 1 {
            result.insert(input[minIndex], at: 0)
            minIndex = minIndex / 2
        }
        
        return result
    }
    
 
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
     
     
     规律：
     (10 -1)  *  0 - +  1
     (10 -1)  *   1 +  10
     (10 -1)  *  (10 - 1 + 10 ) +  10*10
     (10 -1)  *  ((10 -1)  *  (10 - 1 + 10 ) +  10*10 ) +  10*10*10*
     
          
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
