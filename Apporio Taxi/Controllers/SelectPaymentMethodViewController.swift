//
//  SelectPaymentMethodViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 02/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class SelectPaymentMethodViewController: BaseViewController {
    
    
    @IBOutlet weak var addwalletmoneybtn: UIButton!
    
    @IBOutlet weak var addpaymentmethodbtn: UIButton!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var innerwalletmoneyview: UIView!
    @IBOutlet weak var addwalletmoneyview: UIView!
    
    @IBOutlet weak var addpaymentmethodview: UIView!
    
    @IBOutlet weak var inneraddpaymentview: UIView!
    
    @IBOutlet weak var topselectpaymentmethodtextlbl: UILabel!
    
    @IBOutlet weak var paymentoptiontableview: UITableView!
    
    var tablecount = 0
    
    var paymentoptiondata: PaymentOptionModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topselectpaymentmethodtextlbl.text = "Select payment method".localized
        
        innerwalletmoneyview.edgeWithShadow(edge: 16)
        
        inneraddpaymentview.edgeWithShadow(edge: 16)
        
        
        
        
        
      
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let dic1 = ["checkout_id":AppConstants.checkoutid,
                    
                    
                    ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERPAYMENTOPTION
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PaymentOptionModel.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addwalletmoneybtnclick(_ sender: Any) {
        
        self.presentVC("AddMoneytoWalletViewController")
    }
    @IBAction func addpaymentmethodbtnclick(_ sender: Any) {
        self.presentVC("AddNewCardViewController")
    }
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        self.dismissVC()
    }
    
   

}


extension SelectPaymentMethodViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentoptiontableview.dequeueReusableCell(withIdentifier: "paymentcell", for: indexPath)
        
        
        let mainview: UIView = cell.contentView.viewWithTag(1)!
        
        let textlbl: UILabel = cell.contentView.viewWithTag(2) as! UILabel
        
        let selectimageview: UIImageView = cell.contentView.viewWithTag(3) as! UIImageView
        
        let iconimage: UIImageView = cell.contentView.viewWithTag(4) as! UIImageView
        
        mainview.edgeWithShadow(edge: 4.0)
        
        textlbl.text = self.paymentoptiondata.data![indexPath.row].name
        
        let newstring = self.paymentoptiondata.data![indexPath.row].icon
        
        AppConstants.downloadimage(imagename: newstring!, imageview: iconimage, placeholderimage: "output1")
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        paymentoptiontableview.deselectRow(at: indexPath, animated: true)
        
        
        
       
        
       
        
        let dic1 = ["checkout":AppConstants.checkoutid,
                    "payment_option":paymentoptiondata.data![indexPath.row].id!,
                    "card_id":paymentoptiondata.data![indexPath.row].cardId!
            
                    
                    
                    ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
    
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERPAYMENT
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
        
        
    }
    
    
}

extension SelectPaymentMethodViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? PaymentOptionModel{
            
            let data:PaymentOptionModel = responseData
            
            self.paymentoptiondata = data
            
            if self.paymentoptiondata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                tablecount = (self.paymentoptiondata.data?.count)!
                
                paymentoptiontableview.reloadData()
                
                
                if self.paymentoptiondata.creditButton!{
                    self.addpaymentmethodview.isHidden = false
                    self.inneraddpaymentview.isHidden = false
                }else{
                     self.addpaymentmethodview.isHidden = true
                     self.inneraddpaymentview.isHidden = true
                }
                
                if self.paymentoptiondata.walletButton!{
                    self.addwalletmoneyview.isHidden = false
                    self.innerwalletmoneyview.isHidden = false
                    
                }else{
                    self.addwalletmoneyview.isHidden = true
                     self.innerwalletmoneyview.isHidden = true
                }
                
                
                
              
                
            }else if paymentoptiondata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
               
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        if let responseData = response as? RideNowCheckoutModel{
            
            let data:RideNowCheckoutModel = responseData
            
            AppConstants.Ridenowcheckoutmodeldata = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
               
                AppConstants.paymentoptionselect = 1
                self.dismiss(animated: true, completion: nil)
               
                
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
