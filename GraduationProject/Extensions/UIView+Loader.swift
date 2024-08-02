//
//  UIView+Loader.swift
//  lec12
//
//  Created by 1234 on 28/07/2024.
//

import UIKit

extension UIView{
    
    
    func showLoader(){
        let activityIndicator =  setUpActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    func hideLoader(){
        if let activityIndicator = viewWithTag(333){
            activityIndicator.removeFromSuperview()
        }
    }
    private func setUpActivityIndicator()-> UIActivityIndicatorView{
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.center = self.center
        activityIndicator.tag = 333
        activityIndicator.style = .large
        return activityIndicator
    }
}
