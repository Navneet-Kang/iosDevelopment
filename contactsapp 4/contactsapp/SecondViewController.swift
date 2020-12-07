//
//  SecondViewController.swift
//  contactsapp
//
//  Created by Navneet Kang on 11/30/20.
//  Copyright © 2020  All rights reserved.
//

import UIKit
import CoreData

protocol DataUpdateDelegate: AnyObject {
    func updateContacts()
}


class SecondViewController: UIViewController {
    
    weak var delegate: DataUpdateDelegate?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func imagePickerAction(_ sender: Any) {

        let alertController = UIAlertController(title: "Image", message:
            "Select your proile image", preferredStyle: .actionSheet)
        let cameraRollAction = UIAlertAction(title: "Take a picture from Photos", style: .default) { (action) in
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(cameraRollAction)

        let takePictureAction = UIAlertAction(title: "Camera Roll", style: .default) { (action) in
            
            if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
                self.presentAlert(withTitle: "Info!", message: "Camera is not available")
            } else {
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.imagePicker.cameraCaptureMode = .photo
            self.present(self.imagePicker,
                animated: true,
                completion: nil)
            }
        }
        alertController.addAction(takePictureAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)

    }
    @IBAction func saveAction(_ sender: UIButton) {
        
        guard let name1 = self.nameText.text, name1 != "" else {
            print("Empty")
            self.presentAlert(withTitle: "Info!", message: "Name is empty")
            return
        }
        guard let number1 = self.numberText.text, number1 != "" else {
            self.presentAlert(withTitle: "Info!", message: "no is empty")
            return
        }
        guard let btnImag = imagePickerButton.backgroundImage(for: .normal) else {
            imagePickerButton.setTitle("Select Image", for: .normal)
            self.presentAlert(withTitle: "Info!", message: "select your profile image")
            return
        }
        self.save(name: name1, number: number1)
    }
    
    override func viewDidLoad() {
        imagePickerButton.backgroundColor = .clear
        imagePickerButton.layer.cornerRadius = 10
        imagePickerButton.layer.borderWidth = 1
        imagePickerButton.layer.borderWidth = 1
        imagePickerButton.layer.borderColor = UIColor.gray.cgColor
        imagePickerButton.setTitle("Select Image", for: .normal)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return  appDelegate.persistentContainer.viewContext
    }
    
    func save(name: String, number: String) {
        let managedContext = getContext()
        let entity =
            NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(name, forKey: "name")
        person.setValue(number, forKey: "number")
        person.setValue(false, forKey: "favorite")
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
            delegate?.updateContacts()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func checkImage() {
        guard let btnImag = imagePickerButton.backgroundImage(for: .normal) else {
            imagePickerButton.setTitle("Select Image", for: .normal)
            return
        }
    }
}
extension SecondViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            imagePickerButton.setBackgroundImage(pickerImage, for: .normal)
            imagePickerButton.setTitle("", for: .normal)
        }
        self.dismiss(animated: true, completion: nil)
        checkImage()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        self.dismiss(animated: true, completion: nil)
        checkImage()
    }
}
