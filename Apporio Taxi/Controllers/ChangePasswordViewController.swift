//
//  ChangePasswordViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ObjectMapper

class ChangePasswordViewController: BaseViewController {
    
    @IBOutlet weak var innerview: UIView!
    
    var oldPwd: String = ""
    var newPwd: String = ""
    var cnfrmPwd: String = ""
    
    @IBOutlet weak var confirm_pwd_field: SkyFloatingLabelTextField!
    @IBOutlet weak var old_pwd_field: SkyFloatingLabelTextField!
    
    @IBOutlet weak var donebtn: UIButton!
    @IBOutlet weak var topchangepasswordtextlbl: UILabel!
    
    @IBOutlet weak var new_pwd_field: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topchangepasswordtextlbl.text = "Change Password".localized
        old_pwd_field.placeholder = "Old Password".localized
        new_pwd_field.placeholder = "New Password".localized
        confirm_pwd_field.placeholder = "Confirm Password".localized
        donebtn.setTitle("DONE".localized, for: UIControlState.normal)
        
        confirm_pwd_field.selectedTitleColor = UIColor.appThemeColor()
        confirm_pwd_field.selectedLineColor = UIColor.clear
        
        
        old_pwd_field.selectedTitleColor = UIColor.appThemeColor()
        old_pwd_field.selectedLineColor = UIColor.clear
        
        
        new_pwd_field.selectedTitleColor = UIColor.appThemeColor()
        new_pwd_field.selectedLineColor = UIColor.clear
        
        
        
        donebtn.edgeWithOutShadow(edge: 8.0)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func Donebtn(_ sender: Any) {
        
        oldPwd = old_pwd_field.text!
        newPwd = new_pwd_field.text!
        cnfrmPwd = confirm_pwd_field.text!
        
        if (newPwd == cnfrmPwd){
            
            
            
            let dic1 = ["old_password":oldPwd,
                       "new_password": newPwd
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHANGEPASSWORD
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserLoginModel.self)
            
            

            
        }else{
            self.showErrorAlert("", alertMessage: "Password Does Not Match".localized, VC: self)
           
        }
        
        
        
    }
    

}


extension ChangePasswordViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        
        if let responseData = response as? UserLoginModel{
            
            let data:UserLoginModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.saveStringWithKey((data.data!.email)!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userPhone)!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userName)!, key: AppConstants.UserDefaultKeys.NAME)
                
                
                UserDefaultUtility.saveStringWithKey((data.data!.password)!, key: AppConstants.UserDefaultKeys.PASSWORD)
                
                 UserDefaultUtility.saveStringWithKey((data.data!.userprofileimage)!, key: AppConstants.UserDefaultKeys.USER_IMAGE)
                
            
            
                
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
