//
//  ViewController.swift
//  DSPhotoEditorSDKSampleSwift
//
//  Copyright © 2017 DS Photo Editor. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, DSPhotoEditorViewControllerDelegate {

    @IBOutlet weak var outputImageView: UIImageView!
    
    @IBAction func launchDSPhotoEditor(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        /**
         This is a testing api key ONLY for this sample code;
         In your app, you should replace this with the production api key obtained from https://developer.dsphotoeditor.com/login
         
         You can also pass in an array to hide the tools you don't want:
         let toolsToHide = [TOOL_ORIENTATION, TOOL_PIXELATE]
         **/
        let dsPhotoEditorViewController = DSPhotoEditorViewController(image: image, apiKey: "ed43b3c9d00f5e57e1e1ccccbd543cc2da772f4f", toolsToHide:[TOOL_PIXELATE]);
        dsPhotoEditorViewController!.delegate = self
        picker.present(dsPhotoEditorViewController!, animated: true, completion: nil)
    }
    
    func dsPhotoEditor(_ editor: DSPhotoEditorViewController!, finishedWith image: UIImage!) {
        self.dismiss(animated: true, completion: nil)

        self.outputImageView.image = image;
    }
    
    func dsPhotoEditorCanceled(_ editor: DSPhotoEditorViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

