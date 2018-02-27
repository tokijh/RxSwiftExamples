//
//  Command.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class Command: Example {
    
}

extension Command {
    open class func load(_ commands: Variable<[Command]>) {
        commands.value.append(contentsOf: [
            Command(title: "CombineLatest", description: "CombineLatest Example", storyboardID: "CombineLatest")
        ])
    }
}
