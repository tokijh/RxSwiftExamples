//
//  ExampleCombinationVC.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

enum ExampleCombinationVC: String {
    case combineLatest = "combineLatest"
    case concat = "concat"
    case merge = "merge"
    case switchLatest = "switchLatest"
    case withLatestFrom = "withLatestFrom"
    case zip = "zip"
}

extension ExampleCombinationVC {
    func getOperatorVC() -> OperatorViewController {
        switch self {
        case .combineLatest: return CombineLatestViewController()
        case .concat: return ConcatViewController()
        case .merge: return MergeViewController()
        case .switchLatest: return SwitchLatestViewController()
        case .withLatestFrom: return WithLatestFromViewContoller()
        case .zip: return ZipViewController()
        }
    }
}
