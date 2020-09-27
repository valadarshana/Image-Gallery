//
//  ViewController.swift
//  Image Gallery
//
//  Created by Vijay Parmar on 26/09/20.
//  Copyright © 2020 WD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn_heart: UIButton!
    
    @IBOutlet weak var imgGallery: UIImageView!
    
  //  var arrImage = [["image":#imageLiteral(resourceName: "img4"),"isFav":false],["image":#imageLiteral(resourceName: "img2"),"isFav":false]]

    var img_arr:[UIImage]=[#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "forest")]
    var count=0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgGallery.image=img_arr.first
    }
    
    @IBAction func btnUploadClick(_ sender: Any) {
        
        
    }
    @IBAction func btnPrevClick(_ sender: Any) {
       if count == img_arr.count {
        count=img_arr.count-2
       }
        if count >= 0 && count < img_arr.count{
            imgGallery.image=img_arr[count]
            count-=1
        }
        print(count)
    }
    
    @IBAction func btnFavClick(_ sender: Any) {
        
        
    }
    
    @IBAction func btnNectClick(_ sender: Any) {
        if count == -1{
            count=1
        }
        if count < img_arr.count {
            imgGallery.image=img_arr[count]
            count+=1
        }
        
         print(count)
    }
    
}

