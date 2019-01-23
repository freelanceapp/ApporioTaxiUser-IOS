//
//  FullTripDetailsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars
import ObjectMapper

class FullTripDetailsViewController: BaseViewController {
    
    
    @IBOutlet weak var forcancellingchargetext: UILabel!
    
    @IBOutlet weak var forcancelchargeheight: NSLayoutConstraint!
    
    var checkcancelprice = "0"
    
    var cancelreasondata: CancelReasonModel!
    
    @IBOutlet weak var hiddenview: UIView!
    
    
    @IBOutlet weak var innerhiddenview: UIView!
    
    @IBOutlet weak var hiddentableview: UITableView!
    
    @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var hiddenviewokbtntext: UIButton!
    
    
    @IBOutlet weak var tophiddenviewcancelridetextlbl: UILabel!
    
    @IBOutlet weak var firstview: UIView!
    
    @IBOutlet weak var firsttextlbl: UILabel!
    
    @IBOutlet weak var firstimageview: UIImageView!
    
    var check = 1000
    var selectcancelreasonid = ""
    
     var newtablecount = 0
    
    @IBOutlet weak var secondview: UIView!
    
    @IBOutlet weak var secondimageview: UIImageView!
    
    @IBOutlet weak var secondtextlbl: UILabel!
    
    @IBOutlet weak var thirdtextlbl: UILabel!
    
    @IBOutlet weak var fourthtextlbl: UILabel!
    @IBOutlet weak var fourthimageview: UIImageView!
    @IBOutlet weak var fourthview: UIView!
    @IBOutlet weak var thirdview: UIView!
    
    @IBOutlet weak var thirdimageview: UIImageView!
    
    @IBOutlet weak var toptripdetailstextlbl: UILabel!
    
    @IBOutlet weak var Detailstableview: UITableView!
    
    @IBOutlet weak var topviewheight: NSLayoutConstraint!//410
    
    var ridedetailsdata: RideDetailsModel!
  
    @IBOutlet weak var mapimageview: UIView!
    
    @IBOutlet weak var mapimageviewheight: NSLayoutConstraint!//150
    
    @IBOutlet weak var mapimage: UIImageView!
    
    
    @IBOutlet weak var dateview: UIView!
    
    var tablecount = 0
    
    
    @IBOutlet weak var dateviewheight: NSLayoutConstraint!//50
    
    @IBOutlet weak var datetext: UILabel!
    
    @IBOutlet weak var cartypenametext: UILabel!
    
    @IBOutlet weak var estmitatepricetext: UILabel!
    
    @IBOutlet weak var locationview: UIView!
    
    
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!//80
    
    @IBOutlet weak var dropupimage: UIImageView!
    @IBOutlet weak var droptext: UILabel!
    @IBOutlet weak var pickuptext: UILabel!
    @IBOutlet weak var pickupimage: UIImageView!
    @IBOutlet weak var droplocationview: UIView!
    
    @IBOutlet weak var stackview: UIStackView!
    
    @IBOutlet weak var driverdetailsview: UIView!
    
    @IBOutlet weak var ratingvalue: RatingView!
    @IBOutlet weak var ratingtext: UILabel!
    
    @IBOutlet weak var driverdetailsheight: NSLayoutConstraint!//60
    
    @IBOutlet weak var driveremailtext: UILabel!
    
    @IBOutlet weak var drivernametext: UILabel!
    
    @IBOutlet weak var ratedrivertextlbl: UILabel!
    
    @IBOutlet weak var driverimageview: UIImageView!
    
    
    @IBOutlet weak var pickuplocationview: UIView!
    
    
    @IBOutlet weak var distancetimeview: UIView!
    
    @IBOutlet weak var distancetimeviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var distancetimeimage: UIImageView!
    
    @IBOutlet weak var totalpricetext: UILabel!
    
    @IBOutlet weak var distancetext: UILabel!
    
    
    @IBOutlet weak var timetext: UILabel!
    
