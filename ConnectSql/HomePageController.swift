//
//  HomePageController.swift
//  ConnectSql
//
//  Created by 王復儀 on 2022/8/8.
//

import Foundation


class HomePageController{
    func request() -> Void {
//        let url = URL(string: URLServices.api)!
        if let url = URL(string: URLServices.api) {
            URLSession.shared.dataTask(with: url) { data, response , error in
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
//                        let searchResponse = try decoder.decode(ResultResponse.self, from: data)
//                        print(searchResponse)
//                        let result = try! JSONDecoder().decode(ResultResponse.self, from: data)
                        let result = try JSONDecoder().decode(ResultResponse.self, from: data)
                        print(result)
                    } catch {
                        print(error)
                    }
                } else {
                    print("error")
                }
            }.resume()
        }
    }
}
