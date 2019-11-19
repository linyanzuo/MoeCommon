//
//  ViewController.swift
//  MoeCommon
//
//  Created by linyanzuo1222@gmail.com on 11/19/2019.
//  Copyright (c) 2019 linyanzuo1222@gmail.com. All rights reserved.
//

import UIKit
import MoeCommon

class ViewController: UIViewController {

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

}

