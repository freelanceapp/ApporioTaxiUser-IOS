
//
//  LocationSearchVC.swift
//  Apporio Taxi
//
//  Created by Apporio on 12/03/18.
//  Copyright © 2018 apporio. All rights reserved.
//

import UIKit
import GooglePlaces
import ObjectMapper

class LocationSearchVC: BaseViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, GMSAutocompleteViewControllerDelegate{
    
    @IBOutlet weak var toplocationtextlbl: UILabel!
    
    @IBOutlet weak var tableViewfav: UITableView!
    
    var toastLabel: UILabel!
    
    var fromwhichscreen = ""
    
    
   var locationViewAdded : ViewFavouriteLocationModel!
    
    
    var userPickupLat = "0.0"
    var userPickupLong = "0.0"
   
    var strSelectAddress = ""
    
    var userDropLat = "0.0"
    var userDropLong = "0.0"
    
    
    @IBOutlet weak var txtLocationPlace: UITextField!
   // var deleteData: Coupons!
    
    var tablesize = 0
    
    @IBOutlet weak var donebtntext: UIButton!
    @IBOutlet weak var favouritestextlbl: UILabel!
  //  let Userid = NsUserDekfaultManager.SingeltionInstance.getuserdetaild(key: NsUserDekfaultManager.Keyuserid)
    
    var getIndex = ""
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toplocationtextlbl.text = "LOCATION".localized
        favouritestextlbl.text = "Favourites".localized
        
        txtLocationPlace.placeholder = "Search Location .....".localized
        donebtntext.setTitle("Done".localized, for: UIControlState.normal)
        
        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text =  "No Favorite Locations!".localized
        
        toastLabel.isHidden = true
        
        self.automaticallyAdjustsScrollViewInsets = true
        
        
        
     
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERVIEWFAVOURITE
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: ViewFavouriteLocationModel.self)
        
    
        
    }
    
    
    // MARK: - Table view datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablesize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewfav.dequeueReusableCell(withIdentifier: "CellLocation") as! CellLocation
        
        cell.lblAddress.text = locationViewAdded.data?[indexPath.row].location

        if locationViewAdded.data![indexPath.row].category == "1" {

            cell.imgLocationType?.image = UIImage(named: "Home-25 (3)")
            cell.imgLocationType?.clipsToBounds = true
            cell.lblLocationType.text = "Home"

        } else if locationViewAdded.data![indexPath.row].category == "2" {

            cell.imgLocationType?.image = UIImage(named: "icons8-business-60")
            cell.imgLocationType?.clipsToBounds = true
            cell.lblLocationType.text = "Work"


        } else {

            cell.imgLocationType?.image = UIImage(named: "icons8-place-marker-60 (1)")
            cell.imgLocationType?.clipsToBounds = true
            cell.lblLocationType.text = locationViewAdded.data?[indexPath.row].othername


        }

        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(ClickOnRemoveFavorite) , for: .touchUpInside)
        return cell

        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppConstants.newchecklocationvalue = "0"
        
        
        if self.fromwhichscreen == "addstop"{
            self.fromwhichscreen = ""
            AppConstants.droplat.append(self.locationViewAdded.data![indexPath.row].latitude!)
            AppConstants.droplng.append(self.locationViewAdded.data![indexPath.row].longitude!)
            AppConstants.droplocation.append(self.locationViewAdded.data![indexPath.row].location!)
             AppConstants.checklocationvalue = 2
            self.dismiss(animated: true, completion: nil)
        
        }else{
        
        
        if getIndex == "1" {
            
            AppConstants.userselectaddressLat = self.locationViewAdded.data![indexPath.row].latitude!
            AppConstants.userselectaddressLng = self.locationViewAdded.data![indexPath.row].longitude!
            AppConstants.checklocationvalue = 3
             AppConstants.checkfavvalue = 3
            AppConstants.userselectaddressLocation = self.locationViewAdded.data![indexPath.row].location!
            self.dismiss(animated: true, completion: nil)
        }
        
        if getIndex == "2" {
            
            
            if AppConstants.droplat.count == 1{
                AppConstants.droplat[0] = self.locationViewAdded.data![indexPath.row].latitude!
                AppConstants.droplng[0] = self.locationViewAdded.data![indexPath.row].longitude!
                AppConstants.droplocation[0] = self.locationViewAdded.data![indexPath.row].location!
                
                
                
            }else{
                            AppConstants.droplat.append(self.locationViewAdded.data![indexPath.row].latitude!)
                            AppConstants.droplng.append(self.locationViewAdded.data![indexPath.row].longitude!)
                            AppConstants.droplocation.append(self.locationViewAdded.data![indexPath.row].location!)
              
            }
            
            
            
//            AppConstants.droplat.append(self.locationViewAdded.data![indexPath.row].latitude!)
//            AppConstants.droplng.append(self.locationViewAdded.data![indexPath.row].longitude!)
//            AppConstants.droplocation.append(self.locationViewAdded.data![indexPath.row].location!)
             AppConstants.checkfavvalue = 2
            //  GlobalVarible.UserDropLat = self.userDropLat
            //  GlobalVarible.UserDropLng = self.userDropLong
            // GlobalVarible.UserDropLocationText = self.strSelectAddress
            
            AppConstants.checklocationvalue = 2
            self.dismiss(animated: true, completion: nil)
            
            
        }
            
            
            
        }

