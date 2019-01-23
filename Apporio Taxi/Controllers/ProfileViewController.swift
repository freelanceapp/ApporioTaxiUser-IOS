//
//  ProfileViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 26/05/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileViewController: BaseViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
   
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var ueremail: UITextField!
    
    @IBOutlet weak var userimage: UIImageView!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    @IBOutlet weak var mobiletextlbl: UILabel!
    
    @IBOutlet weak var edittextlbl: UILabel!
    @IBOutlet weak var changepasswordtext: UILabel!
    
    @IBOutlet var lblAccountInfo: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblEmailDesc: UILabel!
  //  @IBOutlet var lblVerified: UILabel!
  //  @IBOutlet var lblSignOut: UILabel!
    @IBOutlet var btnDone: UIButton!
    @IBOutlet var lblYourAccount: UILabel!
    
    var imagearray: [Data] = []
    
    var imagestring: [String] = []
    
    
    var getusername = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.NAME)
    
    var getuserphone = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.MOBILE_NUMBER)
    
    var getuseremail = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.EMAIL_ID)
    
    var getuserpassword = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PASSWORD)
    
    var getuserimage = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.USER_IMAGE)

    
    var editname = ""
    
    var editemail = ""
    
    var edituserimage = ""
    
    
   // @IBOutlet weak var username: UILabel!
    
   // @IBOutlet weak var useremail: UILabel!
    
    @IBOutlet weak var usermobile: UILabel!
    
  
    
    
    func viewSetup(){
        
        lblAccountInfo.text = "Name".localized
        lblUserName.text = "User Email".localized
        lblEmailDesc.text = "This email can be used in future for getting your proper order tracking and invocing of your order".localized
        mobiletextlbl.text = "mobile".localized
        changepasswordtext.text = "Change Password".localized
        edittextlbl.text = "Edit".localized
       // lblVerified.text = "Verified".localized
       // lblSignOut.text = "SignOut".localized
        lblYourAccount.text = "YOUR ACCOUNT".localized
        btnDone.setTitle("DONE".localized, for: UIControlState.normal)
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewSetup()
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ProfileViewController.imageTapped(_:)))
        userimage.isUserInteractionEnabled = true
        userimage.addGestureRecognizer(tapGestureRecognizer)
        
        userimage.layer.cornerRadius =  userimage.frame.width/2
        userimage.clipsToBounds = true
        userimage.layer.borderWidth = 1
        userimage.layer.borderColor = UIColor.black.cgColor
        

        
        
        if getuserimage != ""{



            edituserimage = getuserimage

            
            AppConstants.downloadimage(imagename: getuserimage, imageview: userimage, placeholderimage: "profileeee")


         
        }else{




            userimage.image = UIImage(named: "profileeee") as UIImage?

        }
        
        editname = getusername

       editemail = getuseremail
        self.ueremail.text! = getuseremail
        self.username.text! = getusername

       self.usermobile.text! = getuserphone
        
        self.passwordtextfield.text! = getuserpassword
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        if GlobalVarible.checkphonenumber == 1{
//
//             self.usermobile.text! = GlobalVarible.enteruserphonenumber
//
//            GlobalVarible.checkphonenumber = 0
//
//        }else{
//
//        }
        
    }
    
    
    
    
    @IBAction func changepasswordbtn(_ sender: Any) {
        self.presentVC("ChangePasswordViewController")
    }
    

    
    
    @objc func imageTapped(_ img: AnyObject)
    {
        let alertView = UIAlertController(title: "Select Option".localized, message: "", preferredStyle: .alert)
        let Camerabutton = UIAlertAction(title: "Camera".localized, style: .default, handler: { (alert) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            
            
            
            
        })
        let Gallerybutton = UIAlertAction(title: "Gallery".localized, style: .default, handler: { (alert) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
                print("Button capture")
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
                imagePicker.allowsEditing = false
                
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                                         style: .cancel, handler: nil)
        alertView.addAction(Camerabutton)
        alertView.addAction(Gallerybutton)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imagearray.removeAll()
            imagestring.removeAll()
            
            userimage.image = pickedImage
            
            let imageData = UIImageJPEGRepresentation(userimage.image!, 0.5)
            
            imagearray.append(imageData!)
            imagestring.append("profile_image")
            
           
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func editphonebtn_click(_ sender: Any) {
        
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
//        verifyViewController.matchString = ""
//        self.present(verifyViewController, animated:true, completion:nil)
        

    }
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donebtn_click(_ sender: Any) {
        
        editname = username.text!
        
        editemail = ueremail.text!
        
               
        if editemail == ""{
        self.showErrorAlert("", alertMessage: "Please enter email first.".localized, VC: self)
         
        
        }else{
        
           
            
            let dic1 = ["name":editname as AnyObject,
                        "email": editemail as AnyObject,
                        "phone":getuserphone
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USEREDITPROFILE
            ServiceManager.sharedInstance.delegate = self
             ServiceManager.sharedInstance.requestPostWithImageParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, imagesData: imagearray, imageParamName: imagestring, returningClass: UserLoginModel.self)
          //  ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: dic, returningClass: UserLoginModel.self)
            
            

        

        }
        
       
        
    }
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}


extension ProfileViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        
        if let responseData = response as? UserLoginModel{
            
            let data:UserLoginModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey((data.data!.email)!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userPhone)!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userName)!, key: AppConstants.UserDefaultKeys.NAME)
                
                 UserDefaultUtility.saveStringWithKey((data.data!.userprofileimage)!, key: AppConstants.UserDefaultKeys.USER_IMAGE)
                
                UserDefaultUtility.saveStringWithKey((data.data!.password)!, key: AppConstants.UserDefaultKeys.PASSWORD)
                
                
                
                
                let alert = UIAlertController(title: NSLocalizedString("", comment: ""), message: data.message, preferredStyle: .alert)
                let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                    self.dismissVC()
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
    
}

