//
//  AboutUsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class AboutUsViewController: BaseViewController {
    
    @IBOutlet weak var versionnametext: UILabel!
    @IBOutlet weak var topaboutustextlbl: UILabel!
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topaboutustextlbl.text = "About Us".localized
        
        versionnametext.text = "Version Name : ".localized + AppConstants.appversion
        
        
        
        let dic1 = ["slug":"about_us"
                  
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCMSPAGES
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: AboutUsModel.self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
   
}


extension AboutUsViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? AboutUsModel{
            
            let data:AboutUsModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
            
               textview.text = data.data?.descriptionValue

                
                
                
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




