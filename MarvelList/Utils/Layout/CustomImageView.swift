//
//  CustomImageView.swift
//  MarvelList
//
//  Created by resource on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .whiteLarge
        indicator.hidesWhenStopped = true
        indicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        indicator.isUserInteractionEnabled = false
        indicator.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        return indicator
    }()
    
    var imageUrlString: String?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(activityIndicator)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func loadAndCacheImage(from urlString: String, completion: (() -> Void)? = nil) {
        if let url = URL(string: urlString) {
            loadAndCacheImage(from: url, completion: completion)
        }
    }
    
    func loadAndCacheImage(from url: URL, completion: (() -> Void)? = nil) {
        let urlString = url.absoluteString
        imageUrlString = urlString
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            completion?()
            return
        }
        
        let networkLayer = NetworkURLSession()
        
        activityIndicator.startAnimating()
        networkLayer.get(url, headers: nil, completion: { [weak self] result in
            switch result {
                case .success(let data):
                    self?.activityIndicator.stopAnimating()
                    if let imageToCache = UIImage(data: data) {
                        if self?.imageUrlString == urlString {
                            self?.image = imageToCache
                        }
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                        completion?()
                    }
                
                case .failure: self?.activityIndicator.stopAnimating()
            }
        })
    }
    
}
