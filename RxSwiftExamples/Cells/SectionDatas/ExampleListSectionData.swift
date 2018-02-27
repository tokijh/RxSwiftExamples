//
//  ExampleListSectionData.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxDataSources

enum ExampleListSectionData {
    case combination(operators: [Value])
}

extension ExampleListSectionData: SectionModelType {
    
    typealias Item = Value
    
    var items: [Value] {
        switch self {
        case .combination(let operators): return operators
        }
    }
    
    enum Value {
        case combination(operator: CombinationOperator)
    }
    
    init(original: ExampleListSectionData, items: [Value]) {
        switch original {
        case .combination(_): self = .combination(operators: items)
        }
    }
}
