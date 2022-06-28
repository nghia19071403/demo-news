//
//  NewsMododel.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 15/06/2022.
//

import Foundation
import SwiftyJSON

struct dataAPIModel{
    var titleTop = ""
    var urlToImage = ""
    var publishedAt = ""
    var url = ""
    
    init(_ json: JSON){
        self.titleTop = json ["title"].stringValue
        self.urlToImage = json [ "urlToImage"].stringValue
        self.publishedAt = json [ "publishedAt"].stringValue
        self.url = json["url"].stringValue
    }
}
             
