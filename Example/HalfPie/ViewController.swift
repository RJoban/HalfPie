//
//  ViewController.swift
//  HalfPie
//
//  Created by ravi7876 on 09/26/2019.
//  Copyright (c) 2019 ravi7876. All rights reserved.
//

import UIKit
import HalfPie

class ViewController: UIViewController {

    @IBOutlet weak var Round_view: HalfPieView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Round_view.frontLineWidth = 3
        Round_view.bottomLineWidth = 5
        Round_view.frontLineColor = .green
        Round_view.bottomLineColor = .lightGray
        Round_view.needPointer = true
        Round_view.Add_PieViewFor(value: 5.9, total: 25)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

