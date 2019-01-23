//
//  FavoriteLocationAddVC.swift
//  Apporio Taxi
//
//  Created by Apporio on 09/03/18.
//  Copyright © 2018 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class FavoriteLocationAddVC: BaseViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var viewFav: UIView!
    @IBOutlet weak var txtLocationName: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var segmentMenu: UISegmentedControl!
    @IBOutlet weak var otherNameFieldConst: NSLayoutConstraint!
    
    var getIndex = "1"
    
    var selectedindex = 0
    var strAddress: String?
   // var dataFav: Coupons!
    
   
    @IBOutlet weak var savebtntext: UIButton!
    
   // let Userid = NsUserDekfaultManager.SingeltionInstance.getuserdetaild(key: NsUserDekfaultManager.Keyuserid)

    //MARK: - ViewSetup
    
    func ViewSetup(){
        viewFav.layer.cornerRadius = 5.0
        //viewFav.layer.borderColor = Uic
        viewFav.layer.borderWidth = 1.0
     //   viewFav.edgeWithShadow()
        
    }
    
    
    //MARK: - Initialization
    
    func Initialization(){
        otherNameFieldConst.constant = 0
        
        
    }
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAddress.text = "Your address".localized
        txtLocationName.placeholder = "Enter Name".localized
        savebtntext.setTitle("Save".localized, for: UIControlState.normal)
        btnCancel.setTitle("Cancel".localized, for: UIControlState.normal)
        ViewSetup()
        Initialization()
        lblAddress.text = strAddress
        
        
        
    }

    
    //MARK: - Action
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        
        let CategoryValue = segmentMenu.selectedSegmentIndex + 1
        let CategoryStringValue = String(format: "%d", CategoryValue)
        
        if CategoryStringValue == "3"{
            
            if txtLocationName.text?.count == 0 {
                self.showErrorAlert("", alertMessage: "Please Enter Name For This Location".localized, VC: self)
               
                return
            }
            
        }
        
        
        if getIndex == "1" {
            
            
            
            
          
            
            
            
            
            let dic1 = ["latitude":AppConstants.userselectaddressLat as AnyObject,
                        "longitude":AppConstants.userselectaddressLng,
                        "location":AppConstants.userselectaddressLocation,
                        "category":CategoryStringValue,
                        "other_name":txtLocationName.text!
                
                
                
                ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERFAVOURITELOCATION
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: AddedFavouriteModel.self)
            
            
            
            

            
        } else {
            
            
           
            
            
            
            
            let dic1 = ["latitude":AppConstants.droplat[selectedindex],
                        "longitude":AppConstants.droplng[selectedindex],
                        "location":AppConstants.droplocation[selectedindex],
                        "category":CategoryStringValue,
                        "other_name":txtLocationName.text!
                
                
                
                ] as [String : AnyObject]
            
            
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERFAVOURITELOCATION
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: AddedFavouriteModel.self)
            
            
            

            
            
        }
        
    }
    
    
    @IBAction func segmentControll(_ sender: Any) {
    
        switch segmentMenu.selectedSegmentIndex
        {
        case 0:
                    self.otherNameFieldConst.constant = 0
            print("Segment 0 selected")
            
        case 1:
                    self.otherNameFieldConst.constant = 0
            print("Segment 1 selected")
            
        case 2:
                    self.otherNameFieldConst.constant = 30
            print("Segment 2 selected")
            
        default:
            break;
        }
        
    }
    
    
    
}


extension FavoriteLocationAddVC: ApiResponseReceiver{
    
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
       
        
        if let responseData = response as? AddedFavouriteModel{
            
            let data:AddedFavouriteModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
             
               
                self.dismiss(animated: true, completion: nil)
                
                
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
