//
//  CombinationOperator.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class CombinationOperator: Operator {
    
}

extension CombinationOperator {
    open class func load(_ operators: Variable<[CombinationOperator]>) {
        operators.value.append(contentsOf: [
            CombinationOperator(title: "CombineLatest", description: "CombineLatest Example", viewID: "combineLatest"),
            CombinationOperator(title: "Concat", description: "Concat Example", viewID: "concat"),
            CombinationOperator(title: "Merge", description: "Merge Example", viewID: "merge"),
            CombinationOperator(title: "SwitchLatest", description: "SwitchLatest Example", viewID: "switchLatest"),
            CombinationOperator(title: "WithLatestFrom", description: "WithLatestFrom Example", viewID: "withLatestFrom"),
            CombinationOperator(title: "Zip", description: "Zip Example", viewID: "zip"),
        ])
    }
}
