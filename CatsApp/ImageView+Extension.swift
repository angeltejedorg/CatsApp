//
//  ImageView+Extension.swift
//  CatsApp
//
//  Created by angel.tejedore on 9/11/22.
//

import UIKit
import Alamofire

extension UIImageView {
    func loadFrom(URLAddress: String) {
        print("puesto")
        
        AF.download(URLAddress).responseURL { response in
            if response.error == nil, let imagePath = response.fileURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            
        }
    }
}
