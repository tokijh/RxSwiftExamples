//
//  SwitchLatestViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SwitchLatestViewController: BaseViewController {
    @IBOutlet weak var logTextView: UITextView!
    
    let log = Variable<String>("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        function()
    }
    
    func bind() {
        log.asObservable().subscribe(onNext: { [weak self] in
            self?.logTextView.text = $0
        }).disposed(by: disposeBag)
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
    
    func print(_ items: Any...) {
        items.forEach {
            Swift.print($0)
            self.log.value += String(describing: $0) + "\n"
        }
    }
}
