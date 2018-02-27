//
//  CommandTableCellViewModel.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

class CommandTableCellViewModel {
    
    var title: String = ""
    var description: String = ""
    
    init(command: Command) {
        self.title = command.title
        self.description = command.description
    }
}
