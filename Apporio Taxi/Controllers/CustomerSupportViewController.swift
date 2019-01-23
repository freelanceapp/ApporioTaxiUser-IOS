//
//  CustomerSupportViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class CustomerSupportViewController: BaseViewController {
    
    @IBOutlet weak var entername: UITextField!
    
    @IBOutlet weak var enteremail: UITextField!
    
    @IBOutlet weak var topcustomersupporttextlbl: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var nameview: UIView!
    
    @IBOutlet weak var emailview: UIView!
    
    @IBOutlet weak var enterphone: UITextField!
    
    @IBOutlet weak var queryview: UIView!
    
    @IBOutlet weak var enterquerytext: UITextView!
    @IBOutlet weak var phoneview: UIView!
    
    @IBOutlet weak var sendbtntext: UIButton!
    // @IBOutlet var lblSend: UILabel!
    @IBOutlet var lblHaveQuery: UILabel!
    @IBOutlet var lblQueryInstruction: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblPhone: UILabel!
    @IBOutlet var lblYourQuery: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sendbtntext.setTitle("Send".localized, for: UIControlState.normal)
       
        lblHaveQuery.text = "DO YOU HAVE A QUERY".localized
        lblQueryInstruction.text = "Please let us know about your query,our support team will get back to you".localized
        lblName.text = "Name ".localized
        lblEmail.text = "Email".localized
        lblPhone.text = "Phone".localized
        lblYourQuery.text = "your Query".localized
        
      
        
        self.nameview.layer.borderWidth = 1.0
        self.nameview.layer.cornerRadius = 4
        self.emailview.layer.borderWidth = 1.0
        self.emailview.layer.cornerRadius = 4
        self.phoneview.layer.borderWidth = 1.0
        self.phoneview.layer.cornerRadius = 4
        self.queryview.layer.borderWidth = 1.0
        self.queryview.layer.cornerRadius = 4

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height =  500
        self.scrollview.contentSize.width = 0
    }
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func sendbtnclick(_ sender: Any) {
        
        
        if entername.text!.count < 2
        {
            
            self.showErrorAlert("", alertMessage: "Please Check Your Name".localized, VC: self)
         
            
        }
        else if enteremail.text!.count < 2{
            
             self.showErrorAlert("", alertMessage: "Please Check Your Email".localized, VC: self)
           
            
        }
        else if (!enteremail.text!.contains("@"))
        {
            
              self.showErrorAlert("", alertMessage: " Wrong Email format ".localized, VC: self)
          
        }
            
        else if (enteremail.text!.contains(" "))
        {
            
             self.showErrorAlert("", alertMessage: " Email id must not contain space ".localized, VC: self)
        
        }else if enterquerytext.text!.count < 1{
             self.showErrorAlert("", alertMessage: "Please Check Your Query is blank".localized, VC: self)
           
            
            
            
        }
        else{
            
            
            
           
            
            let dic1 = ["name":self.entername.text!,
                        "email":self.enteremail.text!,
                        "phone":self.enterphone.text!,
                        "message":self.enterquerytext.text!
                        
                        
                        ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCUSTOMERSUPPORT
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CustomerSupportModel.self)
            
            
            

        }
        
        
        
    }
    
  

}


extension CustomerSupportViewController: ApiResponseReceiver{
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        
        if let responseData = response as? CustomerSupportModel{
            
            let data:CustomerSupportModel = responseData
            
          //  viewfavouritedriverdata = data
            
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
