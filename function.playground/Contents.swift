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
