//
//  DateSelection+TableView.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/23.
//

import UIKit

extension DateSelectionController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.monthInfosRf.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.dateSelection(index: indexPath.row)
        coordinator?.pop()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateSelectionCell.identifer, for: indexPath) as? DateSelectionCell ?? DateSelectionCell()
        let monthInfo = viewModel.monthInfosRf[indexPath.row]
        
        cell.configureUI(with: monthInfo, index: indexPath.row, previousMonthInfo: selectedMonthInfo)
        return cell
    }
}
