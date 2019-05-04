import UIKit

//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var a = 0
//        var b = 0
//        for i in 0..<nums.count {
//            a = nums[i] - target
//            if nums.contains(a){
//                b = nums.firstIndex(of: a)!
//                return [i,b]
//            }
//        }
//        return [0,0]
//    }
//}

//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var a = 0
//        var b = 0
//        for i in 0..<nums.count {
//            a = target - nums[i]
////            print("a = \(a)")
////            print(i)
//            let n = i + 1
//            let c = nums[n...]
//            print(c)
//            if c.contains(a){
//                b = c.index(of: a)!
////                print(b)
//                return [i,b]
//            }
//        }
//        return [0,0]
//    }
//var a = [1,1,2,5,5,10,19]
//var b = 10
//twoSum(a, b)
//
//var c = [2,3,2,3,3,4,4]
//let cNum = c.index(of:2)
//
//var f = c[1...]
//var g = c[2...]
//f.append(2)
//let d = c.index(of: 3)
//d

//func twoSum(_ nums:[Int],_ target: Int) -> [Int]{
//    for i in 0 ..< nums.count{
//        let n = i + 1
//        for j in n ..< nums.count {
//            if nums[i] + nums[j] == target {
//                return [i,j]
//            }
//        }
//    }
//    return [0,0]
//}
//
//func reverse(_ x: Int) -> Int{
//        var a = abs(x)
//        var array: [Int] = [0]
//        array.removeAll()
//        while a > 0 {
//            array.append(a % 10)
//            a /= 10
//        }
//        var sum = 0
//        for i in 0 ..< array.count {
//            sum += array[i] * Int(pow(10.0, Double(array.count - i - 1)))
//        }
//
//    if x < 0 && -sum > Int32.min{
//        return -sum
//    }else if x > 0 && sum < Int32.max{
//        return sum
//    }else {
//        return 0
//    }
//}
//-8463847412 > -2147483648
//
//Int32.max
//Int32.min
//var a = -2147483648
//reverse(a)

//func myPow(_ x: Double,_ n: Int) -> Double{
//    return pow(x, Double(n))
//}

class ListNode{
    var val : Int
    var next: ListNode?

    init(_ va1: Int) {
        self.val = va1
        self.next = nil
    }
}
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode) -> ListNode?{
    var p: ListNode?
    var q: ListNode?
    p = l1
    q = l2
    var num = 0
    if (q != nil && p != nil) {
        while (q != nil && p != nil) {
            let a = q!.val + p!.val + num
            num = a > 10 ? 1 : 0
            p!.val = a > 10 ? a - 10 : a
            p = p!.next
            q = q!.next
        }
        if num == 1{
            let new = ListNode(num)
            p?.next = new
            p = p?.next
        }
        
        if p == nil {
            p?.next = q?.next
        }
    }
    
    return l1
}

var a = ListNode(10)
a.val
a.next = ListNode(20)
var q: ListNode?
var p : ListNode?
p = a
q = a
//q = q?.next
//q?.val
//a.next?.val

for i in 0...100{
    p?.next = ListNode(i)
    p = p?.next
}

a.next?.val

while q != nil {
    print(q!.val)
    q = q!.next
}
//public class ListNode{
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int){
//        self.val = val
//        self.next = nil
//    }
//}
//var a = ListNode(10)

//var a: ListNode?
//var a: ListNode?
//a?.val = 10
//a?.val
//a?.next
//
//for i in 0...100 {
//    var b: ListNode?
//    b?.val = i
//    a?.next = b
//}
//a?.val
//a?.next?.val
//
//while a != nil {
//    print(a!.val)
//    a = a?.next
//}


//class Solution {
//    func addTwoNumbers(_ l1: ListNode?,_ l2: ListNode?) -> ListNode? {
//        var p: ListNode?
//        var q: ListNode?
//        let r = ListNode(0)
//        var t: ListNode?
//        t = r;
//        p = l1
//        q = l2
//        var num = 0
//        if l1 != nil && l2 != nil{
//            while (p != nil && q != nil) {
//                let a: Int
//                a = p!.val + q!.val + num
//                if a > 10{
//                    num = 1
//                }else{
//                    num = 0
//                }
//                t?.next = ListNode(a)
//            }
//            if p == nil {
//                t?.next = t?.next
//            }
//            if q == nil {
//                t?.next = p?.next
//            }
//
//        }else if p == nil {
//            t = q
//        }else if q == nil{
//            t = p
//        }
//
//        return r;
//    }
//}

//NSMutableArray 是引用类型，而NSArray是值类型
var mutableArray = [1,2,3]
for _ in mutableArray {
    mutableArray.removeAll()
}

let mutableArray1: NSMutableArray = [1,2,3]
let otherArray = mutableArray1
mutableArray1.add(4)
otherArray

class BinaryScanner {
    var position: Int
    let data: Data
    init(data: Data) {
        self.position = 0
        self.data = data
    }
}

extension BinaryScanner{
    func scanByte() -> UInt8?{
        guard position < data.endIndex else {
            return nil
        }
        
        position += 1
        return data[position - 1]
    }
}

func scanRemainingBytes(scanner: BinaryScanner){
    while let byte = scanner.scanByte() {
        print(byte)
    }
}

let scanner = BinaryScanner(data: Data("012".utf8))
scanRemainingBytes(scanner: scanner)
Data("012".utf8)

struct Point{
    var x: Int
    var y: Int
}

let origin = Point(x: 0, y: 0)

var otherPoint = Point(x: 0, y: 0)
otherPoint.x += 10
otherPoint

var thirdPoint = origin
thirdPoint.x += 10
thirdPoint
origin

struct Size{
    var width: Int
    var height: Int
}

struct Rectangle{
    var origin: Point
    var size: Size
}

extension Point{
    static let zero = Point(x: 0, y: 0)
}

let rect = Rectangle(origin: Point.zero, size: Size(width: 320, height: 480))

extension Rectangle{
    init(x: Int = 0,y: Int = 0,width: Int,height: Int) {
        origin = Point(x: x, y: y)
        size = Size(width: width, height: height)
    }
}

var screen = Rectangle(width: 320, height: 480){
    didSet{
        print("Screen changed:\(screen)")
    }
}
screen.origin.x = 10

var screens: [Rectangle] = []{
    didSet{
        print("Screen array changed:\(screens)")
    }
}

screens.append(Rectangle(width: 320, height: 480))
screens[0].origin.x += 100

func +(lhs:Point,rhs:Point) -> Point{
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}
screen.origin + Point(x: 10, y: 10)
extension Rectangle{
    mutating func translate(by offset: Point) {
        origin = origin + offset
    }
}

screen.translate(by: Point(x: 10, y: 10))
screen

extension Rectangle{
    func translated(by offset: Point) -> Rectangle{
        var copy = self
        copy.translate(by: offset)
        return copy
    }
}
screen.translated(by: Point(x: 20, y: 20))

func translateByTwentyTwenty(rectangle: inout Rectangle){
    rectangle.translate(by: Point(x: 20, y: 20))
}
translateByTwentyTwenty(rectangle: &screen)
screen

func uniquelntegerProvide() -> () -> Int{
    var i = 0
    return{
        i += i
        return i
    }
}

class View{
    var window: Window
    init(window: Window) {
        self.window = window
    }
}

class Window{
    var rootView: View?
}

var window: Window? = Window()
var view: View? = View(window: window!)
window?.rootView = view
view = nil
window = nil


