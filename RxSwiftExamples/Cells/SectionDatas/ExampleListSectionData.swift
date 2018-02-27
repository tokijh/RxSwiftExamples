//
//  ExampleListSectionData.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxDataSources

enum ExampleListSectionData {
    case command(command: [Value])
}

extension ExampleListSectionData: SectionModelType {
    
    typealias Item = Value
    
    var items: [Value] {
        switch self {
        case .command(let commands): return commands
        }
    }
    
    enum Value {
        case command(command: Command)
    }
    
    init(original: ExampleListSectionData, items: [Value]) {
        switch original {
        case .command(_): self = .command(command: items)
        }
    }
}
