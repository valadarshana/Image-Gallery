//
//  ViewController2.swift
//  Image Gallery
//
//  Created by Vijay Parmar on 27/09/20.
//  Copyright © 2020 WD. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var btn_heart: UIButton!
    
    @IBOutlet weak var imgGallery: UIImageView!
    
  
    var dict_img =  [["Image":#imageLiteral(resourceName: "img2"),"isFav":false],
           ["Image":#imageLiteral(resourceName: "img3"),"isFav":false],
           ["Image":#imageLiteral(resourceName: "img1"),"isFav":false],
           ["Image":#imageLiteral(resourceName: "forest"),"isFav":false]]
    var count=0
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let leftswiper = UISwipeGestureRecognizer(target: self, action: #selector(handleswipes (_:)))
        let rightswiper = UISwipeGestureRecognizer(target: self, action: #selector(handleswipes (_:)))
        leftswiper.direction = .left
        rightswiper.direction = .right
        view.addGestureRecognizer(leftswiper)
        view.addGestureRecognizer(rightswiper)
        
        imagePicker.delegate = self
        imgGallery.image=(dict_img.first!["Image"]as! UIImage)
    }
    @objc func handleswipes(_ sender:UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
            if count < dict_img.count-1{
                count += 1
                 setimg()
            }
            

        }
        if sender.direction == .right
        {
            if count > 0{
                count -= 1
                 setimg()
            }
        }
    }
    @IBAction func btnUploadClick(_ sender: Any) {
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func btnPrevClick(_ sender: Any) {
        
        if count > 0{
            count -= 1
             setimg()
        }
        
        
    }
    
    @IBAction func btnNectClick(_ sender: Any) {
           if count < dict_img.count-1{
               count += 1
                setimg()
           }
           
       }
    
    @IBAction func btnFavClick(_ sender: Any) {
         dict_img[count]["isFav"] = !(dict_img[count]["isFav"]as! Bool)
         setimg()
    }
    
    //Set Image
    func setimg()
    {
        imgGallery.image=(dict_img[count]["Image"]as! UIImage)
        if (dict_img[count]["isFav"]as! Bool)
        {
            btn_heart.setImage(UIImage(named: "heartfill"), for: .normal)
        }else{
            btn_heart.setImage(UIImage(named: "heartempty"), for: .normal)
        }
    }
    
   //Image Picker Delegate
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
//         let selectedImage : UIImage = image
//
//         print("Image Selected")
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image Selected")
      
        if (info[.originalImage] as? UIImage) != nil {
            let image = (info[.originalImage] as? UIImage)
            
            dict_img.append(["Image":image!,"isFav":false])
            count = dict_img.count - 1
            setimg()
            
        } else {
            print("Other source")
        }

        self.dismiss(animated: true, completion: nil)
    }
}

