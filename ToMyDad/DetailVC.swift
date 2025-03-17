//
//  DetailVC.swift
//  ToMyDad
//
//  Created by Arda Çakmak on 16.03.2025.
//

import UIKit

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var dTitle: UITextField!
    @IBOutlet weak var dShortDesc: UITextField!
    @IBOutlet weak var selectImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSelectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
   
    @IBAction func btnSave(_ sender: Any) {
        
        let title = dTitle.text ?? ""
        let shortDesc = dShortDesc.text ?? ""
        
        if let imageData = selectImage.image?.jpegData(compressionQuality: 1) {
            DatabaseHelper.shareInstance.save(title: title, shortdescription: shortDesc, image: imageData)
        }
        
        _ =  navigationController?.popViewController(animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        
        selectImage.image = userPickedImage
        
        picker.dismiss(animated: true)
        
    }
    
}
