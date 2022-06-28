//
//  Extension+.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 15/06/2022.
//

import Foundation
import SwiftyJSON


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

