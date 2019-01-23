//
//  EmergencyViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 23/08/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import DropDown
import ObjectMapper


class EmergencyViewController: BaseViewController {
    
    
    @IBOutlet weak var useincaseofemergencytextlabel: UILabel!
    
    @IBOutlet weak var callpolicecontrolroomtextlabel: UILabel!
    
    @IBOutlet weak var closetextlabel: UILabel!
    @IBOutlet weak var callyouremergencytextlabel: UILabel!
    
    //var emergencycontactdata: EmergencyResponseModel!
    
    @IBOutlet weak var selectemergencytext: UILabel!
    
    @IBOutlet weak var dropdownview: UIView!
    let dropDown = DropDown()
    
    
    
    @IBOutlet weak var callyouremergencytext: UILabel!
    
  
       
    @IBOutlet weak var closebtnview: UIView!
    
    var PhoneNumber = ""
    
    var emergencylistarray = [String]()
    
    func setupView(){
        useincaseofemergencytextlabel.text = "USE IN CASE OF EMERGENCY".localized
        callpolicecontrolroomtextlabel.text = "Call Police Control Room".localized
        callyouremergencytextlabel.text = "Call Your Emergency Contact".localized
        closetextlabel.text = "CLOSE".localized
        selectemergencytext.text = "Select Emergency Contact".localized
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
        self.closebtnview.layer.borderWidth = 1.0
        self.closebtnview.layer.cornerRadius = 4
        self.closebtnview.layer.backgroundColor = UIColor.lightGray.cgColor
        
        emergencylistarray.removeAll()
        
        if AppConstants.bookingdetailsdata.data?.sos?.count == 0{
            
            
        }else{
        
            for items in  (AppConstants.bookingdetailsdata.data?.sos)!
                    {
        
        
                        emergencylistarray.append(items.number!)
        
        
                        dropDown.dataSource = emergencylistarray
        
                    }
        
        }
        
       // ApiManager.sharedInstance.protocolmain_Catagory = self
      //  ApiManager.sharedInstance.EmergencyContactUrl()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SelectEmergencybtn_click(_ sender: Any) {
        
        dropDown.anchorView = dropdownview
        dropDown.topOffset = CGPoint(x:0, y: self.dropdownview.bounds.height)
        
        self.dropDown.width = 200
        self.dropDown.cellHeight = 50
        
        
        self.dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            self.PhoneNumber = (AppConstants.bookingdetailsdata.data?.sos![index].number)!


            self.selectemergencytext.text = (AppConstants.bookingdetailsdata.data?.sos![index].number)!

            self.callyouremergencytext.text = (AppConstants.bookingdetailsdata.data?.sos![index].name)!
//
            print(self.PhoneNumber)
            
            
            self.dropDown.hide()
        }
        
        
    }
    
    
    
    @IBAction func callPoliceControl_btn(_ sender: Any) {
        
        
     //   ApiManager.sharedInstance.protocolmain_Catagory = self
    //    ApiManager.sharedInstance.EmergencyContactMessageUrl(RideId: GlobalVarible.RideId, DriverId: GlobalVarible.DRIVERID, UserId: self.Userid, SOSNUMBER: "100",Latitude: GlobalVarible.emergencylatitude,Longitude: GlobalVarible.emergencylongitude)
        self.PhoneNumber = "100"
        
        
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    "number": self.PhoneNumber,
                    "latitude": AppConstants.emergencylatitude,
                    "longitude":AppConstants.emergencylongitude,
                    
                    
                    
                    ] as [String : AnyObject]
        
       // showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERACTIVEERSOSREQUEST
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SOSRequestModel.self)
        
        
        
        if let url = URL(string: "telprompt://\("100")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
            
          
        }
    }
    
    @IBAction func callyouremergency_btn(_ sender: Any) {
        
        
       
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    "number": self.PhoneNumber,
                    "latitude": AppConstants.emergencylatitude,
                    "longitude":AppConstants.emergencylongitude,
                    
                    
                    
                    ] as [String : AnyObject]
        
      //  showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERACTIVEERSOSREQUEST
        ServiceManager.sharedInstance.delegate = self
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SOSRequestModel.self)
        
        
        
  
        
        if let url = URL(string: "telprompt://\(self.PhoneNumber)") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
            
          
        }
    }
    
    
    @IBAction func Close_btn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    

    

   
}


extension EmergencyViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? SOSRequestModel{
            
            let data:SOSRequestModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
              
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                hideLoaderWithoutBackground()
               // showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        // showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
}
