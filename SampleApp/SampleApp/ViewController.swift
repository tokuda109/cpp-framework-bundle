//
//  ViewController.swift
//  SampleApp
//
//  Created by Tsuyoshi Tokuda on 2017/06/26.
//  Copyright © 2017 Tsuyoshi Tokuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sampleLib: SampleLib = .init()
        sampleLib.hello()

        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
