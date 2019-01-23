//
//  WalletViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class WalletViewController: BaseViewController {
    
    @IBOutlet weak var filtertextlbl: UILabel!
    @IBOutlet weak var addmoneytext: UIButton!
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var recenttransactionview: UIView!
    @IBOutlet weak var addmoneybtnview: UIView!
    @IBOutlet weak var topwallettextlbl: UILabel!
    
    @IBOutlet weak var availablebalancetextlbl: UILabel!
    @IBOutlet weak var walletbalancetext: UILabel!
    
    @IBOutlet weak var recenttransactionstextlbl: UILabel!
    
    var filtervalue = "3"
    
     var check = 1000
    
    var dataarray = ["All","Paid","Received"]
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var hiddeninnerview: UIView!
    
    @IBOutlet weak var hiddenviewtoptextlbl: UILabel!
    
    @IBOutlet weak var hiddentableview: UITableView!
    
    @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
    var tablecount = 0
    
    var walletdata: WalletModel!
    
    
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var transactiontableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenviewtoptextlbl.text = "Filter Transactions".localized
         hiddenviewcancelbtntext.setTitle("CANCEL".localized, for: UIControlState.normal)
        topwallettextlbl.text = "Wallet".localized
        availablebalancetextlbl.text = "Available Balance".localized
        addmoneytext.setTitle("Add Money".localized, for: UIControlState.normal)
        recenttransactionstextlbl.text = "Recent Transactions".localized
        filtertextlbl.text = "Filter".localized
        
        
        check = 0
        
        hiddenview.isHidden = true
        
      self.callApi()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if  AppConstants.addmoney == 1{
            AppConstants.addmoney = 0
            self.callApi()
        }else{
             AppConstants.addmoney = 0
            
        }
        
        
    }
    
    @IBAction func hiddenviewcancelbtn(_ sender: Any) {
        
        hiddenview.isHidden = true
    }
    
    func callApi(){
        
       
        
        let dic1 = ["filter":filtervalue
            
            
            ] as [String : AnyObject]
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERWALLETTRANSACTION
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: WalletModel.self)
        
    }
    
    @IBAction func addmoneybtnclick(_ sender: Any) {
        
        self.presentVC("AddMoneytoWalletViewController")
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func filterbtnclick(_ sender: Any) {
        
        hiddenview.isHidden = false
        
        if filtervalue == "3"{
            
            check = 0
        }else if filtervalue == "2"{
            
            check = 1
        }else{
            
             check = 2
        }
        
        
    }
    
}

extension WalletViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1{
         return tablecount
            
        }else{
            
            return dataarray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
        
        let cell = transactiontableview.dequeueReusableCell(withIdentifier: "transactioncell", for: indexPath)
        
        
        let imageview: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        let moneyadded: UILabel = cell.contentView.viewWithTag(2) as! UILabel
        
         let date: UILabel = cell.contentView.viewWithTag(3) as! UILabel
        
         let amount: UILabel = cell.contentView.viewWithTag(4) as! UILabel
        
        let newstring = walletdata.data?.recentTransactoin![indexPath.row].icon
        
        AppConstants.downloadimage(imagename: newstring!, imageview: imageview, placeholderimage: "output1")
        
        moneyadded.text = walletdata.data?.recentTransactoin![indexPath.row].transactionName
        
        date.text = walletdata.data?.recentTransactoin![indexPath.row].date
        
            amount.text = AppConstants.currencysymbol + " " + (walletdata.data?.recentTransactoin![indexPath.row].amount)!
        
        amount.textColor = PListUtility.getColorFromHex(hexString: "#" + (walletdata.data?.recentTransactoin![indexPath.row].valueColor)!)
        
        
        
        return cell
            
        }else{
              let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
            
            
            let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
            
            firsttext.text = dataarray[indexPath.row]
            
            if(check == indexPath.row)
            {
                
                imageview.image = UIImage(named: "Circled Dot-35 (1)")
                
            }else{
                imageview.image = UIImage(named: "Circle Thin-35 (1)")
                
            }
            
            
            
            return cell1
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
            
            
            
        }else{
            hiddentableview.deselectRow(at: indexPath, animated: true)
             check = indexPath.row
            
            if indexPath.row == 0{
                
                filtervalue = "3"
                self.callApi()
                
            }
            
            if indexPath.row == 1{
                filtervalue = "2"
                self.callApi()
                
            }
            
            if indexPath.row == 2{
                filtervalue = "1"
                self.callApi()
                
            }
            
            
            hiddenview.isHidden = true
            hiddentableview.reloadData()
        
            
            
        }
    }
    
    
}

extension WalletViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? WalletModel{
            
            let data:WalletModel = responseData
            
            walletdata = data
            
            if walletdata.result == "1" {
                
                hideLoaderWithoutBackground()
                
             topview.edgeWithShadow(edge: 4.0)
                
                walletbalancetext.text = AppConstants.currencysymbol + " " + (walletdata.data?.walletBalance)!
                
                tablecount = (walletdata.data?.recentTransactoin?.count)!
                
                if tablecount == 0{
                    
                    recenttransactionview.isHidden = true
                    transactiontableview.isHidden = true
                     transactiontableview.reloadData()
                    
                }else{
                    recenttransactionview.isHidden = false
                    transactiontableview.isHidden = false
                    
                    transactiontableview.reloadData()
                    
                }
                
                
                
            }else if walletdata.result == "999" {
                
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





