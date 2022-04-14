//
//  ViewController.swift
//  MoeCommon
//
//  Created by linyanzuo1222@gmail.com on 11/19/2019.
//  Copyright (c) 2019 linyanzuo1222@gmail.com. All rights reserved.
//

import UIKit
import MoeCommon

struct RuntimeKey {
    static let name = runtimeKey(for: "name")!
}

class ViewController: UIViewController, Runtime {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = "Hello".moe.subString(start: 2)
        MLog(result!)
        
        let arr2 = [4, 5, 6]
        var arr1 = [1, 2, 3]
        arr1 += arr2
        MLog(arr1)
        
        let dict2 = ["3": 3,
                     "4": 4]
        var dict1 = ["1": 1,
                     "2": 2]
        dict1 += dict2
        MLog(dict1)
    }
    
    @objc var name: String {
        get {
            var _name = getAssociatedObject(for: RuntimeKey.name) as? String
            if _name == nil {
                _name = String()
                setAssociatedRetainObject(object: _name, for: RuntimeKey.name)
            }
            return _name!
        }
        set { setAssociatedRetainObject(object: newValue, for: RuntimeKey.name) }
    }
    
    /// 判断当前内容是否为有效的手机号码
    /// - Returns:  是手机号码则返回true，否则返回false
    func isPhoneNumber(value: String) -> Bool {
        let MOBILE = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
        /** 中国移动（China Mobile）：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188、198 */
        let CM = "^1(34[0-8]|(3[5-9]|47|5[012789]|78|8[23478]|98)\\d)\\d{7}$"
        /** 中国联通（China Unicom）：130、131、132、145、155、156、166、175、176、185、186 */
        let CU = "^1(3[0-2]|45|5[56]|66|7[56]|8[56])\\d{8}$"
        /** 中国电信（China Telecom）：133、149、153、173、177、180、181、189、199 */
        let CT = "(^1(33|49|53|7[37]|8[019])\\d{8}$)|(^1700\\d{7}$)"

        let regexTestMobile = NSPredicate(format:"SELF MATCHES %@", MOBILE).evaluate(with: value)
        let regexTestCM = NSPredicate(format:"SELF MATCHES %@", CM).evaluate(with: value)
        let regexTestCU = NSPredicate(format:"SELF MATCHES %@", CU).evaluate(with: value)
        let regexTestCT = NSPredicate(format:"SELF MATCHES %@", CT).evaluate(with: value)
        if (regexTestMobile || regexTestCM || regexTestCU || regexTestCT) { return true }
        
        return false
    }
}
