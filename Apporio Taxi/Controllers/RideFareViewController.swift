//
//  RideFareViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 21/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars
import ObjectMapper
import AlamofireImage

class RideFareViewController: BaseViewController,RatingViewDelegate {
    
    @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
    
    @IBOutlet weak var hiddenviewokbtntext: UIButton!
    @IBOutlet weak var hiddenviewpaymentoptiontext: UILabel!
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var hiddentableview: UITableView!
    
    @IBOutlet weak var hiddenviewheight: UIView!
     var check = 0
    
    @IBOutlet weak var hiddeninnerviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var paymentpendingviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var topheaderview: UIView!
    
    var userrecieptdata: UserRecieptModel!
    
    @IBOutlet weak var paymentpendingtextlbl: UILabel!
    
    @IBOutlet weak var paymentpendingview: UIView!
    @IBOutlet weak var servicetypetextheight: NSLayoutConstraint! //24
    var ratingValue: String = ""
     var rating: Float = 0.0
    
    @IBOutlet weak var carimageviewheight: NSLayoutConstraint!//50
    
    @IBOutlet weak var cartypetextheight: NSLayoutConstraint!//22
    
    @IBOutlet weak var distancetextview: UIView!
    
    @IBOutlet weak var totalpricetextheight: NSLayoutConstraint!//45
    
    @IBOutlet weak var pickuplocationviewheight: NSLayoutConstraint!//40
    
    @IBOutlet weak var droplocationview: UIView!
   
    @IBOutlet weak var droplocationviewheight: NSLayoutConstraint!//40
    
  //  @IBOutlet weak var billdetailstextheight: NSLayoutConstraint!//24
    
    @IBOutlet weak var pickuplocationview: UIView!
    @IBOutlet weak var distancetextviewheight: NSLayoutConstraint!//28
    
    @IBOutlet weak var timetextviewheight: NSLayoutConstraint!//28
    
    @IBOutlet weak var timetextview: UIView!
    
    @IBOutlet weak var favouritebtnviewheight: NSLayoutConstraint!//60
    
    
    @IBOutlet weak var bottomviewheight: NSLayoutConstraint!//270
    
    
    var selectpaymentoption = ""
    
    var cardid = ""
    
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var topviewheight: NSLayoutConstraint!
    @IBOutlet weak var favouritedriverview: UIView!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var bottominnerview: UIView!
    @IBOutlet weak var completebtnview: UIView!
    
    var firstviewheight: CGFloat?
    
    var secondviwheight: CGFloat?
    
    
    @IBOutlet weak var toptableview: UITableView!
    
    @IBOutlet weak var addthisdrivertoyourfavouritetext: UILabel!
    
    @IBOutlet weak var driverfavouriteimage: UIImageView!
    
    
    @IBOutlet weak var servicetypetext: UILabel!
    
    @IBOutlet weak var cartypetext: UILabel!
    
    @IBOutlet weak var carimageview: UIImageView!
    
    @IBOutlet weak var totalpricetext: UILabel!
    
    @IBOutlet weak var distancetext: UILabel!
    
    @IBOutlet weak var timetext: UILabel!
    
    
    var tablecount = 0
    
    var newtablecount = 0
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    
   // @IBOutlet weak var billdetailstextlbl: UILabel!
    
    @IBOutlet weak var billdetailstableview: UITableView!
    
    
    @IBOutlet weak var drivernametext: UILabel!
    
    
    @IBOutlet weak var commentifanytext: UITextField!
    
    @IBOutlet weak var userrating: RatingView!
    
    @IBOutlet weak var driverimageview: UIImageView!
    
    @IBOutlet weak var completebtntext: UIButton!
    @IBOutlet weak var submitbtntext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        hiddenviewpaymentoptiontext.text = "Select Payment Option".localized
        hiddenviewcancelbtntext.setTitle("CANCEL".localized, for: UIControlState.normal)
        hiddenviewokbtntext.setTitle("OK".localized, for: UIControlState.normal)
        addthisdrivertoyourfavouritetext.text = "Add this driver to your favourite".localized
        paymentpendingtextlbl.text = "Payment Pending".localized
        commentifanytext.placeholder = "comment if any".localized
        submitbtntext.setTitle("Submit".localized, for: UIControlState.normal)
        completebtntext.setTitle("Complete".localized, for: UIControlState.normal)
        
        
    
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        hiddenview.isHidden = true
    
        userrating.editable = true
        userrating.delegate = self
        
