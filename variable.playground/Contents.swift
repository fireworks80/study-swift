import UIKit

/*. 변수 */

var name: String = "Yagom";
var age: Int = 100;
var job = "ios Programmer"; // 타입추론
var height = 181; // 타입 추론
print("\(type(of: height))");

age = 99;
job = "Writer";
print("저의 이름은 \(name)이고, 나이는 \(age)이며, 직업은 \(job)입니다. 비밀이지만 키는 \(height)입니다.");


/*.상수 */
let name1: String = "Yagom";
var age1: Int = 100;
var job1 = "iOS Programmer";
let height1 = 181.5;

age1 = 99;
job1 = "Writer";
//name1 = "야곰"; // 상수값이므로 변경(X)
print("저의 이름은 \(name1)이고, 나이는 \(age1) 이며, 직업은 \(job1)입니다. 비밀이지만 키는. \(height1)입니다.");