    var totalheight = 410.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toptripdetailstextlbl.text = "Trip Details".localized
        tophiddenviewcancelridetextlbl.text = "Cancel Ride".localized
        hiddenviewcancelbtntext.setTitle("Cancel".localized, for: UIControlState.normal)
        hiddenviewokbtntext.setTitle("OK".localized, for: UIControlState.normal)
        
         AppConstants.cancelbtnvaluematch  = "2"
        
        
       
        
        let dic1 = ["booking_id":AppConstants.bookingId
                   
            
            ] as [String : AnyObject]
        
        
        showLoaderWithoutBackground()
        
        hiddenview.isHidden = true
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGHISTORYDetail
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideDetailsModel.self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func hiddenviewcancelbtnclick(_ sender: Any) {
        
        hiddenview.isHidden = true
        
     
    }
    
    
    @IBAction func hiddenviewokbtnclick(_ sender: Any) {
        
        
        if selectcancelreasonid == ""{
            
            
            self.showErrorAlert("", alertMessage: "Please select cancel reason first".localized, VC: self)
            
            
        }else{
            
            hiddenview.isHidden = true
            
            
            
            let dic1 = ["booking_id": AppConstants.bookingId,
                        "cancel_reason_id":selectcancelreasonid,
                        "cancel_charges":cancelreasondata.cancelCharges
                
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGCANCEL
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CancelRideModel.self)
            
            
            
            
        }
    }
    
    
    @IBAction func firstbtnclick(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: SENDEMAILViewController = storyboard.instantiateViewController(withIdentifier: "SENDEMAILViewController") as! SENDEMAILViewController
        next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      
        self.present(next, animated: true, completion: nil)
        
        
    }
    
