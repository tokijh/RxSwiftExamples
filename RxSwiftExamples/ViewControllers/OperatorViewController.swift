//
//  OperatorViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class OperatorViewController: BaseViewController {
    
    lazy var markLabel: UILabel = {
        let label = UILabel()
        label.text = "Log"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    
    lazy var logTextView: UITextView = {
        let textView = UITextView()
        textView.borderWidth = 1
        textView.borderColor = UIColor.black
        textView.cornerRadius = 5
        textView.isEditable = false
        return textView
    }()
    
    let log = Variable<String>("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bind()
    }
    
    func initView() {
        appendSubViews()
        setConstraints()
        self.view.backgroundColor = UIColor.white
    }
    
    func appendSubViews() {
        self.view.addSubview(self.markLabel)
        self.view.addSubview(self.logTextView)
    }
    
    func setConstraints() {
        self.markLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.left.equalTo(self.view).offset(16)
            $0.right.equalTo(self.view).offset(-16)
        }
        self.logTextView.snp.makeConstraints {
            $0.top.equalTo(self.markLabel.snp.bottom).offset(16)
            $0.left.equalTo(self.view).offset(16)
            $0.right.equalTo(self.view).offset(-16)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    func bind() {
        log.asObservable().subscribe(onNext: { [weak self] in
            self?.logTextView.text = $0
        }).disposed(by: disposeBag)
    }
    
    func print(_ items: Any...) {
        items.forEach {
            Swift.print($0)
            self.log.value += String(describing: $0) + "\n"
        }
    }
}
