//
//  ManageYourCardViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ManageYourCardViewController: BaseViewController {
    
    @IBOutlet weak var addnewbtntext: UIButton!
    
    @IBOutlet weak var manageyourcardstextlbl: UILabel!
    
    var tablecount = 0
    
    
    
    var managecarddata: ManageCardModel!
    
    @IBOutlet weak var managecardtableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageyourcardstextlbl.text = "Manage Your Cards".localized
        addnewbtntext.setTitle("Add New".localized, for: UIControlState.normal)
        
        self.callApi()
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.tokenvalue == 0{
            
             AppConstants.tokenvalue = 0
        }else{
            AppConstants.tokenvalue = 0
            self.callApi()
        }
    }
    
    func callApi(){
        
        
        
        
        let dic1 = ["payment_option":"STRIPE"
            
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCARDS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ManageCardModel.self)
        
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
   
    @IBAction func addnewbtnclick(_ sender: Any) {
        self.presentVC("AddNewCardViewController")
    }
    
}

extension ManageYourCardViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = managecardtableview.dequeueReusableCell(withIdentifier: "managecell", for: indexPath) as! CardTableViewCell
       // let cardiamge: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
      
        
        cell.cardnumbertext.text =  managecarddata.data![indexPath.row].cardType! +  " XXXX " + managecarddata.data![indexPath.row].cardNumber!
        cell.expdatetext.text = String((managecarddata.data![indexPath.row].expMonth!)) + "/" + String((managecarddata.data![indexPath.row].expYear!))
        
        cell.deletebtn.tag = indexPath.row
        
        cell.deletebtn.addTarget(self, action: #selector(ManageYourCardViewController.DeleteCard(_:)), for: .touchUpInside)
        
        cell.selectbtn.tag = indexPath.row
        
        cell.selectbtn.addTarget(self, action: #selector(ManageYourCardViewController.SelectCard(_:)), for: .touchUpInside)
        
        
        if AppConstants.enteramount == ""{
            
            cell.selectbtnview.isHidden = true
            cell.deletebtnview.isHidden = false
        }else{
            cell.selectbtnview.isHidden = false
            cell.deletebtnview.isHidden = true
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        managecardtableview.deselectRow(at: indexPath, animated: true)
    }
    
     @objc func SelectCard(_ Sender: UIButton){
        
        
       
        
        
        let dic1 = ["card_id": managecarddata.data![Sender.tag].cardId,
                    "amount": AppConstants.enteramount,
                    "currency": AppConstants.currencysymbol
            
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCARDMAKEPAYMENT
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PaymentDoneModel.self)
        
    }
    
    
    @objc func DeleteCard(_ Sender: UIButton){
        
        
        
        
        let dic1 = ["card_id": managecarddata.data![Sender.tag].cardId
            
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCARDSDelete
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DeleteCardModel.self)
        
        
        
    }
    
    
}


extension ManageYourCardViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? ManageCardModel{
            
            let data:ManageCardModel = responseData
            
            managecarddata = data
            
            if managecarddata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                managecardtableview.isHidden = false
                
                tablecount = (managecarddata.data?.count)!
                
                managecardtableview.reloadData()
               
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                managecardtableview.isHidden = true
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
                
            }
            
            
        }
        
        
        if let responseData = response as? DeleteCardModel{
            
            let data:DeleteCardModel = responseData
            
         
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                self.callApi()
               
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
             
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? PaymentDoneModel{
            
            let data:PaymentDoneModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                AppConstants.cardselect = 1
               self.dismissVC()
                
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: managecarddata.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
}
