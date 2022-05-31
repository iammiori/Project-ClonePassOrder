//
//  SelectOrderDatePickerView.swift
//  Project-ClonePassOrder
//
//  Created by Eunsoo KIM on 2022/05/31.
//

import UIKit
import SnapKit

final class SelectOrderDatePickerViewController: UIViewController {

    // MARK: - Properties

    private var availableYear: [Int] = []
    private var allMonth: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var selectedYear = 0
    var selectedMonth = 0
    private var todayYear = "0"
    private var todayMonth = "0"

    // MARK: - UI Properties

    private let selectOrderDatePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()

    // MARK: - viewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setAvailableDate()
        setPickerView()
    }

    // MARK: - setLayout

    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubview(selectOrderDatePickerView)
        
        selectOrderDatePickerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - setPickerView

    private func setPickerView() {
        selectOrderDatePickerView.delegate = self
        selectOrderDatePickerView.dataSource = self
        let defaultIndexOfYear = availableYear.count - 1
        selectOrderDatePickerView.selectRow(defaultIndexOfYear, inComponent: 0, animated: true)
        let defaultIndexOfMonth = allMonth.firstIndex(of: Int(todayMonth) ?? 0) ?? 0
        selectOrderDatePickerView.selectRow(defaultIndexOfMonth, inComponent: 1, animated: true)
    }

    // MARK: - Methods

    private func setAvailableDate() {
        let formatterYear = DateFormatter()
        formatterYear.dateFormat = "yyyy"
        todayYear = formatterYear.string(from: Date())

        for i in 2012...Int(todayYear)! {
            availableYear.append(i)
        }
        
        let formatterMonth = DateFormatter()
        formatterMonth.dateFormat = "MM"
        todayMonth = formatterMonth.string(from: Date())
        
        selectedYear = Int(todayYear)!
        selectedMonth = Int(todayMonth)!
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension SelectOrderDatePickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return availableYear.count
            case 1:
                return allMonth.count
            default:
                return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
    ) -> String? {
        switch component {
        case 0:
            return "\(availableYear[row])"
        case 1:
            return "\(allMonth[row])"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
            case 0:
                selectedYear = availableYear[row]
            case 1:
                selectedMonth = allMonth[row]
            default:
                break
        }
    }
}
