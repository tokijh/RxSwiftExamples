//
//  ConcatViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class ConcatViewController: OperatorViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Concat"
        function()
    }
    
    func function() {
        print("start concat function")
        let a = Observable.from(["A", "B", "C", "D", "E"])
        let b = Observable.from(["1", "2", "3"])
        
        a.concat(b).subscribe { [weak self] in
            self?.print($0)
        }.disposed(by: disposeBag)
    }
}
