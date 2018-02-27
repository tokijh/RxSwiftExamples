//
//  ExamplesListViewModel.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

class ExamplesListViewModel {
    
    let combinationOperators = Variable<[CombinationOperator]>([])
    
    let disposeBag = DisposeBag()
    
    init() {
        load()
    }
    
    func load() {
        CombinationOperator.load(self.combinationOperators)
    }
    
    lazy var sections: Observable<[ExampleListSectionData]> = {
        return Observable<ExampleListSectionData>.combineLatest([
            self.combinationOperators.asObservable().map { ExampleListSectionData.combination(operators: $0.map { ExampleListSectionData.Value.combination(operator: $0) } ) }
        ])
    }()
}

