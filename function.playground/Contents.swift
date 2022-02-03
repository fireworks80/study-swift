import UIKit

// 함수는 일급 객체이다
// 하나의 데이터 타입으로 사용할 수 있다.

// 7-1
func hello(name: String) -> String {
    return "Hello \(name)"
}

let helloJenny: String = hello(name: "Jenny");
print(helloJenny);


// return 생략 가능
func introduce(name: String) -> String {
    "제 이름은 " + name + " 입니다"
}

let introductJenny: String = introduce(name: "Jenny");
print(introductJenny);


// 7-2
// 매개 변수 없는 함수
func helloWorld() -> String {
    return "Hello World"
}

print(helloWorld()); // Hello World

// 7 - 3
// 여러개 매개변수
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName) I'm \(myName)"
}

print(sayHello(myName: "yagom", yourName: "Jenny")) // Hello Jenny I'm yagom

// 7-4
// 매개 변수에 전달 인자 레이블을 달 수 있다.
// 전달 인자 레이블을 별도로 지정하면 함수 외부에서 매개변수의 역할을 좀 더 명확히 할 수 있다.
func sayHelloLable(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHelloLable(from: "Yagom", to: "Jenny"))

// 7-5 (와일드 카드 식별자)
// 전달인자 레이블이 없는 함수
func sayHelloNotLable(_ name: String, _ times: Int) -> String {
    var result: String = "";
    
    for _ in 0..<times {
        result += "Hello \(name)" + " "
    } // for
    
    return result;
}

print(sayHelloNotLable("Chope", 2)); // Hello Chope Hello Chope


// 7-6
// 전달인자 레이블 변경을 통한 함수 중복 정의
// 함수 오버로드
func sayHellolb(to name: String, _ times: Int) -> String {
    var result: String = "";
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    } // for
    
    return result
}

func sayHellolb(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    } // for
    
    return result
}

print(sayHellolb(to: "Chope", 2))
print(sayHellolb(to: "Chope", repeatCount: 2))


// 7-7
// 매개변수 기본값이 있는 함수
// 기본매개 변수가 있는 함수도 함수 오버로드가 된다.
func sayHellolb(_ name: String, times: Int = 3) -> String {
    var result: String = "";
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    } // for
    
    return result;
}

print(sayHellolb("Chope"));


// 7-8
// 가변 매개변수와 입출력 매개변수
// 가변매개 변수: 0개 이상, 가변 매개변수로 들어온 인자값은 배열처람 사용 할 수 있다.
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)! "
    } // for
    
    result += "I'm \(me)!"
    
    return result;
}

print(sayHelloToFriends(me: "Yagom", friends: "Johansson", "Jay", "Wizplan"));
print(sayHelloToFriends(me: "Yagom"))


// 함수의 전달인자로 보통 값을 복사 해서 전달
// 값 복사가 아닌 참조를 전달 하려면 입출력 매개변수를 사용한다.
// 함수형 패러다임에서는 입출력 매개변수를 사용하지 않는 것이 좋다.
// 참조는 매개변수로 전달될 변수, 상수 앞에 &를 붙여서 표현

var numbers: [Int] = [1, 2, 3]
func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr;
    copiedArr[1] = 1;
}

func referenceParameter(_ arr: inout[Int]) {
    arr[1] = 1;
}

nonReferenceParameter(numbers);
print(numbers); // [1,2,3]

referenceParameter(&numbers); // 참조 매개변수 앞에 &를 붙인다.
print(numbers); // [1,1,3]

// 7-10
// 반환 값이 없는 함수의 정의
func sayHelloWord() {
    print("Hello word");
}

sayHelloWord()

func sayGoodbye() -> Void {
    print("Good bye")
}

sayGoodbye()

// 일급 함수
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts

print(mathFunction(2, 5)) // 7

mathFunction = multiplyTwoInts

print(mathFunction(2, 5)) // 10

// 매개변수로 함수를 전달 할 수 있다.
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))");
}

printMathResult(addTwoInts, 3, 5)

// 7-13
// 특정 조건에 따라 적절한 함수를 반환해주는 함수
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)


// 7-14
// 중첩 함수
//typealias MoveFunc = (Int) -> Int
//
//func goRight(_ currentPosition: Int) -> Int {
//    return currentPosition + 1
//}
//
//func goLeft(_ currentPosition: Int) -> Int {
//    return currentPosition - 1
//}
//
//func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
//    return shouldGoLeft ? goLeft : goRight
//}
//
//var position: Int = 3
//
//// goLeft 함수가 할당
//let moveToZero: MoveFunc = functionForMove(position > 0)
//print("원접으로 갑시다.")
//
//while position != 0 {
//    print("\(position)...")
//    position = moveToZero(position)
//}
//
//print("원점 도착")

// 7-15
// 위의 함수를 중첩함수로 구현
typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

// position이 0 보다 작으므로 goRight
let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)")
    position = moveToZero(position)
}

print("원점 도착")

// 7 - 16
// 종료되지 않는 함수
// 비반환 함수, 비반환 메서드
// 비반환 함수는 정상적으로 끝날 수 없는 함수
// 비반환 함수 안에서는 오류를 던진다든가, 중대한 스스템 오류를 보고하는 등이 일을 하고 프로세스를 종료 해버린다.
// 비반환 함수 반환 타입은 Never
func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

//crashAndBurn() // 프로세스 종료후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false)

// 반환값을 무시할 수 있는 함수
// 프로그래머가 의도족으로 함수의 반환값을 사용하지 않을 경우 컴파일러가 함수의 결과 값을 사용하지 않았다는 경고를
// 보낼 때가 있는데 이런 경우 함수의 반환 값을 무시해도 된다는 @discardableReuslt 선언 속성을 사용 한다.

// 7-17
func say(_ something: String) -> String {
    print(something)
    return something
}


@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("hello")

discardableResultSay("hello")
