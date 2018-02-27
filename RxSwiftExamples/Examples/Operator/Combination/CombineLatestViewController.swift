//
//  CombineLatestViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CombineLatestViewController: BaseViewController {

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
        print("start combineLatest function")
        let boys = Observable.from(["boy1", "boy2", "boy3", "boy4"])
        let girls = Observable.from(["gir1", "gir2", "gir3", "gir4", "gir5", "gir6"])
        Observable.combineLatest(boys, girls) { return ($0, $1) }.subscribe { [weak self] in
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
