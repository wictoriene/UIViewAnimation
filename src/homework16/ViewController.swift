//
//  ViewController.swift
//  homework16
//
//  Created by wictoriene on 14.11.21.
//

import UIKit

final class ViewController: UIViewController {

    var imageViewArray:[UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize.init(width: 100, height: 100)
        
        imageViewArray = [UIImageView.init(image: UIImageviewUtils.resizeImage(image: UIImage(named:
                                                "1.jpeg")!, targetSize: size)),
                          UIImageView.init(image: UIImageviewUtils.resizeImage(image: UIImage(named: "2.jpeg")!, targetSize: size)),
                          UIImageView.init(image: UIImageviewUtils.resizeImage(image: UIImage(named: "3.jpeg")!, targetSize: size)),
                          UIImageView.init(image: UIImageviewUtils.resizeImage(image: UIImage(named: "4.jpeg")!, targetSize: size)),
                          UIImageView.init(image: UIImageviewUtils.resizeImage(image: UIImage(named: "5.jpeg")!, targetSize: size))]
        
        for image in imageViewArray{
            UIImageviewUtils.generateCoordinates(imageView: image, viewWidth: view.frame.width, viewHeight: view.frame.height)
            image.makeRounded()
            let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
            image.addGestureRecognizer(gesture)
            image.isUserInteractionEnabled = true
            view.addSubview(image)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for image in imageViewArray{
            UIView.animate(withDuration: 1, animations: {
                if self.view.frame.height >= image.frame.origin.y + image.frame.height{
                    image.frame.origin.y = image.frame.origin.y + 45
                    
                }
            })
        }
    }
    
    @objc func viewTapped(sender: UITapGestureRecognizer){
        let view = (sender.view as? UIImageView)!
        UIView.animate(withDuration: 0.5, animations: {
            if view.frame.origin.y - view.frame.height >= 0 {
                view.frame.origin.y = view.frame.origin.y - 100
            }
        })
    }

}
