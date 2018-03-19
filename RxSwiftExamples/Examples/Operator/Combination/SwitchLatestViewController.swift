//
//  SwitchLatestViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class SwitchLatestViewController: OperatorViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SwitchLatest"
        function()
    }
    
    func function() {
        print("start switchLatest function")
        let aSubject = PublishSubject<String>()
        let bSubject = PublishSubject<String>()
        let switchTest = BehaviorSubject<Observable<String>>(value: aSubject)

        switchTest.switchLatest().subscribe { [weak self] in
            self?.print($0)
        }.disposed(by: disposeBag)
        
        aSubject.on(.next("AA-1"))
        bSubject.on(.next("BB-1"))
        switchTest.on(.next(bSubject))
        aSubject.on(.next("AA-2"))
        bSubject.on(.next("BB-2"))
        aSubject.on(.next("AA-3"))
        bSubject.on(.next("BB-3"))
        bSubject.on(.next("BB-4"))
    }
}
