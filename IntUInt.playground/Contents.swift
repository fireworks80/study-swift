import UIKit

var integer: Int = -100;
let unsignedInteger: UInt = 50; // UInt타입은 음수를 할당 할 수 없다.
print("integer: \(integer), unsignedInteger: \(unsignedInteger)");
print("Int 최대값: \(Int.max), 최소값: \(Int.min)");

print("UInt 최댓값: \(UInt.max), 최소값: \(UInt.min)");

let largeInt: Int64 = Int64.max;
let smallUnsignedInteger: UInt8 = UInt8.max;
print("Int64 최대값: \(largeInt), Uint8 최댓값: \(smallUnsignedInteger)");


let decimalInteger: Int = 28;
let binaryInteger: Int = 0b11100; // 28
let octalInteger: Int = 0o34; // 28
let hexadecimalInteger: Int = 0x1c; // 28

print(decimalInteger, binaryInteger, octalInteger, hexadecimalInteger);

var boolean: Bool = true;
boolean.toggle(); // true - false 반전

let iLover: Bool = true;
let isTimeUnlimited: Bool = false;
print("시간은 무한합니까? \(isTimeUnlimited)");


let ranNum: Int = Int.random(in: -100...100);
print(ranNum);

let alphabetA: Character = "A";
print(alphabetA);

let name: String = "yagom";

var introduce: String = String(); // 빈문자열 생성

introduce.append("제 이름은");

introduce = introduce + " " + name + "입니다";
print(introduce);

print("name count: \(name.count)");

let kName: String = "홍길동";
print ("Kname count: \(kName.count)");


print("introduce is empty: \(introduce.isEmpty)");


let unicodeScalarValue: String = "\u{2665}";
print(unicodeScalarValue);


let hello: String = "Hello";
let yagom: String = "yagom";
var greeting: String = hello + " " + yagom + "!";
print(greeting);

greeting = hello;
greeting += " ";
greeting += yagom;
greeting += "!";
print(greeting);


var isSameString: Bool = false;

isSameString = hello == "Hello";
print(isSameString);

isSameString = hello == "hello";
print(isSameString);

var hasPrefix: Bool = false;
hasPrefix = hello.hasPrefix("He");
print(hasPrefix);

var hasSuffix: Bool = false;
hasSuffix = hello.hasSuffix("llo");
print(hasSuffix);

// 메서드를 통한 대소문자 변환

var convertedString: String = String();
convertedString = hello.uppercased();
print(convertedString);

convertedString = hello.lowercased();
print(convertedString);

// 프로퍼티를 이용한 빈문자 확인
var isEmptyString: Bool = false;
isEmptyString = greeting.isEmpty;
print(isEmptyString); // false

greeting = "";
print(greeting.isEmpty); // true

// 큰 따옴표
greeting = """
안녕하세요 이것은 큰 따옴표
를 이용한 문장 입니다.
잘 부탁합니다
""";
print(greeting);

var someVar: Any = 1;
someVar = "yagom";
someVar = 100.1;



