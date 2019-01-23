//
//  SignUpwithgoogleViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SignUpwithgoogleViewController: BaseViewController {
    
    @IBOutlet weak var backgroundimageview: UIImageView!
    
    @IBOutlet weak var topregistertextlbl: UILabel!
    
    @IBOutlet weak var containerview: UIView!
    
    @IBOutlet weak var registerbtntext: UIButton!
    
    @IBOutlet weak var enterphonetext: UIButton!
    
    @IBOutlet weak var userimageview: UIImageView!
    
    @IBOutlet weak var usernametext: UILabel!
    
    @IBOutlet weak var useremailtext: UILabel!
    
    @IBOutlet weak var attachyourphonetext: UILabel!
    
    
    var googleFirstName = ""
    var googleLastName = ""
    
    var googleId = ""
    var googleMail = ""
    var googleImage = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topregistertextlbl.text = "Register".localized
        registerbtntext.setTitle("Register".localized, for: UIControlState.normal)
        attachyourphonetext.text = "Attach Your Phone number if you want to remember your account easilty.".localized
        enterphonetext.setTitle("Enter Phone".localized, for: UIControlState.normal)
        
        
        userimageview.makeViewCircular()
        
        containerview.edgeWithShadow(edge: 8.0)
        
        if(googleImage == ""){
            userimageview.image = UIImage(named: "profileeee") as UIImage?
            
            print("No Image")
        }else{
            let newUrl = googleImage
            // let url = "http://apporio.co.uk/apporiotaxi/\(drivertypeimage!)"
            print(newUrl)
            
            let url1 = NSURL(string: newUrl)
            
            
            userimageview!.af_setImage(withURL:
                url1! as URL,
                                       placeholderImage: UIImage(named: "dress"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(1.0))
            
        }
        
        
        self.usernametext.text = googleFirstName
        self.useremailtext.text = googleMail

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if AppConstants.checkphonenumber == 1{
            
            self.enterphonetext.setTitle(AppConstants.enteruserphonenumber, for: .normal)
            self.enterphonetext.setTitleColor(UIColor.black, for: .normal)
            AppConstants.checkphonenumber = 0
            
        }else{
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func enterphonebtnclick(_ sender: Any) {
        
        AppConstants.comefromforgetscreen = ""
        self.presentVC("VerifyPhoneViewController")
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        self.dismissVC()
    }
    
    @IBAction func registerbtnclick(_ sender: Any) {
        
        if self.enterphonetext.currentTitle == "Enter Phone".localized{
            
            self.showErrorAlert("", alertMessage: "Please Enter Mobile Number First".localized, VC: self)
            
            
            return
        }
        
        
        
        let dic1 = ["social_id": googleId,
            "platfrom": "1",
            "name":googleFirstName,
            "phone":AppConstants.enteruserphonenumber,
            "email":googleMail
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERSOCIALSIGNUP
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: AccessTokenModel.self)
        
        
        
    }
    
}



extension SignUpwithgoogleViewController: ApiResponseReceiver {
    
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
                    showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
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



