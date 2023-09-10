//
//  UIImageView+Extensions.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 09/09/23.
//

import UIKit
import Alamofire

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        AF.request(urlString, method: .get).response { [weak self] response in
         switch response.result {
          case .success(let responseData):
             guard let dataImage = responseData else {
                 return
             }
             self?.image = UIImage(data: dataImage, scale:1)
          case .failure(let error):
             debugPrint("error load image: \(error.localizedDescription)")
          }
      }
    }
}
