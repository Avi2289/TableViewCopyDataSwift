//
//  Api.swift
//  TotalityDemoApp
//
//  Created by Apple on 08/06/22.
//

import Foundation
import Moya


enum ApiService
{
    case employeeDetail
}

extension ApiService : TargetType {
    var baseURL: URL {
        return URL(string: "https://dummy.restapiexample.com/api")!
    }
    
    var path: String {
        switch self {
        case .employeeDetail:
            return "/v1/employees"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .employeeDetail :
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .employeeDetail :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Typer":"application/json"]
    }
    
    
}
