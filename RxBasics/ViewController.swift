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
//        executeProcedure(for: "just") {
//            let observable = Observable.just("Example of Just Operator!")
//            observable.subscribe({ (event: Event<String>) in
//                print(event)
//            })
//        }
//        executeProcedure(for: "of") {
//            let observable = Observable.of(10, 20, 30)
//            observable.subscribe( {
//                print($0)
//            })
//        }
//        executeProcedure(for: "from") {
//            let disposeBag = DisposeBag()
//            let subscribed = Observable.from([10, 20, 30])
//                .subscribe(onNext:{
//                    print($0)
//                })
//            subscribed.disposed(by: disposeBag)
//        }
//        let disposeBag = DisposeBag()
//        Observable.from([1, 2, 3])
//            .subscribe(onNext: { print($0) },
//                       onCompleted: { print("Completed the events") },
//                       onDisposed: { print("Sequence terminated hence Disposed")}
//        )
//        .disposed(by: disposeBag)
//
//        executeProcedure(for: "error") {
//            enum CustomeError: Error {
//                case defaultError
//            }
//            let disposeBag = DisposeBag()
//            Observable<Void>.error(CustomeError.defaultError)
//                .subscribe(onError: { print($0) })
//                .disposed(by: disposeBag)
//        }
//        executeProcedure(for: "PublishSubject") {
//            enum CustomeError: Error {
//                case defaultError
//            }
//            let pubSubject = PublishSubject<String>()
//            let disposeBag = DisposeBag()
//            pubSubject.subscribe {
//                print($0)
//            }
//            .disposed(by: disposeBag)
//            pubSubject.on(.next("First Event"))
////            pubSubject.onError(CustomeError.defaultError)
////            pubSubject.onCompleted()
//            pubSubject.onNext("Second Event")
//            let newSubcription = pubSubject.subscribe(onNext: {
//                print("New Subscription", $0)
//            })
//            pubSubject.onNext("I am New!")
//            newSubcription.dispose()
//            pubSubject.onNext("Fourth Event")
//        }
//        executeProcedure(for: "BehaviorSubject") {
//            let disposeBag = DisposeBag()
//            let behSubject = BehaviorSubject(value: "Test")
//            let initialSubscription = behSubject.subscribe(onNext: {
//                print("Line number is \(#line) and value is", $0)
//            })
//            behSubject.onNext("Second Event")
//            let subsequentSubscription = behSubject.subscribe(onNext: {
//                print("Line number is \(#line) and value is", $0)
//            })
//            initialSubscription.disposed(by: disposeBag)
//            subsequentSubscription.disposed(by: disposeBag)
//        }
//        executeProcedure(for: "ReplaySubject") {
//            let disposeBag = DisposeBag()
//            let repSubject = ReplaySubject<String>.create(bufferSize: 3)
//            repSubject.onNext("First")
//            repSubject.onNext("Second")
//            repSubject.onNext("Third")
//            repSubject.onNext("Fourth")
//            repSubject.subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
//            repSubject.onNext("Fifth")
//            repSubject.subscribe(onNext: {
//                print("New Subscription:", $0)
//            })
//            .disposed(by: disposeBag)
//        }
//        executeProcedure(for: "Variable") {
//            let disposeBag = DisposeBag()
//            let variable = Variable(1)
//            variable.asObservable()
//                .subscribe {
//                    print($0)
//                }
//                .disposed(by: disposeBag)
//            variable.value = 2
//        }
//        RxOperators
//        executeProcedure(for: "map") {
//            Observable.of(10, 20, 30)
//                .map({$0 * $0})
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .dispose()
//        }
//        executeProcedure(for: "flatMap and flatMapLatest") {
//            struct GamePlayer {
//                let playerScore: Variable<Int>
//            }
//            let disposeBag = DisposeBag()
//            let alex = GamePlayer(playerScore: Variable(70))
//            let gemmea = GamePlayer(playerScore: Variable(85))
//            var currentPlayer = Variable(alex)
//            currentPlayer.asObservable()
//                .flatMapLatest( { $0.playerScore.asObservable() })
//                .subscribe(onNext: {
//                    print($0)
//                })
//                .disposed(by: disposeBag)
//            currentPlayer.value.playerScore.value = 90
//            alex.playerScore.value = 95
//            currentPlayer.value = gemmea
//            alex.playerScore.value = 96
//        }
        executeProcedure(for: "scan and buffer") {
            let disposeBag = DisposeBag()
            let gameScore = PublishSubject<Int>()
            gameScore.buffer(timeSpan: 0.0, count: 3, scheduler: MainScheduler.instance)
                .map{
                    print($0, "-->", terminator: "")
                    return $0.reduce(0, +)
                }
                .scan(501, accumulator: -)
                .map({max($0, 0)})
                .subscribe(onNext: {
                    print($0)
                })
                .disposed(by: disposeBag)
            gameScore.onNext(60)
            gameScore.onNext(13)
            gameScore.onNext(50)
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

