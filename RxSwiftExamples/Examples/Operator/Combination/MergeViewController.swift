//
//  MergeViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class MergeViewController: OperatorViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Merge"
        function()
    }
    
    func function() {
        print("start merge function")
        let aTimer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        let aTeam = aTimer.map { "A : \($0)" }
        let bTeam = Observable<Int>.interval(2, scheduler: MainScheduler.instance).map { "B : \($0)" }
        let cTeam = Observable<Int>.interval(1, scheduler: MainScheduler.instance).map { "C : \($0)" }
        let startTime = Date().timeIntervalSince1970
        Observable.of(aTeam, bTeam, cTeam).merge().subscribe { [weak self] in
            self?.print("\($0) : \(Int(Date().timeIntervalSince1970 - startTime))")
        }.disposed(by: disposeBag)
        aTimer.subscribe(onNext: { [weak self] in
            self?.print("A timer : \($0)")
            if $0 >= 10 {
                self?.print("Stop timer")
                self?.disposeBag = DisposeBag()
                self?.print("Stopped timer") // did this function but logTextView will not refresh because log.asObserable().subscribe(...) is disposed. (self.log.value is refreshed.)
            }
        }).disposed(by: disposeBag)
    }
}
