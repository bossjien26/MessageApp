//
//  LoginResponse.swift
//  ConnectSql
//
//  Created by 王復儀 on 2022/8/12.
//

import Foundation

struct SignInRequest: Codable {
    var Account:String
    var Password:String
}


struct SignInResponse: Codable {
    var status:Bool
    var message:String
}

struct SignInErrorResponse:Codable{
    var errors:ErrorString
}

struct ErrorString:Codable{
    var Password:[String]
    var Account:[String]
}
