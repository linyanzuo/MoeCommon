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
        print(result)
        
        MLog("调试输出的内容")
        
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
}

