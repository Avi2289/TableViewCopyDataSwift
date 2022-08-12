//
//  employeeModel.swift
//  TotalityDemoApp
//
//  Created by Apple on 08/06/22.
//

import Foundation
import Moya
import ObjectMapper

struct EmployeeModel: Codable {
    let status: String?
    let data: [DetailData]?
    let message: String?
}

// MARK: - Datum
struct DetailData: Codable {
    let id: Int?
    let employeeName: String?
    let employeeSalary, employeeAge: Int?
    let profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}


//class EmployeeModel : NSObject ,NSCoding , Mappable {
//
//    var status: String?
//    var data: [DetailData]?
//    var message: String?
//
//
//    required init?(map: Map){}
//    private override init(){}
//
//
//    func mapping(map: Map) {
//        status <- map["status"]
//        data <- map["data"]
//        message <- map["message"]
//    }
//    class func newInstance(map: Map) -> Mappable?{
//        return EmployeeModel()
//    }
//
//    @objc required init(coder aDecoder: NSCoder)
//    {
//        status = aDecoder.decodeObject(forKey: "status") as? String
//        data = aDecoder.decodeObject(forKey: "data") as? [DetailData]
//        message = aDecoder.decodeObject(forKey: "message") as? String
//    }
//
//    @objc func encode(with aCoder: NSCoder)
//    {
//        if status != nil{
//            aCoder.encode(status, forKey: "status")
//        }
//        if data != nil {
//            aCoder.encode(data , forKey: "data")
//        }
//        if message != nil{
//            aCoder.encode(message, forKey: "message")
//        }
//    }
//}
//
//
//
//
//
//
//
//
//// MARK: - Datum
//class DetailData:  NSObject ,NSCoding , Mappable {
//    var id: Int?
//    var employeeName: String?
//    var employeeSalary, employeeAge: Int?
//    var profileImage: String?
//
//    required init?(map: Map){}
//    private override init(){}
//
//
//    func mapping(map: Map) {
//        id <- map["id"]
//        employeeName <- map["employee_name"]
//        employeeSalary <- map["employee_salary"]
//        employeeAge <- map["employee_age"]
//        profileImage <- map["profile_image"]
//    }
//    class func newInstance(map: Map) -> Mappable?{
//        return DetailData()
//    }
//
//    @objc required init(coder aDecoder: NSCoder)
//    {
//        id = aDecoder.decodeObject(forKey: "id") as? Int
//        employeeName = aDecoder.decodeObject(forKey: "employee_name") as? String
//        employeeSalary = aDecoder.decodeObject(forKey: "employee_salary") as? Int
//        employeeAge = aDecoder.decodeObject(forKey: "employee_age") as? Int
//        profileImage = aDecoder.decodeObject(forKey: "profile_image") as? String
//    }
//
//    @objc func encode(with aCoder: NSCoder)
//    {
//        if id != nil{
//            aCoder.encode(id, forKey: "id")
//        }
//        if employeeName != nil {
//            aCoder.encode(employeeName , forKey: "employee_name")
//        }
//        if employeeSalary != nil{
//            aCoder.encode(employeeSalary, forKey: "employee_salary")
//        }
//        if employeeAge != nil{
//            aCoder.encode(employeeAge, forKey: "employee_age")
//        }
//    }
//
////    enum CodingKeys: String, CodingKey {
////        case id
////        case employeeName = "employee_name"
////        case employeeSalary = "employee_salary"
////        case employeeAge = "employee_age"
////        case profileImage = "profile_image"
////    }
//}
