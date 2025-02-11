//
//  UIImageView+DownloadImage.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 30.12.2023.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [ weak self] in
                self?.image = image
            }
            
        }.resume()
    }
    func downloaded(from link: String, contentMode mode:ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else {return }
        downloaded(from: url, contentMode: mode)
    }
}
