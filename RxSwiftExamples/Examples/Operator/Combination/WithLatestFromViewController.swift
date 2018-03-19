//
//  WithLatestFromViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class WithLatestFromViewContoller: OperatorViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WithLatestFrom"
        function()
        function2()
    }
    
    func function() {
        print("start withLatestFrom function")
        let person = Observable.from(["boy1", "boy2", "boy3", "boy4"])
        let price = Observable.from([1000, 2000, 3000, 4000, 5000])
        person.withLatestFrom(price) {
            return ($0, $1)
        }.subscribe { [weak self] in
            self?.print($0)
        }.disposed(by: disposeBag)
    }
    
    func function2() {
        print("start withLatestFrom function2")
        let person = Observable.from(["boy1", "boy2", "boy3", "boy4"])
        let price = Observable.from([1000, 2000])
        person.withLatestFrom(price) {
            return ($0, $1)
        }.subscribe { [weak self] in
            self?.print($0)
        }.disposed(by: disposeBag)
    }
}