    @IBAction func secondbtnclick(_ sender: Any) {
        
        
       
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    
                    
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCANCELREASON
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CancelReasonModel.self)
        
        
        
    }
    
  
    
    
    @IBAction func thirdbtnclick(_ sender: Any) {
        
          self.presentVC("TrackRideViewController")
    }
    
    
    @IBAction func fourthbtnclick(_ sender: Any) {
        
        self.presentVC("CustomerSupportViewController")
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    func removeSpecialCharsFromString(_ text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_@/%?//&[]")
        return String(text.filter {okayChars.contains($0) })
    }

    
    func setdata(){
        
        
        if (ridedetailsdata.data?.holderMapImage?.visibility)!{
            
            mapimageview.isHidden = false
            mapimageviewheight.constant = 150.0
            
             let phonewidth = Int(self.mapimageview.frame.width)
            
            let newString1 = (ridedetailsdata.data?.holderMapImage?.mapData?.mapImage)! + "&size=\(phonewidth)x\(150)"
            
            let url12 = removeSpecialCharsFromString(newString1)
            
            AppConstants.downloadimage1(imagename: url12, imageview: mapimage, placeholderimage: "output1")
            
          
            
        }else{
             mapimageview.isHidden = true
             mapimageviewheight.constant = 0.0
            
            totalheight = totalheight - 150.0
            
            topviewheight.constant = CGFloat(totalheight)
         
        }
        
        if (ridedetailsdata.data?.holderBookingDescription?.visibility)!{
            
            dateview.isHidden = false
            dateviewheight.constant = 50.0
            
            
            datetext.text = ridedetailsdata.data?.holderBookingDescription?.descriptionData?.highlightedLeftText
            
            datetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.descriptionData?.highlightedLeftTextColor)!)
            
            cartypenametext.text = ridedetailsdata.data?.holderBookingDescription?.descriptionData?.smallLeftText
            
            cartypenametext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.descriptionData?.smallLeftTextColor)!)
            
            estmitatepricetext.text = ridedetailsdata.data?.holderBookingDescription?.descriptionData?.highlightedRightText
            
            estmitatepricetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderBookingDescription?.descriptionData?.highlightedRightTextColor)!)
            
            
            
        }else{
            
            dateview.isHidden = true
            dateviewheight.constant = 0.0
            
            totalheight = totalheight - 50.0
            
            topviewheight.constant = CGFloat(totalheight)
            
        }
        
        if (ridedetailsdata.data?.holderPickdropLocation?.visibility)!{
            
            locationview.isHidden = false
            locationviewheight.constant = 80.0
            
            pickuptext.text = ridedetailsdata.data?.holderPickdropLocation?.pickdropLocationData?.pickText
            
             droptext.text = ridedetailsdata.data?.holderPickdropLocation?.pickdropLocationData?.dropText
            
            
        }else{
            
            locationview.isHidden = true
            locationviewheight.constant = 0.0
            
            totalheight = totalheight - 80.0
            
            topviewheight.constant = CGFloat(totalheight)
            
        }
        
        if (ridedetailsdata.data?.holderMetering?.visibility)!{
            
            distancetimeview.isHidden = false
            distancetimeviewheight.constant = 40.0
            
            totalpricetext.text = ridedetailsdata.data?.holderMetering?.meteringData?.textOne
            
            distancetext.text = ridedetailsdata.data?.holderMetering?.meteringData?.textTwo
            
            timetext.text = ridedetailsdata.data?.holderMetering?.meteringData?.textThree
            
            
        }else{
            
            distancetimeview.isHidden = true
            distancetimeviewheight.constant = 0.0
            
            totalheight = totalheight - 40.0
            
            topviewheight.constant = CGFloat(totalheight)
            
        }
        
        if (ridedetailsdata.data?.holderUser?.visibility)!{
            
            driverdetailsview.isHidden = false
            driverdetailsheight.constant = 60.0
            
            driverimageview.makeViewCircular()
            
            
            let newString1 = ridedetailsdata.data?.holderUser?.userData?.circularimage
            
            
            AppConstants.downloadimage(imagename: newString1!, imageview: driverimageview, placeholderimage: "output1")
            
            drivernametext.text = ridedetailsdata.data?.holderUser?.userData?.highlightedText
            
            driveremailtext.text = ridedetailsdata.data?.holderUser?.userData?.smallText
            
            if (ridedetailsdata.data?.holderUser?.userData?.ratingVisibility)!{
                
                ratingvalue.isHidden = false
                
                if (ridedetailsdata.data?.holderUser?.userData?.ratingButtonEnable)!{
                    
                  
                     ratingvalue.editable = true
                    ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.userData?.ratingButtonText
                    
                    ratingtext.text = ridedetailsdata.data?.holderUser?.userData?.rating
                    
                    ratingvalue.rating = Float((ridedetailsdata.data?.holderUser?.userData?.rating)!)!
                    
                }else{
                    ratingvalue.editable = false
                    ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.userData?.ratingButtonText
                    
                    ratingtext.text = ridedetailsdata.data?.holderUser?.userData?.rating
                    
                    ratingvalue.rating = Float((ridedetailsdata.data?.holderUser?.userData?.rating)!)!
                    
                }
                
//                ratedrivertextlbl.text = ridedetailsdata.data?.holderUser?.userData?.ratingButtonText
//
//                ratingtext.text = ridedetailsdata.data?.holderUser?.userData?.rating
//
//                ratingvalue.rating = Float((ridedetailsdata.data?.holderUser?.userData?.rating)!)!
                
                
            }else{
                  ratingvalue.isHidden = true
                
            }
            
            
            
            
            
        }else{
            
            driverdetailsview.isHidden = true
            driverdetailsheight.constant = 0.0
            
            totalheight = totalheight - 60.0
            
            topviewheight.constant = CGFloat(totalheight)
            
        }
        
        if (ridedetailsdata.data?.holderReceipt?.visibility)!{
            
            tablecount = (ridedetailsdata.data?.holderReceipt?.receiptData?.count)!
            Detailstableview.reloadData()
        }else{
            
            tablecount = 0
            Detailstableview.reloadData()
            
        }
        
        
     
        if (ridedetailsdata.data?.buttonVisibility?.mailInvoice)!{
            
            firstview.isHidden = false
          firsttextlbl.text = "Mail Invoice".localized
            
            
        }else{
             firstview.isHidden = true
            
        }
        
        if (ridedetailsdata.data?.buttonVisibility?.cancel)!{
            
            secondview.isHidden = false
            secondtextlbl.text = "Cancel".localized
        }else{
            secondview.isHidden = true
            
        }
        
        if (ridedetailsdata.data?.buttonVisibility?.track)!{
            
            thirdview.isHidden = false
            thirdtextlbl.text = "Track Ride".localized
        }else{
            thirdview.isHidden = true
            
        }
        
        if (ridedetailsdata.data?.buttonVisibility?.support)!{
             fourthview.isHidden = false
            fourthtextlbl.text = "Support".localized
            
        }else{
            
            fourthview.isHidden = true
        }
        
        
        
        
    }
    
   
}

