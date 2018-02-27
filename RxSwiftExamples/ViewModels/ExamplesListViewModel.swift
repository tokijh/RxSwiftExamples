//
//  ExamplesListViewModel.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class ExamplesListViewModel {
    
    let commands = Variable<[Command]>([])
    
    let disposeBag = DisposeBag()
    
    init() {
        load()
    }
    
    func load() {
        Command.load(self.commands)
    }
    
    lazy var sections: Observable<[ExampleListSectionData]> = {
        return Observable<ExampleListSectionData>.combineLatest([
            self.commands.asObservable().map { ExampleListSectionData.command(command: $0.map { ExampleListSectionData.Value.command(command: $0) } ) }
        ])
    }()
}

