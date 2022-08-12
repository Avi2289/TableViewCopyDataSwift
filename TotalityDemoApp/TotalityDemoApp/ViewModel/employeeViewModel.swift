//
//  employeeViewModel.swift
//  TotalityDemoApp
//
//  Created by Apple on 08/06/22.
//

import Foundation
import UIKit
import Moya
import ObjectMapper


class employeeViewModel {
    
    static let userProvider = MoyaProvider<ApiService>()
  
    
    var employeeModelData : EmployeeModel?
    func employeeCall(onSuccess: @escaping () -> Void) {
        
        Network.provider.request(.employeeDetail) { result in
            switch result {
            case .success(let response):
                guard let jsonResponse = try? JSONDecoder().decode(EmployeeModel.self, from: response.data) else {return
                    print("Error while Decoding")
                    
                }
                self.employeeModelData = jsonResponse
                onSuccess()
                print(jsonResponse)
            case .failure(let error) :
                print(error)
            }
        }
}
}
