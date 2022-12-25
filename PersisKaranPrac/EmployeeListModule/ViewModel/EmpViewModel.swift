//
//  EmpViewModel.swift
//  PersisKaranPrac
//
//  Created by kns on 25/12/22.
//

import UIKit

class EmpViewModel : NSObject {
    
    var arrEmployees:[EmployeeData]?{
        didSet {
            self.bindEmpVMToVC()
        }
    }
    
    var bindEmpVMToVC:(()->()) = {}

    
    override init() {
        super.init()
        APIManager(service: APIEndpoints.Employees,method: .get,isJSONRequest: false).executeRequest(completion: { (result:Result<EmployeeRoot,Error>) in
            switch result {
            case .success(let obj):
                self.arrEmployees = obj.data
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
    }
}