        firstviewheight = 320.0
        
        secondviwheight = 450.0
        
       paymentpendingview.isHidden = true
        
        driverfavouriteimage.image = UIImage(named: "icons8-heart-outline-50")
        
        topview.edgeWithOutShadow(edge: 4.0)
        bottominnerview.edgeWithOutShadow(edge: 4.0)
        favouritedriverview.edgeWithOutShadow(edge: 4.0)
        
       
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERRECEIPT
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserRecieptModel.self)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ratingView(_ ratingView: RatingView, didChangeRating newRating: Float) {
        print("newRating: \(newRating)")
        rating = newRating
        ratingValue = String(rating)
       
    }
    
    @IBAction func hiddenokbtnclick(_ sender: Any) {
         hiddenview.isHidden = true
        
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    "card_id":cardid,
                    "payment_method_id":selectpaymentoption,
                    "success":"1"
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGMAKEPAYMENT
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: MakePaymentModel.self)
        
        
    }
    
    @IBAction func hiddencancelbtnclick(_ sender: Any) {
        hiddenview.isHidden = true
    }
    
    
    @IBAction func addfavouritebtn(_ sender: Any) {
        
        
        
        
        
        
        let dic1 = ["booking_id":AppConstants.bookingId,
                    "driver_id":userrecieptdata.data?.holderDriverFavourite?.favouriteData?.driverId!
                    
            
            
            
            ] as [String : AnyObject]
        
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERADDFAVOURITEDRIVER
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: AddDriverFavouriteModel.self)
        
    }
    
    @IBAction func completebtnclick(_ sender: Any) {
        
         if (userrecieptdata.data?.holderBottomButton?.action == "SELECT_PAYMENT"){
            
            hiddenview.isHidden = false
            
            selectpaymentoption = String((userrecieptdata.data?.holderBottomButton?.paymentData![0].id!)!)
            
            cardid = (userrecieptdata.data?.holderBottomButton?.paymentData![0].cardId)!
            
            newtablecount = (userrecieptdata.data?.holderBottomButton?.paymentData?.count)!
            
            hiddentableview.reloadData()
            
            
         }else  if (userrecieptdata.data?.holderBottomButton?.action == "MAKE_PAYMENT"){
            
         }else{
        
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: {
            AppConstants.viewcontrollerself.viewDidLoad()
        })
            
        }
        
        
    }
    
    @IBAction func ratingsubmitbtnclick(_ sender: Any) {
        
       
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    "rating":ratingValue,
                    "comment":commentifanytext.text!
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGRATEDRIVER
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: SubmitRatingModel.self)
        
        
        
    }
    
    
    func setdataonview(){
        
        servicetypetext.text = userrecieptdata.data?.holderRideInfo?.circularTextOne
        
        if (userrecieptdata.data?.holderRideInfo?.circularImageVisibility)!{
            carimageview.isHidden = false
            carimageviewheight.constant = 50.0
            
            
            
            let newString = userrecieptdata.data?.holderRideInfo?.circularImage
            
            AppConstants.downloadimage(imagename: newString!, imageview: carimageview, placeholderimage: "output1")
            
            
            
        }else{
            carimageview.isHidden = true
            carimageviewheight.constant = 0.0
            firstviewheight = firstviewheight! - 50.0
            
            
        }
        
        if (userrecieptdata.data?.holderRideInfo?.circularTextVisibility)!{
            
            cartypetext.isHidden = false
            cartypetextheight.constant = 22.0
            cartypetext.text = userrecieptdata.data?.holderRideInfo?.circularText
            cartypetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderRideInfo?.circularTextColor)!)
            
            
        }else{
            cartypetext.isHidden = true
            cartypetextheight.constant = 0.0
            firstviewheight = firstviewheight! - 22.0
            
        }
        
        
        if (userrecieptdata.data?.holderRideInfo?.valueTextVisibility)!{
            
            totalpricetext.isHidden = false
            totalpricetextheight.constant = 45.0
            totalpricetext.text = userrecieptdata.data?.holderRideInfo?.valueText
            totalpricetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderRideInfo?.valueTextColor)!)
            
            
        }else{
            totalpricetext.isHidden = true
            totalpricetextheight.constant = 0.0
            firstviewheight = firstviewheight! - 45.0
            
        }
        
        if (userrecieptdata.data?.holderRideInfo?.leftTextVisibility)!{
            
            distancetextview.isHidden = false
            distancetextviewheight.constant = 28.0
            distancetext.text = userrecieptdata.data?.holderRideInfo?.leftText
            distancetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderRideInfo?.leftTextColor)!)
            
            
        }else{
            distancetext.isHidden = true
            distancetextviewheight.constant = 0.0
            firstviewheight = firstviewheight! - 28.0
            
        }
        
        if (userrecieptdata.data?.holderRideInfo?.rightTextVisibility)!{
            
            
            timetextview.isHidden = false
            timetextviewheight.constant = 28.0
            timetext.text = userrecieptdata.data?.holderRideInfo?.rightText
            timetext.textColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderRideInfo?.rightTextColor)!)
            
            
        }else{
            timetextview.isHidden = true
            timetextviewheight.constant = 0.0
            firstviewheight = firstviewheight! - 28.0
            
        }
        
        
        if (userrecieptdata.data?.holderRideInfo?.pickLocationVisibility)!{
            
            
            pickuplocationview.isHidden = false
            pickuplocationviewheight.constant = 40.0
            pickuplocationtext.text = userrecieptdata.data?.holderRideInfo?.pickLocaion
           
            
            
        }else{
            pickuplocationview.isHidden = true
            pickuplocationviewheight.constant = 0.0
            firstviewheight = firstviewheight! - 40.0
            
        }
        
        if (userrecieptdata.data?.holderRideInfo?.dropLocationVisibility)!{
            
            
            droplocationview.isHidden = false
            droplocationviewheight.constant = 40.0
            droplocationtext.text = userrecieptdata.data?.holderRideInfo?.dropLocation
            
            
            
        }else{
            droplocationview.isHidden = true
            droplocationviewheight.constant = 0.0
            firstviewheight = firstviewheight! - 40.0
            
        }
        
        
        if (userrecieptdata.data?.holderDriverFavourite?.visibility)!{
            
            favouritedriverview.isHidden = false
            favouritebtnviewheight.constant = 60.0
           // secondviwheight = secondviwheight! + 60.0
            
            
        }else{
            
            favouritedriverview.isHidden = true
            favouritebtnviewheight.constant = 0.0
            secondviwheight = secondviwheight! - 60.0
            
            
        }
        
        
        if (userrecieptdata.data?.holderDriverRating?.visibility)!{
            
            bottomview.isHidden = false
            bottomviewheight.constant = 270.0
           
            secondviwheight = secondviwheight! + 300.0
            driverimageview.makeViewCircular()
            
            
            let newString = userrecieptdata.data?.holderDriverRating?.driverData?.image
            
            
            AppConstants.downloadimage(imagename: newString!, imageview: driverimageview, placeholderimage: "output1")
            
            drivernametext.text = userrecieptdata.data?.holderDriverRating?.driverData?.text
            
            
            
        }else{
            
            bottomview.isHidden = true
            bottomviewheight.constant = 0.0
            secondviwheight = secondviwheight! - 270.0
            
            
        }
        
        
        if (userrecieptdata.data?.holderBottomButton?.action == "SELECT_PAYMENT"){
            
            paymentpendingview.isHidden = false
            paymentpendingviewheight.constant = 50.0
            
            
            
            completebtnview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderBottomButton?.bottomButtonColor)!)
            
            completebtntext.setTitle(userrecieptdata.data?.holderBottomButton?.text!, for: UIControlState.normal)
            
            completebtntext.setTitleColor(PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderBottomButton?.textColor)!), for: UIControlState.normal)
            
            
        }else if(userrecieptdata.data?.holderBottomButton?.action == "MAKE_PAYMENT") {
            
            paymentpendingview.isHidden = false
            paymentpendingviewheight.constant = 50.0
           //  secondviwheight = secondviwheight! + 50.0
            
            
            completebtnview.backgroundColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderBottomButton?.bottomButtonColor)!)
            
            completebtntext.setTitle(userrecieptdata.data?.holderBottomButton?.text!, for: UIControlState.normal)
            
            completebtntext.setTitleColor(PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderBottomButton?.textColor)!), for: UIControlState.normal)
            
            
        }else{
            
            paymentpendingviewheight.constant = 0.0
             secondviwheight = secondviwheight! - 50.0
            
                completebtnview.backgroundColor = PListUtility.getColorFromHex(hexString: (userrecieptdata.data?.holderBottomButton?.bottomButtonColor)!)
            
              completebtntext.setTitle(userrecieptdata.data?.holderBottomButton?.text!, for: UIControlState.normal)
            
               completebtntext.setTitleColor(PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderBottomButton?.textColor)!), for: UIControlState.normal)
            
             paymentpendingview.isHidden = true
            
        }
       
        
        
        tablecount = (userrecieptdata.data?.holderRideInfo?.staticValues?.count)!
        
        billdetailstableview.reloadData()
        
    
        
    }
    
    
    
    
}


