//
//  BookOutstationRideViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 05/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class BookOutstationRideViewController: BaseViewController {
    
    @IBOutlet weak var getdroppedofftextlbl: UILabel!
    
    var tablecount = 0
    
    @IBOutlet weak var keepcartillreturntextlbl: UILabel!
    
    @IBOutlet weak var topbookoutstationtextlbl: UILabel!
      var pidarray:NSMutableArray = []
    
    var selectvalue = 0
    
     var strJsonData6 : String = ""
    
    @IBOutlet weak var locationview: UIView!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    
    @IBOutlet weak var firstradioview: UIView!
    
    @IBOutlet weak var secondradioview: UIView!
    
    @IBOutlet weak var firstimageview: UIImageView!
    
    @IBOutlet weak var onewaygetdroppedofftextlbl: UILabel!
    
    @IBOutlet weak var secondimageview: UIImageView!
    
    @IBOutlet weak var roundtripkeeptextlbl: UILabel!
    
    @IBOutlet weak var leaveontextlbl: UILabel!
    @IBOutlet weak var leaveonselectbtntext: UIButton!
    
    @IBOutlet weak var leaveonview: UIView!
    
    @IBOutlet weak var leaveonviewheight: NSLayoutConstraint!
    
    
    @IBOutlet weak var returnview: UIView!
    
    @IBOutlet weak var returnbyselectbtntext: UIButton!
    @IBOutlet weak var returnbytextlbl: UILabel!
    
    @IBOutlet weak var returnviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var topselectvehicletypetextlbl: UILabel!
    
    
    @IBOutlet weak var bookoutstationtableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topbookoutstationtextlbl.text = "Book OutStation Ride".localized
        onewaygetdroppedofftextlbl.text = "One Way".localized
        roundtripkeeptextlbl.text = "Round Trip".localized
        keepcartillreturntextlbl.text = "Keep car till return".localized
        getdroppedofftextlbl.text = "Get dropped off".localized
        leaveontextlbl.text = "Leave on".localized
        returnbytextlbl.text = "Return by".localized
        topselectvehicletypetextlbl.text = "Select vehicle type".localized
        returnbyselectbtntext.setTitle("Select".localized, for: UIControlState.normal)
        leaveonselectbtntext.setTitle("Select".localized, for: UIControlState.normal)
        
        AppConstants.ReturnSelectTime = ""
        AppConstants.ReturnSelectDate = ""
        AppConstants.LeaveSelectTime = ""
        AppConstants.LeaveSelectDate = ""
        
        
        locationview.edgeWithShadow(edge: 8.0)
        
        pickuplocationtext.text = AppConstants.userselectaddressLocation
        
        droplocationtext.text = AppConstants.droplocation[0]
     
        
        
        tablecount = (AppConstants.bookoutstationdata.data?.single?.count)!
        
        if tablecount == 0{
            
             self.selectvalue = 2
            
             tablecount = (AppConstants.bookoutstationdata.data?.round?.count)!
            
            firstradioview.isHidden = true
            
            firstimageview.image = UIImage(named: "Circle Thin-35 (1)")
            secondimageview.image = UIImage(named: "Circled Dot-35 (1)")
            
            returnview.isHidden = false
            returnviewheight.constant = 45.0
            
            firstimageview.image = firstimageview.image!.withRenderingMode(.alwaysTemplate)
            firstimageview.tintColor = UIColor.appThemeColor()
            
            secondimageview.image = secondimageview.image!.withRenderingMode(.alwaysTemplate)
            secondimageview.tintColor = UIColor.appThemeColor()
            
        }else{
            
             self.selectvalue = 0
            
             firstradioview.isHidden = false
            
            firstimageview.image = UIImage(named: "Circled Dot-35 (1)")
            secondimageview.image = UIImage(named: "Circle Thin-35 (1)")
            
            returnview.isHidden = true
            returnviewheight.constant = 0.0
            
            firstimageview.image = firstimageview.image!.withRenderingMode(.alwaysTemplate)
            firstimageview.tintColor = UIColor.appThemeColor()
            
            secondimageview.image = secondimageview.image!.withRenderingMode(.alwaysTemplate)
            secondimageview.tintColor = UIColor.appThemeColor()
            
            
        }
        
        bookoutstationtableview.reloadData()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        if AppConstants.ReturnSelectDate == ""{
            
            
        }else{
            
            returnbyselectbtntext.setTitle(AppConstants.ReturnSelectDateShowdate, for: UIControlState.normal)
           
           // returnbyselectbtntext.setTitle(AppConstants.ReturnSelectDate + "/" + AppConstants.ReturnSelectTime, for: UIControlState.normal)
            
        }
        
        if AppConstants.LeaveSelectDate == ""{
            
            
        }else{
            leaveonselectbtntext.setTitle(AppConstants.LeaveSelectDateshowformat , for: UIControlState.normal)
            //leaveonselectbtntext.setTitle(AppConstants.LeaveSelectDate + "/" + AppConstants.LeaveSelectTime , for: UIControlState.normal)
            
        }
        
        
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        self.dismissVC()
    }
    
    @IBAction func onewaygetbtnclick(_ sender: Any) {
        selectvalue = 0
        firstimageview.image = UIImage(named: "Circled Dot-35 (1)")
        secondimageview.image = UIImage(named: "Circle Thin-35 (1)")
        
        firstimageview.image = firstimageview.image!.withRenderingMode(.alwaysTemplate)
        firstimageview.tintColor = UIColor.appThemeColor()
        
        secondimageview.image = secondimageview.image!.withRenderingMode(.alwaysTemplate)
        secondimageview.tintColor = UIColor.appThemeColor()
        
        returnview.isHidden = true
        returnviewheight.constant = 0.0
        
        tablecount = (AppConstants.bookoutstationdata.data?.single?.count)!
        
        if tablecount == 0{
            firstradioview.isHidden = true
            
        }else{
            firstradioview.isHidden = false
            
            
        }
        
        bookoutstationtableview.reloadData()
        
        
    }
    
    @IBAction func roundtripkeepbtnclick(_ sender: Any) {
         selectvalue = 2
        firstimageview.image = UIImage(named: "Circle Thin-35 (1)")
        secondimageview.image = UIImage(named: "Circled Dot-35 (1)")
        
        firstimageview.image = firstimageview.image!.withRenderingMode(.alwaysTemplate)
        firstimageview.tintColor = UIColor.appThemeColor()
        
        secondimageview.image = secondimageview.image!.withRenderingMode(.alwaysTemplate)
        secondimageview.tintColor = UIColor.appThemeColor()
        
        
        returnview.isHidden = false
        returnviewheight.constant = 45.0
        
        tablecount = (AppConstants.bookoutstationdata.data?.round?.count)!
        
        if tablecount == 0{
            secondradioview.isHidden = true
            
        }else{
            secondradioview.isHidden = false
            
            
        }
        
        bookoutstationtableview.reloadData()
        
    }
    
    @IBAction func returnbyselectbtn(_ sender: Any) {
        
        if selectvalue == 2{
            
            
            if leaveonselectbtntext.title(for: UIControlState.normal) == "Select"{
              
                self.showErrorAlert("", alertMessage: "please select leave on date first".localized, VC: self)
                
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let myModalViewController = storyboard.instantiateViewController(withIdentifier: "TimePickerViewController")as! TimePickerViewController
                myModalViewController.viewcontrollerself = self
                myModalViewController.matchstring = "returnbookoutstation"
                myModalViewController.modalPresentationStyle = .overCurrentContext
                self.present(myModalViewController, animated: true, completion: nil)
                
            }
            
            
            
            
            
        }
        
     
        
        
    }
    
    
    
    func callApi(){
        
        
        pidarray.removeAllObjects()
        strJsonData6.removeAll()
        AppConstants.BookingType = "2"
        
        var nsdic : [String: AnyObject] = [:]
        
        nsdic.updateValue((1) as AnyObject, forKey: "stop")
        nsdic.updateValue(AppConstants.droplat[0] as AnyObject, forKey: "drop_latitude")
        nsdic.updateValue(AppConstants.droplng[0] as AnyObject, forKey: "drop_longitude")
        nsdic.updateValue(AppConstants.droplocation[0] as AnyObject, forKey: "drop_location")
        nsdic.updateValue("1" as AnyObject, forKey: "status")
        
          pidarray.add(nsdic)
        strJsonData6 = json(from: pidarray)!
        
        
        print(strJsonData6)
        
        
       
        
        let dic1 = ["service_type": AppConstants.ServiceType,
                    "vehicle_type": AppConstants.VehicleType,
                    "area":AppConstants.AreaID,
                    "pickup_latitude":AppConstants.userselectaddressLat,
                    "pickup_longitude":AppConstants.userselectaddressLng,
                    "total_drop_location":AppConstants.droplat.count,
                    "drop_location":strJsonData6,
                    "booking_type":AppConstants.BookingType,
                    "pick_up_locaion":AppConstants.userselectaddressLocation,
                    "package_id":AppConstants.VehicleID,
                    "return_date":AppConstants.ReturnSelectDate,
                    "return_time":AppConstants.ReturnSelectTime,
                    "later_time":AppConstants.LeaveSelectTime,
                    "later_date":AppConstants.LeaveSelectTime
                   
            
            
            ] as [String : AnyObject]
        
     
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKOUT
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
        
        
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    
    @IBAction func leaveonselectbtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "TimePickerViewController")as! TimePickerViewController
        myModalViewController.viewcontrollerself = self
        myModalViewController.matchstring = "leavebookoutstation"
        myModalViewController.modalPresentationStyle = .overCurrentContext
        self.present(myModalViewController, animated: true, completion: nil)
        
        
    }
}


