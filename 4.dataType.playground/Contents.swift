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

// 배열과 마찬가지로 대괄호로 값들을 묶어 세트 타입을 표현
var nameSet2: Set<String> = ["yagom", "chulsoo", "younghee"];

// 타입 추론을 하게 되면 Set이 아닌 Array로 타입을 지정하게 된다.
var numbers = [100, 200, 399];
print(type(of: numbers)); // Array<Int>

// 배열과 달리 줄여서 표현할 수 있는 축약형이 없다

// 빈세트는 이니셜라이저 또는 리터럴 무넙을 통해 생성할 수 있다.
var nameSet: Set<String> = Set<String>();
var nameSet1: Set<String> = [];

// 요소의 갯수는 count프로퍼티로 확인
print(nameSet2.count); // 3

print(nameSet2.isEmpty); // false

// 요소 추가
// insert("");

nameSet2.insert("jenny");
print(nameSet2.count); // 4

print(nameSet2.remove("chulsoo"));

// 교집합
let englishClassStudents: Set<String> = ["john", "chulsoo", "yagom"];
let koreanClassStudents: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"];

let intersecSet: Set<String> = englishClassStudents.intersection(koreanClassStudents);
print("intersection: \(intersecSet)"); // ["yagom", "chulsoo"]

// 여집합
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents);
print("symmetricDiff: \(symmetricDiffSet)"); // ["jenny", "minsoo", "john", "hana"]

// 합집합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents);
print("union: \(unionSet)"); // ["yagom", "minsoo", "hana", "jenny", "chulsoo", "john"]
print(unionSet.sorted());

// 차집합
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents);
print("subtract: \(subtractSet)"); // john


let 새: Set<String> = ["비둘기", "닭", "기러기"];
let 포유류: Set<String> = ["사자", "호랑이", "곰"];
let 동물: Set<String> = 새.union(포유류);

print(새.isDisjoint(with: 포유류)); // 서로 배타적인지 t
print(새.isSubset(of: 동물)); // 새가 동물의 부분집합 인지 t
print(동물.isSuperset(of: 포유류)); // 동물은 포유류의 전체 집합인지 t
print(동물.isSuperset(of: 새)); // 동물은 새의 전체 집합인지 t

// 열거형
// 연관된 항목들을 묵어서 표현할 수 있는 타입.
// 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가능
// - 제한된 선택지를 주고 싶을때
// - 정해진 값 외에는 입력받고 싶지 않을 때
// - 예상된 입력 값이 한정되어 있을 때