//        if getIndex == "1" {
//
//            GlobalVarible.PickUpLat = (self.locationViewAdded.details?[indexPath.row].lat)!
//            GlobalVarible.PickUpLng = (self.locationViewAdded.details?[indexPath.row].lng)!
//            GlobalVarible.Pickuptext = (self.locationViewAdded.details?[indexPath.row].location)!
//            GlobalVarible.checklocationvalue = 3
//            GlobalVarible.checkfavvalue = 3
//            self.dismiss(animated: true, completion: nil)
//        }
//
//        if getIndex == "2" {
//
//            GlobalVarible.UserDropLat = Double((self.locationViewAdded.details?[indexPath.row].lat)!)!
//            GlobalVarible.UserDropLng = Double((self.locationViewAdded.details?[indexPath.row].lng)!)!
//            GlobalVarible.UserDropLocationText = (self.locationViewAdded.details?[indexPath.row].location)!
//            GlobalVarible.checklocationvalue = 2
//            GlobalVarible.checkfavvalue = 2
//            self.dismiss(animated: true, completion: nil)
//        }
//
        
        
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func ClickOnRemoveFavorite(sender:AnyObject){
        
//        let alertController = UIAlertController(title: "Alert!".localized, message: "Are you sure to unfavorite this location?".localized, preferredStyle: UIAlertControllerStyle.alert)
//
//        //CREATING OK BUTTON
//
//        let OKAction = UIAlertAction(title: "YES".localized, style: .default) { (action:UIAlertAction!) in
//
//            print(sender.tag)
//
//            let favoriteLocationID  = self.locationViewAdded.details?[sender.tag].favouriteLocationId
//            ApiManager.sharedInstance.protocolmain_Catagory = self
//            ApiManager.sharedInstance.LocationRemove(favoriteId: favoriteLocationID!)
//
//        }
//        alertController.addAction(OKAction)
//
//        // Create Cancel button
//        let cancelAction = UIAlertAction(title: "NO".localized, style: .cancel) { (action:UIAlertAction!) in
//            print("Cancel button tapped");
//        }
//        alertController.addAction(cancelAction)
//
//        // Present Dialog message
//        self.present(alertController, animated: true, completion:nil)
    }
    

    
    
    //MARk: - Text Delegate 
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: false, completion: nil)
        
        
        
        return true
    }
    
    
    @IBAction func DoneButton(_ sender: Any) {
        
        
        if userPickupLat == "0.0" && userDropLat == "0.0"{

            AppConstants.newchecklocationvalue = "1"
         dismiss(animated: true, completion: nil)

        }else{

         AppConstants.newchecklocationvalue = "0"
            
            
             if self.fromwhichscreen == "addstop"{
                self.fromwhichscreen = ""
                AppConstants.droplat.append(self.userDropLat)
                AppConstants.droplng.append(self.userDropLong)
                AppConstants.droplocation.append(self.strSelectAddress)
                 AppConstants.checklocationvalue = 2
             }else{

        if getIndex == "1" {

            AppConstants.userselectaddressLat = self.userPickupLat
            AppConstants.userselectaddressLng = self.userPickupLong
            AppConstants.checklocationvalue = 3
            AppConstants.userselectaddressLocation = self.strSelectAddress

        }

        if getIndex == "2" {
            
            if AppConstants.droplat.count == 1{
                AppConstants.droplat[0] = self.userDropLat
                AppConstants.droplng[0] = self.userDropLong
                AppConstants.droplocation[0] = self.strSelectAddress

          
                
            }else{
                
                AppConstants.droplat.append(self.userDropLat)
                AppConstants.droplng.append(self.userDropLong)
                AppConstants.droplocation.append(self.strSelectAddress)
            }
            
          
            AppConstants.checklocationvalue = 2


        }

                
            }
     dismiss(animated: true, completion: nil)

        }
    }
    
    
    //MARK: -  Protocols
    
    
