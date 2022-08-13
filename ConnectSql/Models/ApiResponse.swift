//
//  ApiResponse.swift
//  ConnectSql
//
//  Created by 王復儀 on 2022/8/10.
//

import Foundation

struct ResultResponse: Codable {
    var page:Int
    var per_page:Int
    var total:Int
    var total_pages:Int
    var data:[Datas]
    var support:Support
}

struct Datas:Codable{
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

struct Support:Codable{
    var url:String
    var text:String
}
