//
//  AddNewCardViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 27/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import Stripe
import ObjectMapper

class AddNewCardViewController: BaseViewController,UITextFieldDelegate {
    
    @IBOutlet weak var cardNoField: UITextField!
    
    @IBOutlet weak var nextbtnview: UIView!
    @IBOutlet weak var nextbtntext: UIButton!
    @IBOutlet weak var mmyyyytextlbl: UILabel!
    @IBOutlet weak var entercardnumbertextlbl: UILabel!
    @IBOutlet weak var topaddcardtextlbl: UILabel!
    
    @IBOutlet weak var CvvField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    
    let card: STPCardParams = STPCardParams()

    @IBOutlet weak var cvvtextlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topaddcardtextlbl.text = "Add Card".localized
        entercardnumbertextlbl.text = "ENTER CARD NUMBER".localized
        nextbtntext.setTitle("NEXT".localized, for: UIControlState.normal)
        mmyyyytextlbl.text = "MM/YYYY".localized
        cvvtextlbl.text = "CVV".localized

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
         self.dismissVC()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == self.monthField{
            if string == ""
            {
                
                return true
            }
                //Put / space after 2 digit
            else if val.count == 3
            {
                print(val)
                
                self.monthField.text = self.monthField.text! + " / "
                
            }
                
                //Check for max length including the spacers we added
            else if (val.count) > 9
            {
                
                return false
            }
            
        }
        else if textField == self.cardNoField{
            if string == ""
            {
                
                return true
            }
                
                
                //Check for max length including the spacers we added
            else if (val.count) > 19
            {
                
                return false
            }
                
                //Put / space after 2 digit
            else if val.count == 5
            {
                print(val)
                
                self.cardNoField.text = self.cardNoField.text! + "-"
                
            }
            else if val.count == 10
            {
                print(val)
                
                self.cardNoField.text = self.cardNoField.text! + "-"
                
            }
            else if val.count == 15
            {
                print(val)
                
                self.cardNoField.text = self.cardNoField.text! + "-"
                
            }
        }
        else if  textField == self.CvvField{
            //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
            if string == ""
            {
                
                return true
            }
                
                //Check for max length including the spacers we added
            else if (val.count) > 3
            {
                
                return false
            }
            else{
                return true
            }
            
        }
        else{
            return true
        }
        return true
        
    }
    
   
    @IBAction func nextbtnclick(_ sender: Any) {
        
        
        if self.cardNoField.text == "" || self.monthField.text == "" || self.CvvField.text == "" {
            
            self.showErrorAlert("", alertMessage: "Please enter the required details".localized, VC: self)
            
         
        }else{
            
            let textarray = self.monthField.text!.components(separatedBy: " / ")
            
            
            print(textarray[0])
             print(textarray[1])
            print(self.cardNoField.text!)
             print(self.CvvField.text!)
            
            card.number = self.cardNoField.text!
            card.expMonth = UInt(textarray[0])!
            card.expYear = UInt(textarray[1])!
            card.name = "test"
            card.cvc = self.CvvField.text!
            
            getStripeToken(card: card)
            
        }
    }
    
}


extension AddNewCardViewController: CardIOPaymentViewControllerDelegate{
    
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        
    }
    
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
//        if let info = cardInfo {
//
//            //create Stripe card
//            let card: STPCardParams = STPCardParams()
//            card.number = self.cardNoField.text!
//            card.expMonth = self.monthField.text!
//            card.expYear = info.expiryYear
//            card.name = info.cardholderName
//            card.cvc = self.cardNoField.text!
//
//
//
//
//            //Send to Stripe
//            getStripeToken(card: card , resultCode: 0)
//
//
//        }
//
       // paymentViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func getStripeToken(card:STPCardParams) {
        
       
        STPAPIClient.shared().createToken(withCard: card) { token, error in
            if let token = token {
                print(token)
                
               
                
                
                let dic1 = ["payment_option":"STRIPE",
                            "token":token
                    
                    
                    ] as [String : AnyObject]
                
                
                
                self.showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERSAVECARD
                ServiceManager.sharedInstance.delegate = self
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DeleteCardModel.self)
                
                // SVProgressHUD.showSuccessWithStatus("Stripe token successfully received: \(token)")
                //  self.placeOrder(token)
            } else {
                print(error!)
                // SVProgressHUD.showErrorWithStatus(error?.localizedDescription)
            }
        }
        
        
    }
    
    
    
}


extension AddNewCardViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
    
        
        if let responseData = response as? DeleteCardModel{
            
            let data:DeleteCardModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
         
                
                 AppConstants.tokenvalue = 1
                self.dismissVC()
                
                
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

