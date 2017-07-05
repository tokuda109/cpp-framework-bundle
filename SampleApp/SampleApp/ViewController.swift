//
//  ViewController.swift
//  SampleApp
//
//  Created by Tsuyoshi Tokuda on 2017/06/26.
//  Copyright © 2017 Tsuyoshi Tokuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sampleLib: SampleLib?

    override func viewDidLoad() {
        super.viewDidLoad()

        SampleLib.world()

        view.backgroundColor = UIColor.white
    }
}
