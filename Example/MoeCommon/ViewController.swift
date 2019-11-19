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
    }

}