extension FullTripDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
        
        return tablecount
            
        }else{
            
            return newtablecount
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1{
        
        let cell = Detailstableview.dequeueReusableCell(withIdentifier: "ridecell", for: indexPath)
        
        let firsttext: UILabel = cell.contentView.viewWithTag(1) as! UILabel
        
        let secondtext: UILabel = cell.contentView.viewWithTag(2) as! UILabel
        
        
        if (ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].highlightedVisibility)!{
            
            firsttext.text = ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].highlightedText
            
            firsttext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].highlightedTextColor)!)
        }else{
            
            
        }
        
        if (ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].valueTextvisibility)!{
            
            secondtext.text = ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].valueText
            
            secondtext.textColor = PListUtility.getColorFromHex(hexString: "#" + (ridedetailsdata.data?.holderReceipt?.receiptData![indexPath.row].valueTextColor)!)
            
        }else{
            
            
        }
        
        return cell
            
        }else{
            let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
            
            
            let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
            
            firsttext.text = cancelreasondata.data![indexPath.row].reason
            
            let tableheight = hiddentableview.contentSize.height
            
            if tableheight < AppConstants.screenframeheight - 200.0{
                
                if checkcancelprice == "1"{
                     innerhiddenviewheight.constant = tableheight + 170.0
                    
                }else{
                     innerhiddenviewheight.constant = tableheight + 100.0
                }
                
                
               
                
            }else{
                
                innerhiddenviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            
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
        hiddentableview.reloadData()
        
        
            selectcancelreasonid = String((cancelreasondata.data![indexPath.row].id!))
        
        }
    }
    
    
}

extension FullTripDetailsViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        if let responseData = response as? CancelReasonModel{
            
            let data:CancelReasonModel = responseData
            
            cancelreasondata = data
            
            if cancelreasondata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                if cancelreasondata.cancelCharges == "0" || cancelreasondata.cancelCharges == ""{
                    checkcancelprice = "0"
                    forcancelchargeheight.constant = 0.0
                }else{
               
                
                forcancelchargeheight.constant = 50.0
                 checkcancelprice = "1"
                self.forcancellingchargetext.text = "For cancelling , you will be charged ".localized + AppConstants.currencysymbol + " " + cancelreasondata.cancelCharges!
                    
                }
                
                 hiddenview.isHidden = false
                
                newtablecount = (cancelreasondata.data?.count)!
                
                hiddentableview.reloadData()
                
                
                
                
            }else if cancelreasondata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
        }
        
        
        
        if let responseData = response as? RideDetailsModel{
            
            let data:RideDetailsModel = responseData
            
            ridedetailsdata = data
            
            if ridedetailsdata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                self.setdata()
            
                
                
            }else if ridedetailsdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
               
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? CancelRideModel{
            
            let data:CancelRideModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
              
                self.dismissVC()
                
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
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






