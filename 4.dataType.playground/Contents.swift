import UIKit

// 타입 별칭
typealias MyInt = Int;
typealias YoutInt = Int;
typealias MyDouble = Double;

let age: MyInt = 100;
var year: YoutInt = 2080;

year  = age;
let month: Int = 7;
let percentage: MyDouble = 99.9;

// 튜플
// 타입이 따로 지정되어 있지 않은, '지정된 데이터의 묶음' c언어의 원시 구조체의 형태와 가깝다

var person: (String, Int, Double) = ("yagom", 100, 183.45);

print("name: \(person.0), age: \(person.1), tall: \(person.2)");

// 튜플에 이름 지정
var person1: (name: String, age: Int, tall: Double) = ("he", 42, 181.2);
print("name: \(person1.name), age: \(person1.age), tall: \(person1.tall)");

typealias PersonTuple = (name: String, age: Int, tall: Double);

let yagom: PersonTuple = ("yagom", 34, 180);
let eric: PersonTuple = ("eric", 190, 132);

print("nameL \(yagom.name), age: \(yagom.age), tall: \(yagom.tall)");
print("nameL \(eric.name), age: \(eric.age), tall: \(eric.tall)");


// 컬랙션
// 컬랙션 타입에는 배열, 딕셔너리, 세트 등이 있다.

// 배열
var names: Array<String> = ["yagom", "chulsoo", "younghee"];

var names1: [String] = ["yagom", "chulsoo", "younghee"]; // 위의 선언과 동일

var emptyArray: [Any] = [Any](); // Any 데이터를 요소로 갖는 빈 배열을 생성
var emptyArray1: [Any] = Array<Any>(); // 위 선언과 같다.

// 배열 타입을 정확이 명시 했다면 []만으로도 빈 배열을 생성 할 수 있다.

var emptyArray2:  [Any] = [];
print(emptyArray2.isEmpty);
print(names.count);

print(names[2]); // younghee
names[2] = "jenny";

print(names[2]); // jenny
//print(names[4]); // error

//names[3] = "elsa";
//print(names[3]); // 인덱스 범위를 벗어나서 오류

names.append("elsa");
names.append(contentsOf: ["john", "max"]); // 마지막에 john, max 추가
names.insert("happy", at: 1);
names.insert(contentsOf: ["jinhee", "minsoo"], at: 5);

print(names); //["yagom", "happy", "chulsoo", "jenny", "elsa", "jinhee", "minsoo", "john", "max"]
print(names[4]); // elsa
print(names.firstIndex(of: "chulsoo") as Any); // Optional(2)

print(names.first!);
print(names.last as Any);


let firstitem: String = names.removeFirst();
print(firstitem); // yagom
print(names); // ["happy", "chulsoo", "jenny", "elsa", "jinhee", "minsoo", "john", "max"]

let indexZeroItem: String = names.remove(at: 0);
print(indexZeroItem);

print(names[1...3]);

// 딕셔너리
typealias StringIntDictionary = [String: Int];
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>();

var numberForName1: [String: Int] = [String: Int](); // 위와 동일한 구문
var numberForName2: StringIntDictionary = StringIntDictionary(); // 위와 동일

var numberForName3: [String: Int] = [:]; //타입을 정확히 명시 했으면 빈 [:]로 선언 가능

// 초깃값으로 생성
var numberForName4: [String: Int] = ["yagom": 100, "chulsoo": 50];

print(numberForName.isEmpty);
print(numberForName4.isEmpty);
print(numberForName4.count);

print(numberForName4["chulsoo"] as Any);
//print(numberForName4["hee"]); // nil

numberForName4["chulsoo"] = 200;
print((numberForName4["chulsoo"] ?? <#default value#>) as Int);

numberForName4["max"] = 100;
print(numberForName4["max"]!);

print(numberForName4.removeValue(forKey: "yagom"));
print(numberForName4.removeValue(forKey: "yagom")); // 이미 지워진 값 이므로 nil

print(numberForName4["yagom", default: 0]); // yagom키에 해당하는 값이 없으면 기본값으로 0이 반환돤디
print(numberForName4);

// 세트
// 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬랙션 타입
// 세트 내의 값은 중복되지 않는 유일한 값
// 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우에 사용
