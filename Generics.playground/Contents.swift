//: Learn generics here

import UIKit

// Data Structure
struct Queue<Element>{
    private var elements = [Element]()
    
    mutating func enqueue(newElement: Element){
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else{
            return nil
        }
        
        return elements.removeAtIndex(0)
    }
    
}

var q = Queue<Int>()

q.enqueue(3)
q.enqueue(5)
q.enqueue(10)

//Methods (with `Where` clause)
func mid<T where T: Comparable>(array: [T]) -> T{
    return array.sort()[(array.count - 1) / 2]
}

mid([10,20,90,50,40])

//protocols
protocol Summable {
    func +(lhs: Self, rhs: Self) -> Self
}
extension Int: Summable{}
extension Double: Summable{}

func adder<T: Summable>(x: T, _ y: T) -> T{
    return x+y
}

let intSum = adder(20, 10)
let floatSum = adder(10.4, 9.60)

extension String: Summable {}
let stringSum = "foo"+"bar"

//Extension of Generics
extension Queue{
    public func peek() -> Element?{
        return elements.first
    }
}

var qo = Queue<Int>()
qo.enqueue(10)
qo.enqueue(20)
qo.enqueue(30)
qo.enqueue(40)
let ans = qo.peek()

//Challenge: Check if all elements of the queue are equal.
struct QueueNew<Element: Equatable>{
    private var elements = [Element]()
    
    mutating func enqueue(newElement: Element){
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else{
            return nil
        }
        
        return elements.removeAtIndex(0)
    }
}
extension QueueNew{
    func homogenous() -> Bool{
        if let first = elements.first{
            return !elements.contains{$0 != first}
        }
        return true
    }
}

var quu = QueueNew<Int>()
quu.enqueue(10)
quu.enqueue(10)
quu.enqueue(10)
quu.enqueue(10)

quu.homogenous()


//Understanding Box(subclassing generic classes)
class Box<T> {
    let box = Box<Int>()
}
class Gift<T>: Box<T>{
    let gift = Gift<T>()
}
class StringBox: Box<String>{
    let stringBox = StringBox()
}

//Enums with multiple generics associated values
enum Result<ValueType, ErrorType> {
    case Success(ValueType)
    case Failure(ErrorType)
}

func divideOrError(x: Int, y: Int) -> Result<Int, String> {
    guard y != 0 else {
        return Result.Failure("Division by zero is undefined")
    }
    
    return Result.Success(x / y)
}
let result1 = divideOrError(42, y: 2)
let result2 = divideOrError(42, y: 0)


