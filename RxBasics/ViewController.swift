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
        executeProcedure(for: "just") {
            let observable = Observable.just("Example of Just Operator!")
            observable.subscribe({ (event: Event<String>) in
                print(event)
            })
        }
        executeProcedure(for: "of") {
            let observable = Observable.of(10, 20, 30)
            observable.subscribe( {
                print($0)
            })
        }
        executeProcedure(for: "from") {
            let subscribed = Observable.from([10, 20, 30])
                .subscribe({
                    print($0)
                })
            subscribed.dispose()
        }
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

