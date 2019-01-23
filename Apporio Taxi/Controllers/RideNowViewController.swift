//
//  RideNowViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 17/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import AlamofireImage
import ObjectMapper

class RideNowViewController: BaseViewController {
    
    
    
    
    @IBOutlet weak var confirmbtntext: UIButton!
    
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var farepolicytextlbl: UILabel!
    
    @IBOutlet weak var farewillbeadjustextlbl: UILabel!
    @IBOutlet weak var notefaretextlbl: UILabel!
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var innerhiddenview: UIView!
    
    var tablecount = 0
    
    
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var infoimageview: UIImageView!
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var mapimageview: UIImageView!
    @IBOutlet weak var droplocationtext: UILabel!
    @IBOutlet weak var bottomconfirmbtnview: UIView!
    
    @IBOutlet weak var topmapimageview: UIView!
    
    @IBOutlet weak var paymentmethodtext: UILabel!
    
    @IBOutlet weak var applycoupontext: UILabel!
    
    @IBOutlet weak var firstviewfirstlbltext: UILabel!
    
    @IBOutlet weak var firstviewsecondlbltext: UILabel!
    
    @IBOutlet weak var firstviewthirdlbltext: UILabel!
    
    @IBOutlet weak var secondviewfirstlbltext: UILabel!
    
    @IBOutlet weak var secondviewthirdlbltext: UILabel!
    @IBOutlet weak var secondviewsecondlbltext: UILabel!
    @IBOutlet weak var cartypename: UILabel!
    @IBOutlet weak var carimageview: UIImageView!
    
    
    var paymentoptionid = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        farepolicytextlbl.text = "Fare Policy".localized
        farewillbeadjustextlbl.text = "Fare will be adjusted with based on our pricing policy and other necessary requirements.".localized
        notefaretextlbl.text = "Note : Fare may change".localized
        confirmbtntext.setTitle("Confirm", for: UIControlState.normal)
        
        
        topmapimageview.edgeWithShadow(edge: 4)
        
        bottomconfirmbtnview.edgeWithShadow(edge: 4)
        
        hiddenview.isHidden = true
        
       
        self.setdata()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func hiddencancelbtn(_ sender: Any) {
         hiddenview.isHidden = true
    }
    
    @IBAction func infobtnclick(_ sender: Any) {
        
        
        if tablecount == 0{
            hiddenview.isHidden = true
            
        }else{
            hiddenview.isHidden = false
            
        }
            
        
           
       
        
            
            
       
        
        
        
        
        
        
    }
    
    func setdata(){
        
        
        tablecount = (AppConstants.Ridenowcheckoutmodeldata.data?.staticValues?.count)!
        
        if tablecount == 0{
            infoimageview.isHidden = true
            
        }else{
            infoimageview.isHidden = false
            
        }
        
        
        let newString = AppConstants.Ridenowcheckoutmodeldata.data?.vehicleTypeImage
        
        let phonewidth = Int(self.topmapimageview.frame.width)
        let phoneheight = Int(self.topmapimageview.frame.height) - 60
        
        
        
        AppConstants.downloadimage(imagename: newString!, imageview: carimageview, placeholderimage: "output1")
        
        
        
        let newString1 = (AppConstants.Ridenowcheckoutmodeldata.data?.mapImage)! + "&size=\(phonewidth)x\(phoneheight)"
        
        print(newString1)
        
        
        
        
        let url12 = removeSpecialCharsFromString(newString1)
        
        
        
        let url15 = NSURL(string: url12)
        
        
        
        
        mapimageview.af_setImage(withURL:
            url15! as URL,
                                 placeholderImage: UIImage(named: "dress"),
                                 filter: nil,
                                 imageTransition: .crossDissolve(1.0))
        
        pickuplocationtext.text = AppConstants.Ridenowcheckoutmodeldata.data?.pickupLocation
        
        droplocationtext.text = AppConstants.Ridenowcheckoutmodeldata.data?.dropLocation
        
        
        applycoupontext.text = AppConstants.Ridenowcheckoutmodeldata.data?.promoHeading
        
        self.paymentoptionid = (AppConstants.Ridenowcheckoutmodeldata.data?.selectedPaymentMethod?.id)!
        
        paymentmethodtext.text = AppConstants.Ridenowcheckoutmodeldata.data?.selectedPaymentMethod?.name
        
        firstviewfirstlbltext.text = AppConstants.Ridenowcheckoutmodeldata.data?.estimatesHeaderText
        
        firstviewsecondlbltext.text = AppConstants.Ridenowcheckoutmodeldata.data?.estimateTime
        
        firstviewthirdlbltext.text = "( " + (AppConstants.Ridenowcheckoutmodeldata.data?.estimateDistance)! + " )"
        
        secondviewfirstlbltext.text = "Est. Fare".localized
        
        secondviewsecondlbltext.text =  AppConstants.Ridenowcheckoutmodeldata.data?.estimateBill
        
        secondviewthirdlbltext.text = AppConstants.Ridenowcheckoutmodeldata.data?.discountedAmout
        
        cartypename.text = AppConstants.Ridenowcheckoutmodeldata.data?.vehicleTypeName
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        

        
        
        if(AppConstants.paymentoptionselect == 1){
            self.setdata()
            
            AppConstants.paymentoptionselect = 0
            
        }
        
        
        if(AppConstants.couponcodevalue == 1){
            
            self.setdata()
            //applycoupontext.text = "Coupon Applied  ".localized +   GlobalVarible.CouponCode
            AppConstants.couponcodevalue = 0
            
        }
        
    }
    
