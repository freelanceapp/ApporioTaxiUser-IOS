//
//  CompletedtripViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class CompletedtripViewController: BaseViewController {
    
    
    var completeridedata: CompleteRideModel!
    
    var tablecount: Int?
    
    
    @IBOutlet weak var completeridetableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablecount = 0
        
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
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGHISTORY
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: CompleteRideModel.self)
        
        
    }
    

   

}


extension CompletedtripViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = completeridetableview.dequeueReusableCell(withIdentifier: "completecell", for: indexPath) as! CompleterideTableViewCell
        
        cell.mainview.edgeWithShadow(edge: 4.0)
        
       
        cell.ridestatustext.setCornerCircular(4.0)
        
        cell.ridestatustext.text = completeridedata.data![indexPath.row].statusText
        
        
         cell.ridestatustext.sizeToFit()
        
        
       
        
        cell.datetext.text = completeridedata.data![indexPath.row].highlightedSmallText
        
        let newString = completeridedata.data![indexPath.row].pickMarkerIcon
        
        
        AppConstants.downloadimage(imagename: newString!, imageview: cell.pickuplocationimage, placeholderimage: "output1")
        
        let newString1 = completeridedata.data![indexPath.row].dropMarkerIcon
        
        
        AppConstants.downloadimage(imagename: newString1!, imageview: cell.dropimageview, placeholderimage: "output1")
        
        let newString2 = completeridedata.data![indexPath.row].circularImage
        
        
        AppConstants.downloadimage(imagename: newString2!, imageview: cell.carimageview, placeholderimage: "output1")
        
        cell.carnametext.text = completeridedata.data![indexPath.row].highlightedText
        
        cell.pickuplocationtext.text = completeridedata.data![indexPath.row].pickText
        
        cell.droplocationtext.text = completeridedata.data![indexPath.row].dropLocation
        
        if completeridedata.data![indexPath.row].valueTextVisibility!{
        
        cell.totalamounttext.text = completeridedata.data![indexPath.row].valueText
        
        cell.totalamounttext.textColor = PListUtility.getColorFromHex(hexString: "#" + (completeridedata.data![indexPath.row].valueTextColor)!)
        
    }else{
    
    }
        
        

        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completeridetableview.deselectRow(at: indexPath, animated: true)
        
        AppConstants.bookingId = String((completeridedata.data![indexPath.row].bookingId)!)
        
        self.presentVC("FullTripDetailsViewController")
        
        
    }
    
    
    
    
}

extension CompletedtripViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? CompleteRideModel{
            
            let data:CompleteRideModel = responseData
            
            completeridedata = data
            
            if completeridedata.result == "1" {
                
                hideLoaderWithoutBackground()
                 completeridetableview.isHidden = false
                
                
                tablecount = completeridedata.data?.count
                completeridetableview.reloadData()
                
               
                
            }else if completeridedata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                completeridetableview.isHidden = true
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
