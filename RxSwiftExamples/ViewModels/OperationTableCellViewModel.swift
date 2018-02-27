//
//  OperationTableCellViewModel.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

class OperatorTableCellViewModel {
    
    var title: String = ""
    var description: String = ""
    
    init(operator: Operator) {
        self.title = `operator`.title
        self.description = `operator`.description
    }
}
