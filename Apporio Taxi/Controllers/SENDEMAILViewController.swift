//
//  SENDEMAILViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 26/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class SENDEMAILViewController: BaseViewController{
    
    
    @IBOutlet weak var enteremailtext: UITextField!
    
    @IBOutlet weak var mailinvoicetextlbl: UILabel!
    
    @IBOutlet weak var canceltextlbl: UILabel!
    
    var donerideid = ""
    
    @IBOutlet weak var innerview: UIView!
    
    var useremail = ""
    
    
    
    @IBOutlet weak var sendbtntextlabel: UILabel!
    @IBOutlet weak var pleaseenteryouremailtextlabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailinvoicetextlbl.text = "Mail Invoice".localized
        pleaseenteryouremailtextlabel.text = "Please enter you mail address on which you want to send invoice.".localized
        canceltextlbl.text = "Cancel".localized
        sendbtntextlabel.text = "OK".localized
        enteremailtext.placeholder = "Enter Email".localized
        
      //  pleaseenteryouremailtextlabel.text = "Please Enter your email to get your invoice".localized
      //  sendbtntextlabel.text = "SEND".localized
        
        innerview.edgeWithOutShadow(edge: 8.0)
       
         useremail = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.EMAIL_ID)
      
        
        enteremailtext.text = useremail
        view.backgroundColor = UIColor.clear
        view.isOpaque = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelbtn_click(_ sender: Any) {
        
        self.dismissVC()
        
    }
    @IBAction func sendbtn_click(_ sender: Any) {
        
        useremail = enteremailtext.text!
        
        if useremail == ""{
        self.showErrorAlert("", alertMessage: "Please enter email first", VC: self)
       
            
        }else{
        
           
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGINVOICE + "/\(AppConstants.bookingId)" 
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: SendMailIModel.self)
            
      //  ApiManager.sharedInstance.protocolmain_Catagory = self
     //   ApiManager.sharedInstance.Mailinvoice(DoneRideId: donerideid, UserEmail: useremail)
            
        }
        
    }
    
  
    
    
  

    
    

}


extension SENDEMAILViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        
        if let responseData = response as? SendMailIModel{
            
            let data:SendMailIModel = responseData
            
         
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                let alert = UIAlertController(title: NSLocalizedString("", comment: ""), message: data.message, preferredStyle: .alert)
                let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                    self.dismissVC()
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
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
