//
//  MyPasserViewController.swift
//  Project-ClonePassOrder
//
//  Created by 정덕호 on 2022/05/13.
//

import UIKit

class MyPasserTableViewController: UITableViewController {

    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAtrribute()
    }
    
    //MARK: - 메서드
    private func setAtrribute() {
        tableView.register(
            MyPasserCell.self,
            forCellReuseIdentifier: MyPasserCell.identifier
        )
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
    }
    
    //MARK: - 테이블뷰 데이터소스

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 10
    }
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return "마이 페이지"
        case 1:
            return "모아 보기"
        case 2:
            return "설정"
        default:
            return ""
        }
    }
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MyPasserCell.identifier,
            for: indexPath
        ) as! MyPasserCell
        cell.label.text = "\u{1F44D}\u{1F3FB}   내 스토리"
        return cell
    }
    

}
