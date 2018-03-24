//
//  photoFilterViewController.swift
//  Udaan18
//
//  Created by Admin on 24/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit
import CoreImage

class photoFilterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var filters = ["CISepiaTone","CIExposureAdjust","CIColorCrossPolynomial","CIColorInvert","CIColorPosterize","CIFalseColor","CIMinimumComponent","CIPhotoEffectChrome"]
    var filtersAttr:[Dictionary<String,Any>] = [[:],[kCIInputEVKey:1],["inputRedCoefficients":CIVector(values: [1,0,1,0.5,1,0,0,0.5,0.7,1], count: 10) ,"inputGreenCoefficients":CIVector(values: [0,0,1,0.5,0,0.5,0,0.5,0.3,0], count: 10),"inputBlueCoefficients":CIVector(values: [0,1,0.5,0.5,0,0,0.5,0.5,0.7,1], count: 10)],[:],[:],[:],[:],[:]]
    var images:UIImage?{
        didSet{
            image.image = images
            CIVector(values: [1,0,1,0.5,1,0,0,0.5,0.7,1], count: 10)
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
            cell.filterImage.image = applyFilter(index: indexPath.row-1, img: imagee)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\n\n\(indexPath.row)\n\n")
        if indexPath.row == 0{
            image.image = images
        }
        else{
            image.image = applyFilter(index: indexPath.row-1, img: images)
        }
    }
    var filteredImage:UIImage?
    @IBOutlet var filterCollectionView: UICollectionView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var camera: UIButton!
    @IBOutlet var galery: UIButton!
    @IBOutlet var upload: UIButton!
    @IBAction func cameraAction(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }

    @IBAction func galeryAction(_ sender: UIButton) {
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
        
        let filter = CIFilter(name: filters[index])
        filter?.setDefaults()
        for key in filtersAttr[index].keys {
            filter?.setValue(filtersAttr[index][key], forKey: key)
        }
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        
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
    @IBAction func uploadAction(_ sender: UIButton) {
        /*let vc = UIActivityViewController(activityItems: [filteredImage], applicationActivities: [])
            present(vc,animated: true,completion: nil)
            vc.popoverPresentationController?.sourceView = self.view
            vc.completionWithItemsHandler = {(activity, success, items, error) in
                print(success)
                print(activity)
            */
                
                
                let imageToShare = [image.image]
                let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                self.present(activityViewController, animated: true, completion: nil)
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
