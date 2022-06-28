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
enum listNews: Int,CaseIterable{
    case homePage
    case latest
    case podcasts
    case news
    case view
    case world
    case video
    case business
    
    var listText: String?{
        switch self {
        case .homePage:
            return "Trang Chủ"
        case .latest:
            return "Mới Nhất"
        case .podcasts:
            return "Podcasts"
        case .news:
            return "Thời Sự"
        case .view:
            return "Góc Nhìn"
        case .world:
            return "Thế Giới "
        case .video:
            return "Video"
        case .business:
            return "Kinh Doanh"
        }
    }
}
