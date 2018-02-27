//
//  ZipViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ZipViewController: BaseViewController {
    @IBOutlet weak var logTextView: UITextView!
    
    let log = Variable<String>("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        function()
        function2()
    }
    
    func bind() {
        log.asObservable().subscribe(onNext: { [weak self] in
            self?.logTextView.text = $0
        }).disposed(by: disposeBag)
    }
    
    func function() {
        print("start zip function")
        let name = Observable.from(["A", "B", "C"])
        let cost = Observable.from([1, 2, 3, 4, 5])
        let status = Observable.from([true, false, false])
        
        Observable.zip(name, cost, status) { ($0, $1, $2) }
            .subscribe { [weak self] in
                self?.print($0)
            }.disposed(by: disposeBag)
    }
    
    func function2() {
        print("start zip function2")
        let aTimer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        let aTeam = aTimer.map { "A : \($0)" }
        let bTeam = Observable<Int>.interval(3, scheduler: MainScheduler.instance).map { "B : \($0)" }
        let cTeam = Observable<Int>.interval(4, scheduler: MainScheduler.instance).map { "C : \($0)" }
        let startTime = Date().timeIntervalSince1970
        
        Observable.zip(aTeam, bTeam, cTeam) { ($0, $1, $2) }
            .subscribe { [weak self] in
                self?.print("\($0) : \(Int(Date().timeIntervalSince1970 - startTime))")
            }.disposed(by: disposeBag)
        aTimer.subscribe(onNext: { [weak self] in
            self?.print("A timer : \($0)")
            if $0 >= 30 {
                self?.print("Stop timer")
                self?.disposeBag = DisposeBag()
                self?.print("Stopped timer") // did this function but logTextView will not refresh because log.asObserable().subscribe(...) is disposed. (self.log.value is refreshed.)
            }
        }).disposed(by: disposeBag)
    }
    
    func print(_ items: Any...) {
        items.forEach {
            Swift.print($0)
            self.log.value += String(describing: $0) + "\n"
        }
    }
}

