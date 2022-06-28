//
//  ListDate.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 17/06/2022.
//

import Foundation
import UIKit
import SwiftUI

struct Items {
    let title: String
    let image: UIImage?
}
 
enum ListDataSection : Int,CaseIterable {
    case auth = 0
    case category
    case other
    
    var title: String?{
        switch self{
        case.auth:
            return "Chuyên mục"
        case.category:
            return "sản phẩm khác "
        case .other:
            return "Khác"
        }
    }
    
    var items: [Items] {
        switch self{
        case.auth:
            return [Items(title: "Come Back Home ", image: nil),
                    Items(title: "Come Back Coming Soon", image: nil),
                    Items(title: "Góc Nhìn", image: nil),
                    Items(title: "Thế Giới", image: nil),
                    Items(title: "Video", image: nil),
                    Items(title: "Kinh Doanh", image: nil),
                    Items(title: "Giải trí", image: nil),
                    Items(title: "Thể Thao", image: nil),
                    Items(title: "Pháp Luật", image: nil),
                    Items(title: "Giáo Dục", image: nil),
                    Items(title: "Sức Khoẻ", image: nil),
                    Items(title: "Đời Sống", image: nil),
                    Items(title: "Du Lịch", image: nil),
                    Items(title: "Số Hoá", image: nil),
                    Items(title: "Xe", image: nil),
                    Items(title: "Ý Kiến", image: nil),
                    Items(title: "Tâm Sự", image: nil),
                    Items(title: "Hài", image: nil),
            ]
        case.category:
            return [Items(title: "Rao Vặt ", image: nil),
                    Items(title: "Startup Việt", image: nil),
                    Items(title: "VHome", image: nil),
                    Items(title: "eBox", image: nil),
                    Items(title: "eWork", image: nil)
            ]
        case .other:
            return [Items(title: "Ảnh ", image: nil),
                    Items(title: "Infographic", image: nil),
                    Items(title: "Mới Nhất", image: nil),
                    Items(title: "Xem Nhiều", image: nil),
                    Items(title: "Tin Nóng", image: nil)
                    
                    ]
        }
    }
}
