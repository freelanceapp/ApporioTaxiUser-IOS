//
//  CreateDemoDriverViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 26/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class CreateDemoDriverViewController: BaseViewController {
    
    
    
    @IBOutlet weak var innerview: UIView!
    
  
  //  var logindata : SignupLoginResponse!

    var drivername = ""
    var driverphone = ""
    
    @IBOutlet weak var enterdrivername: UITextField!
    
    @IBOutlet weak var enterdriveremailphone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        innerview.layer.cornerRadius = 5
        innerview.clipsToBounds = true
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
       
        self.dismissVC()
    }
    
    @IBAction func okbtn_click(_ sender: Any) {
        
        drivername = enterdrivername.text!
        driverphone = enterdriveremailphone.text!
        
        
       
        
        
        let dic1 = ["name": drivername,
                    "unique_number": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER),
                    "email": driverphone,
                    "phone":driverphone,
                    
                    
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERDEMOUSER
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: AccessTokenModel.self)
        
        
     
        
    }
    
    @IBAction func Skipbtn_click(_ sender: Any) {
        
        drivername = enterdrivername.text!
        driverphone = enterdriveremailphone.text!
        
        
        
        
        
        let dic1 = ["name": drivername,
                    "unique_number": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER),
                    "email": driverphone,
                    "phone":driverphone,
                   
            
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERDEMOUSER
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: AccessTokenModel.self)
        
  
       
    }
    
    
  
}


extension CreateDemoDriverViewController: ApiResponseReceiver {
    
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
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
    
    
    
    
    
}
