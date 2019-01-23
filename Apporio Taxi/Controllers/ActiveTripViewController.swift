//
//  ActiveTripViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ActiveTripViewController: BaseViewController {
    
    
    @IBOutlet weak var activetriptableview: UITableView!
    
    
    var activeridedata: ActiveTripModel!
    
    var tablecount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.callApi()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if AppConstants.cancelbtnvaluematch == "2"{
            AppConstants.cancelbtnvaluematch  = ""
            self.callApi()
        }
    }
    
    func callApi(){
        
        tablecount = 0
        
       
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGHISTORYACTIVE
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: ActiveTripModel.self)
        
        
    }
    

   

}

extension ActiveTripViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = activetriptableview.dequeueReusableCell(withIdentifier: "activetrip", for: indexPath) as! ActivetripTableViewCell
        
        cell.mainview.edgeWithShadow(edge: 4.0)
        
        cell.rideidtext.text = activeridedata.data![indexPath.row].highlightedText
        cell.datetext.text = activeridedata.data![indexPath.row].smallText
        
        cell.paymentmethodtext.text = activeridedata.data![indexPath.row].valueText
        
        cell.paymentmethodtext.textColor = PListUtility.getColorFromHex(hexString: "#" + activeridedata.data![indexPath.row].valueColor!)
        
        cell.pickuplocationtext.text = activeridedata.data![indexPath.row].pickText
        
        cell.droplocationtext.text = activeridedata.data![indexPath.row].dropLocation
        
        cell.ridestatustext.text = activeridedata.data![indexPath.row].statusText
        
        cell.ridestatustext.textColor = PListUtility.getColorFromHex(hexString: "#" + activeridedata.data![indexPath.row].statusColor!)
        
        if activeridedata.data![indexPath.row].driverBlockVisibility!{
            
            cell.driverviewvisible.isHidden = false
            
            cell.driverimageview.makeViewCircular()
            
            let newstring = activeridedata.data![indexPath.row].driverImage
            
            if newstring == ""{
                
                
            }else{
                
                
                
                AppConstants.downloadimage(imagename: newstring!, imageview: cell.driverimageview, placeholderimage: "output1")
                
              
            }
            
            cell.driverratingvalue.editable = false
            
            cell.drivernametext.text = activeridedata.data![indexPath.row].driverName
            
            cell.driverratingtext.text = activeridedata.data![indexPath.row].driverRating
            
            cell.driverratingvalue.rating = Float((activeridedata.data![indexPath.row].driverRating)!)!
            
            
        }else{
            
             cell.driverviewvisible.isHidden = true
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activetriptableview.deselectRow(at: indexPath, animated: true)
        
        AppConstants.bookingId = String((activeridedata.data![indexPath.row].bookingId)!)
        
        self.presentVC("FullTripDetailsViewController")
        
        
    }
    
    
}


extension ActiveTripViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? ActiveTripModel{
            
            let data:ActiveTripModel = responseData
            
            activeridedata = data
            
            if activeridedata.result == "1" {
                
                hideLoaderWithoutBackground()
                activetriptableview.isHidden = false
                
                
                tablecount = (activeridedata.data?.count)!
                activetriptableview.reloadData()
                
                
                
            }else if activeridedata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                activetriptableview.isHidden = true
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