extension RideFareViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 3{
        
        return newtablecount
        }else{
        
        return tablecount
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         if tableView.tag == 3{
            
            let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
            
            
            let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
            
            firsttext.text = userrecieptdata.data?.holderBottomButton?.paymentData![indexPath.row].name
            
            let tableheight = hiddentableview.contentSize.height
            
            if tableheight < AppConstants.screenframeheight - 200.0{
                
                hiddeninnerviewheight.constant = tableheight + 100.0
                
            }else{
                
                hiddeninnerviewheight.constant = AppConstants.screenframeheight - 200.0
            }
            
            if(check == indexPath.row)
            {
                
                imageview.image = UIImage(named: "Circled Dot-35 (1)")
                
            }else{
                imageview.image = UIImage(named: "Circle Thin-35 (1)")
                
            }
            
            
            
            return cell1
            
            
            
         }
         
        
         else{
            
            let cell = billdetailstableview.dequeueReusableCell(withIdentifier: "billcell", for: indexPath)
            
            
            let firsttext: UILabel = cell.contentView.viewWithTag(1) as! UILabel
            
            let secondtext: UILabel = cell.contentView.viewWithTag(2) as! UILabel
            
            if (userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].highlightedVisibility)!{
                
                firsttext.text = userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].highlightedText
                
                firsttext.textColor = PListUtility.getColorFromHex(hexString: "#" + (userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].highlightedTextColor)!)
                
                
            }else{
                
                
            }
            
            
            if (userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].valueTextvisibility)!{
                
                
                secondtext.text = userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].valueText
                
                secondtext.textColor = PListUtility.getColorFromHex(hexString: (userrecieptdata.data?.holderRideInfo?.staticValues![indexPath.row].valueTextColor)!)
                
            }else{
                
                
            }
            
            
            
            
            let tableheight = billdetailstableview.contentSize.height + firstviewheight!
            
            
            topviewheight.constant = tableheight
            
            let headerView = toptableview.tableHeaderView!
            
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            
            var frame = headerView.frame
            frame.size.height = tableheight + secondviwheight!
            headerView.frame = frame
            
            toptableview.tableHeaderView = headerView
            
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView.tag == 3{
            hiddentableview.deselectRow(at: indexPath, animated: true)
            check = indexPath.row
            hiddentableview.reloadData()
            
            selectpaymentoption = String((userrecieptdata.data?.holderBottomButton?.paymentData![indexPath.row].id!)!)
            
            cardid = (userrecieptdata.data?.holderBottomButton?.paymentData![indexPath.row].cardId)!
            
           // selectcountrycodetext = (AppConstants.userconfiguredata.data?.countries![indexPath.row].phonecode)!
            
        }else{
            
            
        }
    }
    
    
}


