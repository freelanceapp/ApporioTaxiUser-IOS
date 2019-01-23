//
//  CouponsCodeViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 29/05/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class CouponsCodeViewController: BaseViewController {
    
   
    
     var viewcontrollerself : UIViewController!
    
    @IBOutlet var mainview: UIView!
    
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var entercouponcode: UITextField!
    
    @IBOutlet weak var simpleview: UIView!
    
    @IBOutlet weak var invalidtextshowview: UIView!
    
    
    @IBOutlet weak var youdontseemtextlabel: UILabel!
    @IBOutlet weak var applybtntextlabel: UILabel!
    @IBOutlet weak var cancelbtntextlabel: UILabel!
    @IBOutlet weak var pleaseentervalidcodetextlabel: UILabel!
    @IBOutlet weak var applycoupontextlabel: UILabel!
    
    @IBOutlet weak var invalidcodetextlabel: UILabel!
    
    
     func viewSetup(){
        
        applybtntextlabel.text = "APPLY COUPON".localized
        applybtntextlabel.text = "APPLY".localized
        cancelbtntextlabel.text = "Cancel".localized
        invalidcodetextlabel.text = "INVALID CODE!!".localized
        pleaseentervalidcodetextlabel.text = "Please enter a valid coupon and try again.".localized
        youdontseemtextlabel.text = "You dont seem to have any valid coupons".localized
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewSetup()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func applycouponbtn(_ sender: Any) {
        
        if(entercouponcode.text!.count == 0)
            
        {
            invalidtextshowview.isHidden = false
            simpleview.isHidden = true
        }
        else{
            
           
            
            let dic1 = ["checkout_id":AppConstants.checkoutid,
                       "promo_code": self.entercouponcode.text!
                
                ] as [String : AnyObject]
            
        
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKOUTAPPLYPROMO
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
            
        

        }
        
    }
    
    @IBAction func cancelbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
    

    
    
  
    
//    func onSuccessParse(data: AnyObject) {
//
//        if let mydata = data as? Coupons{
//
//
//        self.mydata = mydata
//
//        if(mydata.result == 0){
//
//          invalidtextshowview.isHidden = false
//            simpleview.isHidden = true
//
//        }else{
//
//            GlobalVarible.CouponCode = self.entercouponcode.text!
//
//            self.showalert1( message: mydata.msg!)
//
//        }
//
//        }
//    }
//

    
}


extension CouponsCodeViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? RideNowCheckoutModel{
            
            let data:RideNowCheckoutModel = responseData
            
            AppConstants.Ridenowcheckoutmodeldata = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                AppConstants.couponcode = self.entercouponcode.text!
                AppConstants.couponcodevalue = 1
                self.dismiss(animated: true, completion: nil)
                self.viewcontrollerself.viewWillAppear(true)
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                invalidtextshowview.isHidden = false
                simpleview.isHidden = true
                 pleaseentervalidcodetextlabel.text = data.message!
                hideLoaderWithoutBackground()
              //  showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
}

