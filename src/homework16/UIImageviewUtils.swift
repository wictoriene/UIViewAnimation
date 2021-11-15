//
//  UIImageviewUtils.swift
//  homework16
//
//  Created by wictoriene on 14.11.21.
//

import UIKit

class UIImageviewUtils{
    static func generateCoordinates(imageView:UIImageView, viewWidth:CGFloat, viewHeight:CGFloat ){
        imageView.alpha = 1  //прозрачность 0=прозрачно, 1 = не прозрачно
        let imageWidth = imageView.frame.width
        let imageHeight = imageView.frame.height
        imageView.frame = CGRect(x:CGFloat.random(in:imageWidth...(viewWidth-imageWidth)), y:CGFloat.random(in:imageHeight...(viewHeight-imageHeight)), width:CGFloat(imageWidth), height:CGFloat(imageHeight))
    }
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        let rect = CGRect(origin: .zero, size: newSize)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
