//
//  ViewController.swift
//  ATNetworkDataUsageMacOSX
//
//  Created by Ankit Thakur on 10/05/19.
//  Copyright © 2019 Ankit Thakur. All rights reserved.
//

import Cocoa
import ATNetworkDataUsage

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let infos = NetworkDataInfo.networkInfo()
        print(infos)
        for info in infos {
            print(info.jsonString() as Any)
        }
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

