//
//  ViewController.swift
//  testkitout
//
//  Created by luofei on 2017/5/31.
//  Copyright © 2017年 luofei. All rights reserved.
//

import UIKit

import signalKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("kit log: \(SharedManager.getDateStringWithY_M_D())")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

