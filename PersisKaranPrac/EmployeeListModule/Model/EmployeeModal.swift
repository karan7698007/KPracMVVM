//
//  EmployeeModal.swift
//  PersisKaranPrac
//
//  Created by kns on 25/12/22.
//

import ObjectMapper


struct EmployeeRoot : Mappable {
    
    var data : [EmployeeData]?
    var message : String?
    var status : String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        data <- map["data"]
        message <- map["message"]
        status <- map["status"]
    }
}

struct EmployeeData : Mappable {
    
    var employeeAge : Int?
    var employeeName : String?
    var employeeSalary : Int?
    var id : Int?
    var profileImage : String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        employeeAge <- map["employee_age"]
        employeeName <- map["employee_name"]
        employeeSalary <- map["employee_salary"]
        id <- map["id"]
        profileImage <- map["profile_image"]
    }
}
