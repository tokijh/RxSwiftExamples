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
            CombinationOperator(title: "CombineLatest", description: "CombineLatest Example", storyboardID: "CombineLatest"),
            CombinationOperator(title: "WithLatestFrom", description: "WithLatestFrom Example", storyboardID: "WithLatestFrom"),
            CombinationOperator(title: "Merge", description: "Merge Example", storyboardID: "Merge"),
            CombinationOperator(title: "SwitchLatest", description: "SwitchLatest Example", storyboardID: "SwitchLatest"),
            CombinationOperator(title: "Zip", description: "Zip Example", storyboardID: "Zip"),
            CombinationOperator(title: "Concat", description: "Concat Example", storyboardID: "Concat"),
        ])
    }
}
