//
//  OperationTableCell.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class OperationTableCell: UITableViewCell {
    
    class var Identifier: String { return "OperationTableCell" }
    
    var viewModel: OperatorTableCellViewModel?
    var disposeBag = DisposeBag()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    func initView() {
        self.selectionStyle = .none
        appendSubViews()
        setConstraints()
    }
    
    func appendSubViews() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
    }
    
    func setConstraints() {
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView).offset(6)
            $0.left.equalTo(self.contentView).offset(6)
            $0.right.greaterThanOrEqualTo(self.contentView).offset(-6)
        }
        self.descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(6)
            $0.left.equalTo(self.titleLabel.snp.left).offset(0)
            $0.right.greaterThanOrEqualTo(self.contentView).offset(-6)
            $0.bottom.equalTo(self.contentView).offset(-6)
        }
    }
    
    func configure(viewModel: OperatorTableCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
    }

}
