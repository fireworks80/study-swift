// 옵셔녈
// 해당 변수 또는 상수에는 값이 없을 수 있다.
// 변수/상수에 정말 값이 없을때 nil로 표현 한다
// nil == null
// 값이 없는 옵셔널 변수 / 상수에 접근하려면 런타임 오류 발생

//var myName: String = "hello";
//myName = nil // nil cannot be assigned to type 'String' 오류

// nil은 옵셔널로 선언된 곳에서만 사용될 수 있다.
// 변수/상수 등은 데이터 타입 뒤에 ?를 붙여서 표현

var myName: String? = "yagom"
print(myName) // Optional("yagom")

// 어떤 상황에서 사용할까?
// - 함수에 전달되는 전달인자의 값이 잘못된 값일 경우 제대로 처리하지 못했음을 nil을 반환하여 표현
// - 매개변수를 굳이 넘기지 않아도 된다는 뜻으로 매개변수의 타입을 옵셔널로 정의 할 수 있다.

// 옵셔널은 제네릭이 적용된 열거형
// 8-4
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
        case .none:
            print("This Optional variable is nill")
        case .some(let value):
            print("Value is \(value)")
    } // switch
}

var myName2: String? = "yagom"
checkOptionalValue(value: myName2)

myName2 = nil
checkOptionalValue(value: myName2)

// 8-5
let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("negative value!! \(value)")
    case .some(let value) where value > 10:
        print("large value!! \(value)")
    case .some(let value):
        print("value \(value)")
    case .none:
        print("nil")
    } //switch
} // for


// 옵셔널 추출 방법
// - 강제 추출방법: 가장 간단하지만 가장 위험한 방법 (런타임 오류가 일어날 가능성이 가장 높다)(지양)
// 옵셔널 값의 뒤에 ! 를 붙여준다.
// 만약 강제 추출 시 옵셔널에 값이 없다면(nil) 런타임 오류

//8-6
//var myName3: String? = "yagom"

// 옵셔널이 아닌 변수에는 옵셔널 값이 들어 갈 수 없으므로 추출해서 할당해 줘야 한다.
//var yagom: String = myName3!

//myName3 = nil
//yagom = myName3!

// if 조건문으로 조금 안전하게 처리해볼 수 있다.
//if myName3 != nil {
//    print("my name is \(myName3)")
//} else {
//    print("myName3 == nil")
//}

// - 옵셔널 바인딩
// 만약 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌
// 형태로 사용할 수 있도록 해준다.
// 옵셔널 바인딩은 if 또는 while 구문 등과 결합하여 사용할 수 있다.

//8-7
var yourName: String? = "hong"

// 옵셔널 바인딩을 통한 임시 상수 할당
if let name = yourName { // if 블록에서만 사용 할 수 있는 상수 name
    print("your namae is \(name)")
} else {
    print("your name == nil")
}
// your name is hong

// 옵셔널 바인딩을 통한 임시 변수 할당
if var name = yourName { // if 블록에서만 사용 할 수 있는 변수 name 그래서 위의 name과 충돌 나지 않음
    name = "wizplan"
    print("your name is \(name)")
} else {
    print("your name == nil")
}
// your name is wizplan

// 8-8 옵셔널 바인딩을 사용한 여러 개의 옵셔널 값의 추출
// 쉼표(,)를 사용해 바인딩 할 옵셔널을 나열하면 된다.
// 단 바인딩 하려는 옵셔널 중 하나라도 값이 없다면 해당 블록 내부의 명령문은 실행 안됌
var myName4: String? = "yagom"
var yourname2: String? = nil

// friend에 바인딩이 되지 않으므로 실행되지 않는다.
if let name = myName4, let friend = yourname2 {
    print("We are friend! \(name) & \(friend)")
}

yourname2 = "eric"

if let name = myName4, let friend = yourname2 {
    print("We are friend! \(name) & \(friend)")
}
