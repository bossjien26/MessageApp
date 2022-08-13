//
//  SignInController.swift
//  ConnectSql
//
//  Created by 王復儀 on 2022/8/12.
//

import Foundation


class SignInController{
    public func request(account:String,password:String) async -> Bool {
        var resultStatus:Bool = false
        if let url = URL(string: URLServices.loginApi+"/api/Login") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()

            let user = SignInRequest(Account: account, Password: password)
            let data = try? encoder.encode(user)
            request.httpBody = data
            
            do{
                let (data,response) = try await URLSession.shared.data(for: request)
                do {
                    if let httpResponse = response as? HTTPURLResponse{
                        if httpResponse.statusCode == 400{
                            _ = try JSONDecoder().decode(SignInErrorResponse.self, from: data)
                        }else{
                            let result = try JSONDecoder().decode(SignInResponse.self, from: data)
                            resultStatus = result.status
                        }
                    }
                } catch {
                    print(error)
                }
            }catch{
                print("error")
            }
//            let session = URLSession.shared
            
//            session.dataTask(with: request) { data, response , error in
//                if let data = data {
//                    do {
//                        if let httpResponse = response as? HTTPURLResponse{
//                            if httpResponse.statusCode == 400{
//                                let result = try JSONDecoder().decode(SignInErrorResponse.self, from: data)
//                            }else{
//                                let result = try JSONDecoder().decode(SignInResponse.self, from: data)
//                            }
//                        }
//                    } catch {
//                        print(error)
//                    }
//                } else {
//                    print("error")
            //      _   }
//            }.resume()
//
        }
        return resultStatus
    }
}
