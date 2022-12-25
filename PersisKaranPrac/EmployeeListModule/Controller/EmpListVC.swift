//
//  EmpListVC.swift
//  PersisKaranPrac
//
//  Created by kns on 25/12/22.
//

import UIKit

class EmpListVC: UIViewController {
    
    //outlets
    @IBOutlet weak var tblVw: UITableView!
    
    //variables
    var viewModel:EmpViewModel!
    var dataSource:EmpDataSource<EmpTblCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tblVw.registerCells([EmpTblCell()])
        self.viewModel = EmpViewModel()
        
        self.viewModel.bindEmpVMToVC = {
            self.setUpTableDataResoure()
        }
    }


    func setUpTableDataResoure(){
        self.dataSource = EmpDataSource(cellId: EmpTblCell().stringName, data: self.viewModel.arrEmployees ?? [EmployeeData](), setupCell: { cell, obj in
            cell.lblEmpName.text = obj.employeeName ?? ""
        })
        
        DispatchQueue.main.async {
            self.tblVw.dataSource = self.dataSource
            self.tblVw.reloadData()
        }
    }
}
