//
//  APITableViewCell.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 15/06/2022.
//

import UIKit
import Kingfisher

class APITableViewCell: UITableViewCell {

    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var URLToImage: UIImageView!
    @IBOutlet weak var publishedAt: UILabel!
    
    func dataNews(_ data : dataAPIModel ){
        titleTop.text = data.titleTop
        if !data.urlToImage.isEmpty {
            let imgUrl = URL(string: data.urlToImage)
            URLToImage.kf.setImage(with: imgUrl)
        } else {
            URLToImage.image = UIImage(named: "1")
        }
        
        publishedAt.text = data.publishedAt
        
        let formatter = DateFormatter() 
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "IST")
        let result1 = formatter.date(from: data.publishedAt)
        formatter.dateFormat = "HH:mm dd-MM-yyyy"
        publishedAt.text = formatter.string(from: result1!)
    }
    
}
