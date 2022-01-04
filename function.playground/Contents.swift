import UIKit

// 함수는 일급 객체이다
// 하나의 데이터 타입으로 사용할 수 있다.

func introduce(name: String) -> String {
    return "Hello \(name)"
}

print(introduce(name: "Jenny"))

// 전달인자 레이블
func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello(from: "yagom", to: "Jenny"));

// 레이블이 없는 함수
func sayHello2(_ name: String, _ times: Int) -> String {
    var result: String = "";
    
    for _ in 0..<times {
        result += "Hello \(name)! " + " "
    }
    
    return result;
}

print(sayHello2("chope", 2));

// 매개변수 기본
func sayHello3(_ name: String, times: Int = 3) -> String {
    var result = "";
    
    for _ in 0..<times {
        result += "Hello \(name)" + " "
    }
    
    return result;
}

print(sayHello3("Joe", times: 1));

// 7-8 가변 매개변수를 가지는 함수의 정의와 사용
// 가변 매개 변수로 들어온 인자는 배열처럼 사용 할 수 있다.
// 함수마다 가변 매개변수는 하나만 가질 수 있다.
// 함수 전달 인자로 값을 전달할 때는 보통 값을 복사해서 넘긴다.
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = "";
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result;
}


print(sayHelloToFriends(me: "yagom", friends: "Johansson", "Jay", "Wizplan"));
// Hello Johansson! Hello Jay! Hello Wizplan! I'myagom!

print(sayHelloToFriends(me: "yagom"));
// I'm yagom




// 7-9 inout 매개변수의 활용
// 값이 아닌 참조를 전달 하려면 입출력 매개변수를 사용한다.
// 값 타입 데이터의 참조를 전달인자로 보내면 함수 내부에서 참조하여 원래 값을 변경한다.

// 입출력 매개변수의 잔달 순서
// 1. 함수를 호출할때 전달인자의 값을 복사
// 2. 해당 전달인자의 값을 변경하면 1에서 복사한 것을 함수 내부에서 변경
// 3. 함수를 반환하는 시점에 2에서 변경된 값을 원래의 매개변수에 할당


// 입출력 매개변수는 기본값을 가질 수 없다.
// 가변 매개변수로 사용될 수 없다.
// 상수는 변경 될 수 없으므로 입출력 매개변수의 전달인자로 사용될 수 없다.

var numbers: [Int] = [1,2,3];

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr;
    copiedArr[1] = 1;
}
nonReferenceParameter(numbers);
print(numbers[1]); // 2

func referenceParameter(_ arr: inout[Int]) {
    arr[1] = 1;
}

referenceParameter(&numbers); // '&' 로 참조를 표현
print(numbers[1]); // 1


// 7-10 반환값이 없는 함수
func sayHelloWorld() {
    print("Hello World");
}

sayHelloWorld();


func sayHello4(from myName2: String, to name: String) {
    print("Hello \(name)! I'm \(myName2)");
}

sayHello4(from: "yagom", to: "miju");


func sayGoodbye() -> Void {
    print("Good bye");
}

sayGoodbye();


// 데이터 타입으로서의 함수
// 함수를 데이터 타입으로 사용할 수 있다.
// func sayType(name: String, times: Int) -> String {}
// (String, Int) -> String

// func sayDynamics(me: String, names: String...) -> String {}
// (String, String...) -> String

// func SayHello() {}
// (Void) -> Void
// () -> Void
// () -> ()


// 7-11 함수 타입 사용

typealias CalculateTwoInts = (Int, Int) -> Int;

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b;
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b;
}

var mathFuntion: CalculateTwoInts = addTwoInts;
// var mathFunction: (Int, Int) -> Int = addTwoInts; 와 같은 표현

print(mathFuntion(2, 3)); // 5

mathFuntion = multiplyTwoInts;

print(mathFuntion(3, 3)); // 9

// 7-12 전달인자로 함수 전달
// _ mathFunction: CalculateTwoInts 이 부분을 -> _ mathFunction: (Int, Int) -> Int로 지정해 줘도 된다.
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))");
}


printMathResult(addTwoInts, 3, 5);


// 7-13 반환값으로 함수를 반환
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5);
//print(chooseMathFunction(true)(1,2));

// 7-14 원점으로 이동하기 위한 함수 (일반 방식)
typealias MoveFunc = (Int) -> Int;

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1;
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1;
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    
    return shouldGoLeft ? goLeft : goRight;
}

var position: Int = 3;

let moveToZero: MoveFunc = functionForMove(position > 0);
print("원점으로 갑니다");

while position != 0 {
    print("\(position)...");

    position = moveToZero(position);
}

print("원점 도착");

// 중첩함수로 구현
typealias MoveFunc2 = (Int) -> Int;

func functionForMove2(_ shouldGoLeft: Bool) -> MoveFunc2 {
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1;
    }
    
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1;
    }
    
    return shouldGoLeft ? goLeft : goRight;
}

var pos: Int = -4;

let moveToZero2: MoveFunc2 = functionForMove2(pos > 0); // goRight 함수가 리턴된다

while pos != 0 {
    print("\(pos)...");
    pos = moveToZero2(pos);
}

print("원점 도착");
