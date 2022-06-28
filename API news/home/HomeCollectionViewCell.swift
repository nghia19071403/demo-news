//
//  HomeCollectionViewCell.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 20/06/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var listNews: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setShowBottom(_ show: Bool = false) {
        bottomView.isHidden = !show
//        if show {
//            listNews.textColor = .red
//        } else {
//            listNews.textColor = .black
//        }
        listNews.textColor = show ?.red : .black
        
    }
}
