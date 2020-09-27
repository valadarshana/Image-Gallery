//
//  ViewController2.swift
//  Image Gallery
//
//  Created by Vijay Parmar on 27/09/20.
//  Copyright © 2020 WD. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var btn_heart: UIButton!
    
    @IBOutlet weak var imgGallery: UIImageView!
    
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
        
        if count > 0{
            count -= 1
             imgGallery.image=img_arr[count]
        }
        
        
    }
    
    @IBAction func btnNectClick(_ sender: Any) {
           if count < img_arr.count-1{
               count += 1
                 imgGallery.image=img_arr[count]
           }
           
       }
    
    @IBAction func btnFavClick(_ sender: Any) {
        
        
    }
    
   
    
}

