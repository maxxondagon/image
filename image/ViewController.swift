//
//  ViewController.swift
//  image
//
//  Created by Maxim Soloboev on 19.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let imageView = UIImageView(image: UIImage(named: "Image"))
    let imageHeight: CGFloat = 270
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: imageHeight)
        
        scrollView.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = true
        scrollView.addSubview(imageView)
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(
            width: view.frame.width,
            height: view.frame.height + imageHeight
        )
        view.addSubview(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print(offsetY)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(
            top: imageView.frame.height - view.safeAreaInsets.top,
            left: 0,
            bottom: 0,
            right: 0
        )
        if offsetY < 0 {
            imageView.frame.origin.y = offsetY
            imageView.frame.size.height = imageHeight - offsetY
        }
    }
}