//    func onProgressStatus(value: Int) {
//        if(value == 0 ){
//            MBProgressHUD.hide(for: self.view, animated: true)
//        }else if (value == 1){
//            let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
//            spinnerActivity.label.text = "Loading".localized
//            spinnerActivity.detailsLabel.text = "Please Wait!!".localized
//            spinnerActivity.isUserInteractionEnabled = false
//
//        }
//    }
//
//    func onSuccessExecution(msg: String) {
//        print("\(msg)")
//    }
//
//
//    func onerror(msg : String) {
//        MBProgressHUD.hide(for: self.view, animated: true)
//
//        self.showalert(message: msg)
//
//    }
//
//
//    func onSuccessParse(data: AnyObject) {
//
//        if(GlobalVarible.Api == "viewAddedLocation"){
//
//
//            if let  locationViewAdded = data as? FavoriteLocModel{
//
//                self.locationViewAdded = locationViewAdded
//            if locationViewAdded.result == 1{
//
//                tablesize = (locationViewAdded.details?.count)!
////
////                if(tablesize > 0){
////
////
////                } else{
////
////                }
//                toastLabel.isHidden = true
//            }
//
//            else {
//
//                tablesize = 0
//                toastLabel.isHidden = false
//
//            }
//
//            self.tableViewfav.reloadData()
//
//            }
//        }
//
//
//        if(GlobalVarible.Api == "removeFavoriteLocation"){
//
//            if let deleteData = data as? Coupons{
//
//                self.deleteData = deleteData
//              if deleteData.result == 1{
//                self.showalert(message:deleteData.msg!)
//
//
//                ApiManager.sharedInstance.protocolmain_Catagory = self
//                ApiManager.sharedInstance.LocationAdded(UserId: Userid!)
//
//
//              } else {
//                self.showalert(message:deleteData.msg!)
//
//            }
//
//            }
//
//        }
//
//    }
//
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "ok", style: .default) { (action) in
                
            }
            
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
            }
            
            
        })
        
    }
    
}


extension LocationSearchVC {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place)
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        print("Place attributions: \(place.coordinate.latitude)")
        print("Place attributions: \(place.coordinate.longitude)")
        
        self.txtLocationPlace.text = "\(place.name)"
        //  manualloactioncheck = "manual"
        
        
        strSelectAddress = place.name
        
        
        if getIndex == "1"{
            

            userPickupLat = String(place.coordinate.latitude)
            userPickupLong = String(place.coordinate.longitude)
            
            
            
        }
        
        if getIndex == "2" {
            
               userDropLat = String(place.coordinate.latitude)
               userDropLong = String(place.coordinate.longitude)
            
            
        }
        
        
        if userPickupLat == "0.0" && userDropLat == "0.0"{

            AppConstants.newchecklocationvalue = "1"
            dismiss(animated: true, completion: nil)

        }else{
            
             if self.fromwhichscreen == "addstop"{
                self.fromwhichscreen = ""
                AppConstants.droplat.append(self.userDropLat)
                AppConstants.droplng.append(self.userDropLong)
                AppConstants.droplocation.append(self.strSelectAddress)
                
                 AppConstants.checklocationvalue = 2
             }else{

            AppConstants.newchecklocationvalue = "0"

            if getIndex == "1" {

                AppConstants.userselectaddressLat = self.userPickupLat
                AppConstants.userselectaddressLng = self.userPickupLong
                AppConstants.checklocationvalue = 3
                AppConstants.userselectaddressLocation = self.strSelectAddress

            }

            if getIndex == "2" {
                
                
                if AppConstants.droplat.count == 1{
                    AppConstants.droplat[0] = self.userDropLat
                    AppConstants.droplng[0] = self.userDropLong
                    AppConstants.droplocation[0] = self.strSelectAddress
                    
                    
                    
                }else{
                    
                    AppConstants.droplat.append(self.userDropLat)
                    AppConstants.droplng.append(self.userDropLong)
                    AppConstants.droplocation.append(self.strSelectAddress)
                }
                
                
//                AppConstants.droplat.append(self.userDropLat)
//                  AppConstants.droplng.append(self.userDropLong)
//                AppConstants.droplocation.append(self.strSelectAddress)

              //  GlobalVarible.UserDropLat = self.userDropLat
              //  GlobalVarible.UserDropLng = self.userDropLong
               // GlobalVarible.UserDropLocationText = self.strSelectAddress

                 AppConstants.checklocationvalue = 2


            }
                
            }
        }

        presentingViewController?.dismiss(animated: false, completion: nil)
        //dismiss(animated: false, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: false, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

extension LocationSearchVC: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        
        if let responseData = response as? ViewFavouriteLocationModel{
            
            let data:ViewFavouriteLocationModel = responseData
            
            locationViewAdded = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                tablesize = (data.data?.count)!
                
                tableViewfav.reloadData()
                
             
                
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



