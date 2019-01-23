//
//  ForgotPasswordViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var changepasswordtextlbl: UILabel!
    
   
    @IBOutlet weak var newpasswordtext: SkyFloatingLabelTextField!
    
   // @IBOutlet weak var confirmpasswordtext: UITextField!
    
    @IBOutlet weak var donebtntext: UIButton!
    
    
    @IBOutlet weak var confirmpasswordtext: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changepasswordtextlbl.text = "Change Password".localized
        newpasswordtext.placeholder = "New Password".localized
        confirmpasswordtext.placeholder = "Confirm Password".localized
        donebtntext.setTitle("Done".localized, for: UIControlState.normal)
        
        newpasswordtext.selectedTitleColor = UIColor.appThemeColor()
        newpasswordtext.selectedLineColor = UIColor.clear
        
        confirmpasswordtext.selectedTitleColor = UIColor.appThemeColor()
        confirmpasswordtext.selectedLineColor = UIColor.clear
        
        donebtntext.edgeWithOutShadow(edge: 8.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dobebtnclick(_ sender: Any) {
        
        if self.newpasswordtext.text!.count < 6
        {
            
            self.showErrorAlert("", alertMessage: "Password Shoud Not Be Less Then 6".localized, VC: self)
           
            return
        }
        
        
        if self.newpasswordtext.text!  != self.confirmpasswordtext.text! {
            
            self.showErrorAlert("", alertMessage: "Password Does Not Match".localized, VC: self)
           
            return
        }
        
        
        
        let dic1 = ["password": self.newpasswordtext.text!,
                    "phone":AppConstants.enteruserphonenumber,
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERFORGOTPASSWORD
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: UserLoginModel.self)
        
        
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        self.dismissVC()
    }
    
}

extension ForgotPasswordViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? UserLoginModel{
            let data:UserLoginModel = responseData
            
          
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
             
                UserDefaultUtility.saveStringWithKey((data.data!.email)!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userPhone)!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userName)!, key: AppConstants.UserDefaultKeys.NAME)
                
                 //UserDefaultUtility.saveStringWithKey((data.data!.userprofileimage)!, key: AppConstants.UserDefaultKeys.USER_IMAGE)
                UserDefaultUtility.saveStringWithKey((data.data!.password)!, key: AppConstants.UserDefaultKeys.PASSWORD)
                
                
                self.presentVC("LoginViewController")
                
                
            } else {
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
       
    }
    
    
    
}
