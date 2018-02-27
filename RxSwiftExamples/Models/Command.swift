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
            Command(title: "CombineLatest", description: "CombineLatest Example", storyboardID: "CombineLatest"),
            Command(title: "WithLatestFrom", description: "WithLatestFrom Example", storyboardID: "WithLatestFrom"),
            Command(title: "Merge", description: "Merge Example", storyboardID: "Merge"),
            Command(title: "SwitchLatest", description: "SwitchLatest Example", storyboardID: "SwitchLatest"),
            Command(title: "Zip", description: "Zip Example", storyboardID: "Zip"),
            Command(title: "Concat", description: "Concat Example", storyboardID: "Concat"),
        ])
    }
}
