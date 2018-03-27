//
//  photoFilterViewController.swift
//  Udaan18
//
//  Created by Admin on 24/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit
import CoreImage
import CoreGraphics

class photoFilterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    var filters = [/*"CISepiaTone","CIExposureAdjust","CIColorCrossPolynomial","CIColorInvert","CIColorPosterize","CIFalseColor","CIMinimumComponent","CIPhotoEffectChrome",*/"CISourceOverCompositing","CISourceOverCompositing"]
    var filtersAttr:[Dictionary<String,Any>] = [/*[:],[kCIInputEVKey:1],["inputRedCoefficients":CIVector(values: [1,0,1,0.5,1,0,0,0.5,0.7,1], count: 10) ,"inputGreenCoefficients":CIVector(values: [0,0,1,0.5,0,0.5,0,0.5,0.3,0], count: 10),"inputBlueCoefficients":CIVector(values: [0,1,0.5,0.5,0,0,0.5,0.5,0.7,1], count: 10)],[:],[:],[:],[:],[:],*/["inputBackgroundImage":UIImage(named: "udaan_wing")],["inputBackgroundImage":UIImage(named: "Udaan_Filter")]]
    var fv:UIImageView?
    var scale = CGFloat(0.0)
    
    var images:UIImage?{
        didSet{
            image.image = images
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (filters.count+1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filtercell", for: indexPath) as! filterCollectionViewCell
        let imagee = UIImage(named: "filters")
        if indexPath.row == 0{
            cell.filterImage.image = imagee
        }
        else{
            cell.filterImage.image = filtersAttr[indexPath.row-1]["inputBackgroundImage"] as! UIImage//applyFilter(index: indexPath.row-1, img: imagee)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\n\n\(indexPath.row)\n\n")
        if indexPath.row == 0{
            
            
            
            scale = scale + 0.3
            
            fv?.transform = CGAffineTransform.init(scaleX: scale+0.2, y: scale+0.2)
            fv?.transform = CGAffineTransform.init(rotationAngle: scale)
            //image.image = images
        }
        else{
            //image.image = applyFilter(index: indexPath.row-1, img: images)
            fv?.removeFromSuperview()
            fv  = UIImageView(image: filtersAttr[indexPath.row-1]["inputBackgroundImage"] as! UIImage)
            fv?.transform = CGAffineTransform.init(scaleX: 0.3, y: 0.3)
            fv?.center = image.center
            print(image.subviews)
            
            image.addSubview(fv!)
            print(image.subviews)
            fv?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            
        }
    }
    var filteredImage:UIImage?
    @IBOutlet var filterCollectionView: UICollectionView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var camera: UIButton!
    @IBOutlet var galery: UIButton!
    @IBOutlet var upload: UIButton!
    @IBAction func cameraAction(act:UIAlertAction) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }
    @IBAction func addImage(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "Add Image", message: nil, preferredStyle: .alert)
        
            let act1 = UIAlertAction(title: "Camera", style: .default, handler: cameraAction)
            alert.addAction(act1)
            let act2 = UIAlertAction(title: "Galery", style: .default, handler: galeryAction)
            alert.addAction(act2)
        
        alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func galeryAction(act:UIAlertAction) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        images = info[UIImagePickerControllerOriginalImage] as! UIImage
        dismiss(animated: true, completion: nil)
        
    }
    func applyFilter(index:Int,img:UIImage?)->UIImage?{
        guard let image1 = img, let cgimg = image1.cgImage else {
            print("imageView doesn't have an image!")
            return img
        }
        let openGLContext = EAGLContext(api: .openGLES2)
        let context = CIContext(eaglContext: openGLContext!)
        
        
        let coreImage = CIImage(cgImage: cgimg) //CIImage(CGImage: cgimg)
        
        
        print(" back image\n\(coreImage.extent)")
        var imgr:CIImage?
        for key in filtersAttr[index].keys {
            
           
            
 
 
            let openGLContexts = EAGLContext(api: .openGLES2)
            let contexts = CIContext(eaglContext: openGLContexts!)
            var im = filtersAttr[index][key] as! UIImage
            print(im.cgImage?.width)
            print("bpr")
            //let im = filtersAttr[index]["inputImage"] as! UIImage
            print(im.cgImage?.bytesPerRow)
           
            let size = im.size.applying(CGAffineTransform(scaleX: 2.0, y: 2.0))
            let hasAlpha = true
            // Automatically use scale factor of main screen
            let scale:CGFloat = 0.0
            UIGraphicsBeginImageContextWithOptions((img?.size)!, hasAlpha, scale)
            let cp = CGPoint(x: 0, y: (img?.size.height)!-im.size.height)
            //im.draw(at: <#T##CGPoint#>, blendMode: <#T##CGBlendMode#>, alpha: <#T##CGFloat#>)
            im.draw(in: CGRect(origin:  cp, size: (im.size)   ))
            im = UIGraphicsGetImageFromCurrentImageContext()!
            print(im.cgImage?.bytesPerRow)
            print(im.cgImage?.width)
            //let ci = CIImage(cgImage:(UIGraphicsGetImageFromCurrentImageContext()!.cgImage)!)
        
            UIGraphicsEndImageContext()
            
            
            
            
            
            
            let filter2 = CIFilter(name: "CIPerspectiveTransformWithExtent")
            //filter2?.setDefaults()
            filter2?.setValue(CIImage(cgImage:im.cgImage!), forKey: "inputImage")
            //let vc = kCIAttributeTypeRectangle
            filter2?.setValue(coreImage.extent, forKey: "inputExtent")
            filter2?.setValue(CIVector(values:[0.0,coreImage.extent.height],count:2), forKey: "inputTopLeft")
            filter2?.setValue(CIVector(values:[coreImage.extent.width
                ,coreImage.extent.height-100],count:2), forKey: "inputTopRight")
            filter2?.setValue(CIVector(values:[coreImage.extent.width,0.0],count:2), forKey: "inputBottomRight")
            filter2?.setValue(CIVector(values:[100,100],count:2), forKey: "inputBottomLeft")
            if let output = filter2?.value(forKey: kCIOutputImageKey) as? CIImage {
                print("applying first")
                
                let abc = contexts.createCGImage(output, from: output.extent)
                imgr = CIImage(cgImage:abc!)
                //let fm =  UIImage(cgImage: cgimgresult!)  //UIImage(CIImage: output)
                print("filter applied")
                print(" image\n\(imgr?.extent)")
                
                
            }
            else{
                
                print("filter 1 not working")
            }
            
            
            
        }
        
        /*
        if (index != 8) && (index != 9) {
            filter?.setValue(coreImage, forKey: kCIInputImageKey)
        }
        else{
            filter?.setValue(coreImage, forKey: "inputBackgroundImage")
        }*/
        let filter = CIFilter(name: filters[index])
        filter?.setValue(imgr, forKey: "inputImage")
        filter?.setDefaults()
        filter?.setValue(coreImage, forKey: "inputBackgroundImage")
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
            print("applying")
            let cgimgresult = context.createCGImage(output, from: output.extent)
            filteredImage =  UIImage(cgImage: cgimgresult!)  //UIImage(CIImage: output)
            print("filter applied")
            return filteredImage
        }
        else {
            print("image filtering failed")
            return img
        }
        
    }
    /*
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your filtered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }*/
    @IBAction func share(_ sender: UIBarButtonItem) {
        UIGraphicsBeginImageContextWithOptions(image.frame.size, true, 0.0)
        //view.layer.render(in: UIGraphicsGetCurrentContext()!)
        image.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imagesss = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        
        //image.image = imagesss
        //fv?.removeFromSuperview()
        //UIImageWriteToSavedPhotosAlbum(images!, nil, nil, nil)
        print("image saved")
        
        let imageToShare = [imagesss]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func uploadAction(_ sender: UIButton) {
        /*let vc = UIActivityViewController(activityItems: [filteredImage], applicationActivities: [])
            present(vc,animated: true,completion: nil)
            vc.popoverPresentationController?.sourceView = self.view
            vc.completionWithItemsHandler = {(activity, success, items, error) in
                print(success)
                print(activity)
            */
    UIGraphicsBeginImageContextWithOptions(image.frame.size, true, 0.0)
        //view.layer.render(in: UIGraphicsGetCurrentContext()!)
        image.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imagesss = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        
        image.image = imagesss
        fv?.removeFromSuperview()
        //UIImageWriteToSavedPhotosAlbum(images!, nil, nil, nil)
        print("image saved")
                
                let imageToShare = [imagesss]
                let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                self.present(activityViewController, animated: true, completion: nil)
       // UIGraphicsBeginImageContext(image.frame.size)
        
    }
    
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(filterCollectionView)
            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
