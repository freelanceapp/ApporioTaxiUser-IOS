//
//  VerifyPhoneViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import SkyFloatingLabelTextField

class VerifyPhoneViewController: BaseViewController {

    @IBOutlet weak var topverifyphonenumbertextlbl: UILabel!
    
    @IBOutlet weak var reenterphonebtntext: UIButton!
    
    @IBOutlet weak var enterotptext: SkyFloatingLabelTextField!
    // @IBOutlet weak var enterotptext: UITextField!
    @IBOutlet weak var getotpbtnview: UIView!
    
    @IBOutlet weak var pleaseentertheotptextlbl: UILabel!
    
    @IBOutlet weak var enterphonetext: SkyFloatingLabelTextField!
    //  @IBOutlet weak var enterphonetext: UITextField!
    @IBOutlet weak var continuebtntext: UIButton!
    @IBOutlet weak var continuebtnview: UIView!
    
    @IBOutlet weak var countrycodetext: UILabel!
    @IBOutlet weak var getotpbtntext: UIButton!
    
    var selectindexvalue = 0
    
    @IBOutlet weak var hiddentableview: UITableView!
    
    @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var hiddenviewokbtntext: UIButton!
    
    @IBOutlet weak var selectcountrytextlbl: UILabel!
    @IBOutlet weak var innerhiddenview: UIView!
    
     var selectcountrycodetext = "+91"
    
     var check = 0
    
    @IBOutlet weak var innerviewheight: NSLayoutConstraint!
    
     var otpvalue = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topverifyphonenumbertextlbl.text = "Verify your Phone Number".localized
        pleaseentertheotptextlbl.text = "Please enter the One Time Password(OTP) recieved on your number!".localized
        enterotptext.placeholder = "Enter OTP".localized
        reenterphonebtntext.setTitle("Re-enter Phone".localized, for: UIControlState.normal)
        continuebtntext.setTitle("Continue".localized, for: UIControlState.normal)
        enterphonetext.placeholder = "Enter Phone".localized
        getotpbtntext.setTitle("GET OTP".localized, for: UIControlState.normal)
        selectcountrytextlbl.text = "Select Country".localized
        hiddenviewcancelbtntext.setTitle("CANCEL".localized, for: UIControlState.normal)
        hiddenviewokbtntext.setTitle("OK".localized, for: UIControlState.normal)
        
        
        
        hiddenview.isHidden = true
        continuebtnview.isHidden = true
        getotpbtnview.isHidden = false
        
        countrycodetext.text = selectcountrycodetext
        
        
        enterotptext.selectedTitleColor = UIColor.appThemeColor()
        enterotptext.selectedLineColor = UIColor.clear
        
        enterphonetext.selectedTitleColor = UIColor.appThemeColor()
        enterphonetext.selectedLineColor = UIColor.clear
        
         selectindexvalue = 0
        
         selectcountrycodetext = (AppConstants.userconfiguredata.data?.countries![selectindexvalue].phonecode)!
        
       
        
        countrycodetext.text = selectcountrycodetext
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func hiddenviewokbtnclick(_ sender: Any) {
        
        countrycodetext.text = selectcountrycodetext
        
        hiddenview.isHidden = true
    }
    
    
    @IBAction func hiddenviewcancelbtnclick(_ sender: Any) {
        
         hiddenview.isHidden = true
    }
    
    @IBAction func getotpbtnclick(_ sender: Any) {
        

        
     
        
        if (self.enterphonetext.text?.count)! >= Int((AppConstants.userconfiguredata.data?.countries![selectindexvalue].minNumPhone)!)! &&  (self.enterphonetext.text?.count)! <= Int((AppConstants.userconfiguredata.data?.countries![selectindexvalue].maxNumPhone)!)!{
            if AppConstants.comefromforgetscreen == "forgot"{
                
                
                
                
                let dic1 = ["type": "2" as AnyObject,
                            "phone":countrycodetext.text! + self.enterphonetext.text!,
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USEROTP
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: OTPModel.self)
            }else{
                
               
                
                let dic1 = ["type": "1" as AnyObject,
                            "phone":countrycodetext.text! + self.enterphonetext.text!,
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USEROTP
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: OTPModel.self)
                
            }
            
           
        }else{
        
        
            self.showErrorAlert("", alertMessage: "phone number should exist between ".localized + (AppConstants.userconfiguredata.data?.countries![selectindexvalue].minNumPhone)! + " to ".localized + (AppConstants.userconfiguredata.data?.countries![selectindexvalue].maxNumPhone)! + " digits.".localized, VC: self)
        
        
        }
        
    }
    
    @IBAction func selectcountrycodebtn(_ sender: Any) {
        
        hiddentableview.reloadData()
        hiddenview.isHidden = false
        
        
    }
    @IBAction func reenterphonebtnclick(_ sender: Any) {
        continuebtnview.isHidden = true
        getotpbtnview.isHidden = false
        
    }
    
    
    @IBAction func backbtnclick(_ sender: Any) {
         self.dismissVC()
    }
    
    @IBAction func continuebtnclick(_ sender: Any) {
        
        if otpvalue == self.enterotptext.text!
            
        {
            
            if AppConstants.comefromforgetscreen == "forgot"{
                
                AppConstants.enteruserphonenumber = selectcountrycodetext + self.enterphonetext.text!
                self.presentVC("ForgotPasswordViewController")
                
            }else{
               AppConstants.checkphonenumber = 1
                AppConstants.enteruserphonenumber = selectcountrycodetext + self.enterphonetext.text!
               self.dismissVC()
                
            }
            
            
        }else{
            self.showErrorAlert("", alertMessage: "Please Enter Valid OTP".localized, VC: self)
            
        }
        
    }
    
}


extension VerifyPhoneViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (AppConstants.userconfiguredata.data?.countries?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
        
        
        let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
        
        let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
        
        firsttext.text = (AppConstants.userconfiguredata.data?.countries![indexPath.row].phonecode)! + "  " +  (AppConstants.userconfiguredata.data?.countries![indexPath.row].name)!
        
        let tableheight = hiddentableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerviewheight.constant = tableheight + 100.0
            
        }else{
            
            innerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
        if(check == indexPath.row)
        {
            
            imageview.image = UIImage(named: "Circled Dot-35 (1)")
            
        }else{
            imageview.image = UIImage(named: "Circle Thin-35 (1)")
            
        }
        
        
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        check = indexPath.row
        selectindexvalue = indexPath.row
        hiddentableview.reloadData()
        
        selectcountrycodetext = (AppConstants.userconfiguredata.data?.countries![indexPath.row].phonecode)!
        
    }
    
    
    
}


extension VerifyPhoneViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? OTPModel{
            let data:OTPModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                continuebtnview.isHidden = false
                getotpbtnview.isHidden = true
                
                if (data.data?.autoFill)!{
                     otpvalue = (data.data?.otp)!
                    
                    enterotptext.text = data.data?.otp
                    
                }else{
                      otpvalue = (data.data?.otp)!
                    
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

