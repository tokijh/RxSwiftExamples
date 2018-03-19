//
//  ExamplesListViewController.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ExamplesListViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(OperationTableCell.self, forCellReuseIdentifier: OperationTableCell.Identifier)
        return tableView
    }()
    
    let viewModel = ExamplesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bind()
    }
    
    func initView() {
        appendSubViews()
        setConstraints()
    }
    
    func appendSubViews() {
        self.view.addSubview(self.tableView)
    }
    
    func setConstraints() {
        self.tableView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
    }
    
    func bind() {
        self.viewModel.sections.bind(to: tableView.rx.items(dataSource: self.dataSource)).disposed(by: disposeBag)
        self.tableView.rx.modelSelected(ExampleListSectionData.Value.self).subscribe(onNext: { [weak self] in
            switch $0 {
            case .combination(let operation):
                guard let vc = ExampleCombinationVC(rawValue: operation.viewID)?.getOperatorVC() else { return }
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
    lazy var dataSource: RxTableViewSectionedReloadDataSource<ExampleListSectionData> = { [unowned self] in
        return RxTableViewSectionedReloadDataSource(
            configureCell: { (dataSource, tableView, indexPath, row) -> UITableViewCell in
                switch dataSource[indexPath] {
                case .combination(let `operator`):
                    if let cell = tableView.dequeueReusableCell(withIdentifier: OperationTableCell.Identifier, for: indexPath) as? OperationTableCell {
                        cell.configure(viewModel: OperatorTableCellViewModel(operator: `operator`))
                        return cell
                    }
                }
                return UITableViewCell()
        }, titleForHeaderInSection: { (dataSouece, section) -> String? in
            switch section {
            case 0: return "Combination Operations"
            default: return nil
            }
        }, titleForFooterInSection: { (dataSource, section) -> String? in
            return nil
        }, canEditRowAtIndexPath: { (dataSource, indexPath) -> Bool in
            return false
        }, canMoveRowAtIndexPath: { (dataSource, indexPath) -> Bool in
            return false
        }, sectionIndexTitles: { (dataSource) -> [String]? in
            return nil
        }, sectionForSectionIndexTitle: { (dataSource, title, row) -> Int in
            return row
        })
        }()
}