    func removeSpecialCharsFromString(_ text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_@/%?//&[]")
        return String(text.filter {okayChars.contains($0) })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtn(_ sender: Any) {
        dismissVC()
    }
    
    @IBAction func confirmbtn(_ sender: Any) {
        
        if self.paymentoptionid == ""{
            
            self.showErrorAlert("", alertMessage: "Please select payment method first.".localized, VC: self)
            
        }else{
        
        
       
        
        let dic1 = ["checkout": AppConstants.checkoutid,
              
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCONFIRM
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
        
        }
    }
    
    @IBAction func selectpaymentmethodbtn(_ sender: Any) {
        
        self.presentVC("SelectPaymentMethodViewController")
        
    }
    
    @IBAction func applycouponbtnclick(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let couponcodeviewcontroller = storyBoard.instantiateViewController(withIdentifier: "CouponsCodeViewController") as! CouponsCodeViewController
        couponcodeviewcontroller.viewcontrollerself = self
        couponcodeviewcontroller.modalPresentationStyle = .overCurrentContext
        //  paymentviewcontroller.modalPresentationStyle = .Popover
        self.present(couponcodeviewcontroller, animated:true, completion:nil)
        
        
    }
    
}

extension RideNowViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {

        if let responseData = response as? RideNowCheckoutModel{
            
            let data:RideNowCheckoutModel = responseData
            
            AppConstants.Ridenowcheckoutmodeldata = data
            
            if AppConstants.Ridenowcheckoutmodeldata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                if AppConstants.Ridenowcheckoutmodeldata.data?.bookingType == "2"{
                    
                    if  AppConstants.movefromoutstation == "1"{
                        AppConstants.BookingType = ""
                        AppConstants.checkoutid = ""
                         AppConstants.movefromoutstation = ""
                        self.presentingViewController?.presentingViewController?.dismissVC()
                        
                    }else{
                    
                     self.dismissVC()
                    AppConstants.BookingType = ""
                    AppConstants.checkoutid = ""
                        
                    }
                }else{
                
                
                 AppConstants.ridebooksuccessfully = 1
                    AppConstants.bookingId = String((AppConstants.Ridenowcheckoutmodeldata.data?.id!)!)

                    self.dismissVC()
                    
                }
                
            }else if AppConstants.Ridenowcheckoutmodeldata.result == "999" {
                
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

extension RideNowViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
        
        
        let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
        
        let firsttext1: UILabel = cell1.contentView.viewWithTag(1) as! UILabel
        
        
        
        if (AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].highlightedVisibility)!{
            
            firsttext.text = AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].highlightedText
            
            firsttext.textColor = PListUtility.getColorFromHex(hexString: "#" + (AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].highlightedTextColor)!)
            
            
        }else{
            
            
        }
        
        
        if (AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].valueTextvisibility)!{
            
            
            firsttext1.text = AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].valueText
            
            firsttext1.textColor = PListUtility.getColorFromHex(hexString: (AppConstants.Ridenowcheckoutmodeldata.data?.staticValues![indexPath.row].valueTextColor)!)
            
        }else{
            
            
        }
        
        
        
        
        
        
        let tableheight = hiddentableview.contentSize.height
        
        
        
        
        if tableheight < AppConstants.screenframeheight - 250.0{
            
            innerhiddenviewheight.constant = tableheight + 200.0
            
        }else{
            
            innerhiddenviewheight.constant = AppConstants.screenframeheight - 250.0
        }
        
       
        
        
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
      
       
}

}