extension BookOutstationRideViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookoutstationtableview.dequeueReusableCell(withIdentifier: "outstationcell", for: indexPath)
        
        let imageview: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        let firsttextlbl: UILabel = cell.contentView.viewWithTag(2) as! UILabel
         let secondtextlbl: UILabel = cell.contentView.viewWithTag(3) as! UILabel
         let thirdtextlbl: UILabel = cell.contentView.viewWithTag(4) as! UILabel
        
        if self.selectvalue == 0{
        
        let newstring = AppConstants.bookoutstationdata.data?.single![indexPath.row].vechileImage
        
        AppConstants.downloadimage(imagename: newstring!, imageview: imageview, placeholderimage: "output1")
        
        firsttextlbl.text = AppConstants.bookoutstationdata.data?.single![indexPath.row].vechileName
        
        secondtextlbl.text = AppConstants.bookoutstationdata.data?.single![indexPath.row].vechileDescription
        
        thirdtextlbl.text = AppConstants.bookoutstationdata.data?.single![indexPath.row].baseFare
            
        }else{
             let newstring = AppConstants.bookoutstationdata.data?.round![indexPath.row].vechileImage
            AppConstants.downloadimage(imagename: newstring!, imageview: imageview, placeholderimage: "output1")
            
            firsttextlbl.text = AppConstants.bookoutstationdata.data?.round![indexPath.row].vechileName
            
            secondtextlbl.text = AppConstants.bookoutstationdata.data?.round![indexPath.row].vechileDescription
            
            thirdtextlbl.text = AppConstants.bookoutstationdata.data?.round![indexPath.row].baseFare
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        bookoutstationtableview.deselectRow(at: indexPath, animated: true)
        
        if self.selectvalue == 0{
            
            
            if leaveonselectbtntext.title(for: UIControlState.normal) == "Select"{
                 self.showErrorAlert("", alertMessage: "please select leave on date first".localized, VC: self)
            }else{
              
                
                AppConstants.VehicleType = (AppConstants.bookoutstationdata.data?.single![indexPath.row].vehicleTypeId)!
                
                AppConstants.ServiceType = (AppConstants.bookoutstationdata.data?.single![indexPath.row].serviceTypeId)!
                
                AppConstants.VehicleID = (AppConstants.bookoutstationdata.data?.single![indexPath.row].packageId)!
                self.callApi()
                
            }
            
            
        }else if  self.selectvalue == 2{
            
            if returnbyselectbtntext.title(for: UIControlState.normal) == "Select"{
                self.showErrorAlert("", alertMessage: "please select return date".localized, VC: self)
            }else{
              
                AppConstants.VehicleType = (AppConstants.bookoutstationdata.data?.round![indexPath.row].vehicleTypeId)!
                AppConstants.VehicleID = ""
                AppConstants.ServiceType = (AppConstants.bookoutstationdata.data?.round![indexPath.row].serviceTypeId)!
                self.callApi()
                
            }
            
        }else{
            
            
            
        }
        
        
     
        
        
        
    }
    
    
    
}




extension BookOutstationRideViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
    
        
        if let responseData = response as? RideNowCheckoutModel{
            
            let data:RideNowCheckoutModel = responseData
            
            AppConstants.Ridenowcheckoutmodeldata = data
            
            if AppConstants.Ridenowcheckoutmodeldata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                AppConstants.checkoutid = String((AppConstants.Ridenowcheckoutmodeldata.data?.id)!)
                 AppConstants.movefromoutstation = "1"
                self.presentVC("RideNowViewController")
                
            }else if AppConstants.Ridenowcheckoutmodeldata.result == "999" {
                
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
        // showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
}

