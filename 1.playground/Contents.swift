import UIKit

struct BasicInformation {
    let name: String;
    var age: Int;
}

var yagomInfo: BasicInformation = BasicInformation(name: "Yagom", age: 32);

class Person {
    var height: Float = 0.0;
    var weight: Float = 0.0;
}

let yagom: Person = Person();
yagom.height = 182.5;
yagom.weight = 80;

//print(yagomInfo);
//dump(yagomInfo);

/*
 BasicInfomation
 - name: "Yagom"
 - age: 32
 */

//print(yagom);
//dump(yagom);

/*
 Person
 - height: 182.5
 - weight: 80
 */

let name: String = "yagom";
print("My name is \(name)");
