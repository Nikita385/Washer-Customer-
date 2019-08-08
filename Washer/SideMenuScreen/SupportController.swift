//
//  SupportController.swift
//  Washer
//
//  Created by Excelsior Technologies on 01/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit

class SupportController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate

{
    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfDescription: UITextView!
    @IBOutlet weak var btnUploadImage: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet var imageView: UIImageView!

    var activeField : UITextField!
    let imagePicker = UIImagePickerController()
    var imageDataStr = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        tfUserId.delegate = self
        tfEmail.delegate = self
        tfDescription.delegate = self
        tfDescription.text = "Enter Inquiry Description"
        tfDescription.textColor = UIColor.lightGray
        tfDescription.font = UIFont(name: "Montserrat-Regular", size: 17)
        tfDescription.returnKeyType = .done
        tfDescription.layer.cornerRadius = 5
        
        self.title="HELP & SUPPORT"
        navigationController?.navigationBar.barTintColor = UIColor(named: "Primary")
        
    }
    
    
    @IBAction func onbtnUploadImgClicked()
    {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        //btnUploadImage.setImage(nil, for: [])
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //imageView.contentMode = .scaleToFill
            imageView.image = pickedImage
            btnUploadImage.setImage(nil, for: [])
            
            let imageData:NSData = pickedImage.pngData()! as NSData
            imageDataStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            //print(imageStr)
            
            //            let imgData = NSData(data: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).jpegData(compressionQuality: 1)!)
            //            var imageSize: Int = imgData.count
            //            print("actual size of image in KB: %f ", Double(imageSize) / 1000.0)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tfDescription.text == "Enter Inquiry Description"
        {
            tfDescription.text = ""
            tfDescription.textColor = UIColor.black
            tfDescription.font = UIFont(name: "Montserrat-Regular", size: 17)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""
        {
            tfDescription.text = "Enter Inquiry Description"
            tfDescription.textColor = UIColor.lightGray
            tfDescription.font = UIFont(name: "Montserrat-Regular", size: 17)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            textView.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func tap_SideMenu(_ sender: Any) {
        sideMenuController?.revealMenu()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