extension RideFareViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? UserRecieptModel{

            let data:UserRecieptModel = responseData

            userrecieptdata = data

            if userrecieptdata.result == "1" {

                hideLoaderWithoutBackground()
                
                
              
                self.setdataonview()
                
               
                
               // drivernametext.textColor =  PListUtility.getColorFromHex(hexString: "#000000")
                

            }else if userrecieptdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: userrecieptdata.message!, VC: self)

            }

        
        }
        
        
        if let responseData = response as? AddDriverFavouriteModel{
            
            let data:AddDriverFavouriteModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
              driverfavouriteimage.image = UIImage(named: "icons8-heart-outline-48")
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: userrecieptdata.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? MakePaymentModel{
            
            let data:MakePaymentModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
               
                
                let dic1 = ["booking_id": AppConstants.bookingId,
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERRECEIPT
                ServiceManager.sharedInstance.delegate = self
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserRecieptModel.self)
                
                
               
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: userrecieptdata.message!, VC: self)
                
            }
            
            
        }
        
        
        
        if let responseData = response as? SubmitRatingModel{
            
            let data:SubmitRatingModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                
              
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
                
                
                
                // drivernametext.textColor =  PListUtility.getColorFromHex(hexString: "#000000")
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: userrecieptdata.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
}

