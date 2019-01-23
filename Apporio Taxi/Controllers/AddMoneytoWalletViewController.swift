//
//  AddMoneytoWalletViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class AddMoneytoWalletViewController: BaseViewController {
    
    @IBOutlet weak var addmoneytowallettextlbl: UILabel!
    
    @IBOutlet weak var itsquicksafetextlbl: UILabel!
    
    @IBOutlet weak var currencysymbol: UILabel!
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var hiddencancelbtntext: UIButton!
    @IBOutlet weak var hiddeninnerview: UIView!
    
    @IBOutlet weak var tophiddenviewtextlbl: UILabel!
    
     var enteramountvalue = ""
    
     var check = 1000
    
    var dataarray = ["Credit Card","Online","Paypal","Others can be added"]
    
    @IBOutlet weak var enteramounttext: UITextField!
    @IBOutlet weak var topviewaddmoneytowallettextlbl: UILabel!
    
    @IBOutlet weak var hiddeninnerviewheight: NSLayoutConstraint!
    @IBOutlet weak var thirdbtntext: UIButton!
    
    @IBOutlet weak var firstbtntext: UIButton!
    @IBOutlet weak var secondbtntext: UIButton!
    
    @IBOutlet weak var addmoneybtntext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppConstants.enteramount = ""
        
       tophiddenviewtextlbl.text = "Select Payment method".localized
        topviewaddmoneytowallettextlbl.text = "Add money to wallet".localized
        addmoneytowallettextlbl.text = "Add money to wallet".localized
        itsquicksafetextlbl.text = "It's quick,safe and secure".localized
        addmoneybtntext.setTitle("Add Money".localized, for: UIControlState.normal)
        hiddencancelbtntext.setTitle("CANCEL".localized, for: UIControlState.normal)
        
        hiddenview.isHidden = true
        
        self.firstbtntext.setTitle(AppConstants.userconfiguredata.data?.userWalletPackage![0].amount, for: .normal)
        
        self.secondbtntext.setTitle(AppConstants.userconfiguredata.data?.userWalletPackage![1].amount, for: .normal)
        
        self.thirdbtntext.setTitle(AppConstants.userconfiguredata.data?.userWalletPackage![2].amount, for: .normal)
        
        self.topview.edgeWithShadow(edge: 4.0)
        
        
        self.firstbtntext.layer.borderWidth = 1.0
        self.firstbtntext.layer.cornerRadius = 4
        
        self.secondbtntext.layer.borderWidth = 1.0
        self.secondbtntext.layer.cornerRadius = 4
        self.thirdbtntext.layer.borderWidth = 1.0
        self.thirdbtntext.layer.cornerRadius = 4

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if AppConstants.cardselect == 1{
            AppConstants.cardselect = 0
            
          
            
            
            let dic1 = ["amount": AppConstants.enteramount
                        
            
                ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERWALLETADDMONEY
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PaymentDoneModel.self)
            
        }else{
            AppConstants.cardselect = 0
            
            
        }
    }
    
    
    
    @IBAction func hiddenviewcancelbtnclick(_ sender: Any) {
         hiddenview.isHidden = true
        
    }
    

    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func addmoneybtnclick(_ sender: Any) {
        
        enteramountvalue = enteramounttext.text!
        
        if enteramountvalue == "" {
            
            self.showErrorAlert("", alertMessage: "Please enter Amount First".localized, VC: self)
           
        }else{
       
             hiddenview.isHidden = false
        }
        
    }
    
    @IBAction func firstbtnclick(_ sender: Any) {
        firstbtntext.backgroundColor = UIColor.appThemeColor()
        
        secondbtntext.backgroundColor = UIColor.clear
        thirdbtntext.backgroundColor = UIColor.clear
    
        enteramounttext.text = AppConstants.userconfiguredata.data?.userWalletPackage![0].amount
        
    }
    
    @IBAction func secondbtnclick(_ sender: Any) {
        
        secondbtntext.backgroundColor = UIColor.appThemeColor()
       
        firstbtntext.backgroundColor = UIColor.clear
        thirdbtntext.backgroundColor = UIColor.clear
      
        enteramounttext.text = AppConstants.userconfiguredata.data?.userWalletPackage![1].amount
    }
    
    @IBAction func thirdbtnclick(_ sender: Any) {
        
        thirdbtntext.backgroundColor = UIColor.appThemeColor()
        
        
        secondbtntext.backgroundColor = UIColor.clear
        firstbtntext.backgroundColor = UIColor.clear
     
        enteramounttext.text = AppConstants.userconfiguredata.data?.userWalletPackage![2].amount
    }
}


extension AddMoneytoWalletViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
        
        
        let firsttext: UILabel = cell1.contentView.viewWithTag(1) as! UILabel
        
        let imageview: UIImageView = cell1.contentView.viewWithTag(2) as! UIImageView
        
        firsttext.text = dataarray[indexPath.row]
        
        if(check == indexPath.row)
        {
            
            imageview.image = UIImage(named: "Circled Dot-35 (1)")
            
        }else{
            imageview.image = UIImage(named: "Circle Thin-35 (1)")
            
        }
        
        
        let tableheight = hiddentableview.contentSize.height
        
        
        
        
       
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            
             hiddeninnerviewheight.constant = tableheight + 100.0
            
        }else{
            
             hiddeninnerviewheight.constant = AppConstants.screenframeheight - 200.0
        }
        
       
        
        
        
     
        
        return cell1
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        
        hiddenview.isHidden = true
         AppConstants.enteramount = enteramountvalue
        self.presentVC("ManageYourCardViewController")
    }
    
    
    
}


extension AddMoneytoWalletViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? PaymentDoneModel{
            
            let data:PaymentDoneModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                //  self.callApi()
                
                
                
                AppConstants.enteramount = ""
               AppConstants.addmoney = 1
                self.dismissVC()
                
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


