//
//  EmpDataSource.swift
//  PersisKaranPrac
//
//  Created by kns on 25/12/22.
//

import UIKit

class EmpDataSource<TABCELL:UITableViewCell,T>:NSObject,UITableViewDataSource {
    
    var cellId : String!
    var items:[T]!
    var setupCell:(TABCELL,T) -> () = {_ , _ in }
    
    init(cellId:String,data:[T],setupCell:(@escaping (TABCELL,T)->())) {
        self.cellId = cellId
        self.items = data
        self.setupCell = setupCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmpTblCell().stringName, for: indexPath) as? TABCELL else {
            return UITableViewCell()
        }
        let obj = self.items[indexPath.row]
        self.setupCell(cell,obj)
        return cell
    }
    
    
}
