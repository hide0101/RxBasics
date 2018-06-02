//
//  ViewController.swift
//  RxBasics
//
//  Created by hideakikomori on 2018/06/02.
//  Copyright © 2018年 Hideaki Komori. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func executeProcedure(for description: String, procedure: () -> Void) {
        print("Procedure executed for:", description)
        procedure()
    }

}

