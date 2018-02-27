//
//  WithLatestFromViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WithLatestFromViewContoller: BaseViewController {
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
    
    func print(_ items: Any...) {
        items.forEach {
            Swift.print($0)
            self.log.value += String(describing: $0) + "\n"
        }
    }
}
