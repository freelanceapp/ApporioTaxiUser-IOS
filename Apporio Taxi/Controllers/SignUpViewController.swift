//
//  SignUpViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!//460
    @IBOutlet weak var genderviewheight: NSLayoutConstraint!//45
    @IBOutlet weak var genderview: UIView!
    
    
    var gendervalue = "1"
    @IBOutlet weak var femaletextlbl: UILabel!
    
    @IBOutlet weak var femaleimageview: UIImageView!
    @IBOutlet weak var maletextlbl: UILabel!
    
    @IBOutlet weak var maleimageview: UIImageView!
    @IBOutlet weak var gendertextlbl: UILabel!
    @IBOutlet weak var passwordtext: SkyFloatingLabelTextField!
    @IBOutlet weak var firstnametext: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailtext: SkyFloatingLabelTextField!
    
    @IBOutlet weak var refferalcodetext: SkyFloatingLabelTextField!
    //@IBOutlet weak var firstnametext: UITextField!
    
    @IBOutlet weak var enterphonebtntext: UIButton!
  //  @IBOutlet weak var refferalcodetext: UITextField!
   // @IBOutlet weak var emailtext: UITextField!
  //  @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var topregustertextlbl: UILabel!
    
    @IBOutlet weak var continuebtntext: UIButton!
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var backgroundimageview: UIImageView!
    
    var emailValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topregustertextlbl.text = "Register".localized
        firstnametext.placeholder = "Your Name".localized
        emailtext.placeholder = "Enter Email".localized
        enterphonebtntext.setTitle("Enter Phone".localized, for: UIControlState.normal)
        passwordtext.placeholder = "Create Password".localized
        refferalcodetext.placeholder = "Enter Referral Code(if any)".localized
        gendertextlbl.text = "Gender".localized
        maletextlbl.text = "Male".localized
        femaletextlbl.text = "Female".localized
        continuebtntext.setTitle("Continue".localized, for: UIControlState.normal)
        
        
        
        if AppConstants.userconfiguredata.data?.gender == "1"{
            genderview.isHidden = false
            genderviewheight.constant = 45.0
            innerviewheight.constant = 460.0
        }else{
             genderview.isHidden = true
            genderviewheight.constant = 0.0
            innerviewheight.constant = 410.0
            
        }
        gendervalue = "1"
        maleimageview.image = UIImage(named: "Circled Dot-35 (1)")
        femaleimageview.image = UIImage(named: "Circle Thin-35 (1)")
        
        firstnametext.selectedTitleColor = UIColor.appThemeColor()
        firstnametext.selectedLineColor = UIColor.clear
        
        passwordtext.selectedTitleColor = UIColor.appThemeColor()
        passwordtext.selectedLineColor = UIColor.clear
        
        emailtext.selectedTitleColor = UIColor.appThemeColor()
        emailtext.selectedLineColor = UIColor.clear
        
        refferalcodetext.selectedTitleColor = UIColor.appThemeColor()
        refferalcodetext.selectedLineColor = UIColor.clear
        
        continuebtntext.edgeWithOutShadow(edge: 8.0)
        
        innerview.edgeWithOutShadow(edge: 8.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func malebtnclick(_ sender: Any) {
        gendervalue = "1"
        maleimageview.image = UIImage(named: "Circled Dot-35 (1)")
        femaleimageview.image = UIImage(named: "Circle Thin-35 (1)")
        
    }
    
    @IBAction func femalebtnclick(_ sender: Any) {
        gendervalue = "2"
        maleimageview.image = UIImage(named: "Circle Thin-35 (1)")
        femaleimageview.image = UIImage(named: "Circled Dot-35 (1)")
    }
    
        override func viewWillAppear(_ animated: Bool) {
            
            if AppConstants.checkphonenumber == 1{
                
                self.enterphonebtntext.setTitle(AppConstants.enteruserphonenumber, for: .normal)
                self.enterphonebtntext.setTitleColor(UIColor.black, for: .normal)
                AppConstants.checkphonenumber = 0
                
            }else{
                
            }
            
        }
    
    
    @IBAction func enterphonebtnclick(_ sender: Any) {
         AppConstants.comefromforgetscreen = ""
        self.presentVC("VerifyPhoneViewController")
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func continuebtnclick(_ sender: Any) {
        
        
        let enteredEmail = self.emailtext.text!
        
        if enteredEmail.isEmail{
            
            self.emailValid=true
            
            
        }else{
            
            self.emailValid=false
            
            
        }
        
        
     
        
        
        
        if (self.firstnametext.text?.count)! < 2 {
            self.showErrorAlert("", alertMessage: "Please Enter  Name".localized, VC: self)
           
            return
        }
        
      
        
        if self.enterphonebtntext.currentTitle == "Enter Phone".localized{
           
             self.showErrorAlert("", alertMessage: "Please Enter Mobile Number First".localized, VC: self)
           
            return
        }
        
        
        if (self.passwordtext.text?.count)! < 6 {
            self.showErrorAlert("", alertMessage: "Password  length should not be less then 6".localized, VC: self)
           
            return
        }
        
        
        
        
      
        if self.emailValid {
            
           
            
            let dic1 = ["name": firstnametext.text!,
                        "phone":AppConstants.enteruserphonenumber,
                        "email": emailtext.text!,
                        "password": passwordtext.text!,
                        "user_gender": gendervalue
                        
                        ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERSIGNUP
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: AccessTokenModel.self)
           
        }else{
            self.showErrorAlert("", alertMessage: "Please fill email properly.".localized, VC: self)
           
        }
        //  ApiController.sharedI
        
        
    }
    
}


extension SignUpViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? AccessTokenModel{
            let data:AccessTokenModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                UserDefaultUtility.saveStringWithKey((data.data?.accessToken)!, key: AppConstants.UserDefaultKeys.CLIENT_ID)
                
                AppConstants.dicauthorization = ["Accept":"application/json",
                                                 "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                 "locale":AppConstants.languagecode
                    
                    ] as [String : AnyObject]
                
                
               
                
                
                let dic1 = ["unique_no": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER),
                            "package_name":AppConstants.appbundleid,
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERDETAILS
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserLoginModel.self)
                
                
            } else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        
        if let responseData = response as? UserLoginModel{
            let data:UserLoginModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                
                UserDefaultUtility.saveStringWithKey((data.data!.email)!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userPhone)!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userName)!, key: AppConstants.UserDefaultKeys.NAME)
                
                
                UserDefaultUtility.saveStringWithKey((data.data!.password)!, key: AppConstants.UserDefaultKeys.PASSWORD)
                
                 UserDefaultUtility.saveStringWithKey((data.data!.userprofileimage)!, key: AppConstants.UserDefaultKeys.USER_IMAGE)
                UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
                
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: MapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
                
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
