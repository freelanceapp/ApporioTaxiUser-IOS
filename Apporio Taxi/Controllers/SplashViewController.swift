//
//  SplashViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import GoogleMaps

class SplashViewController: BaseViewController, CLLocationManagerDelegate {
    
    var timerForToken:Timer!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var centerimageview: UIImageView!
    
    @IBOutlet weak var gettinglocationtextlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettinglocationtextlbl.text = "getting location....".localized
        
        
        AppConstants.screenframeheight = UIScreen.main.bounds.size.height
        AppConstants.screenframewidth = UIScreen.main.bounds.size.width
        
        print("dfxcgvhbmjn\(AppConstants.screenframeheight)")
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.pausesLocationUpdatesAutomatically = false
        self.locationManager.requestAlwaysAuthorization()
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        self.locationManager.startUpdatingLocation()
        
        if ReachabilityManager.shared.isNetworkAvailable{
            
            self.timerForToken  = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(SplashViewController.getDeviceToken), userInfo: nil, repeats: true)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            reverseGeocodeCoordinate(location.coordinate)
            AppConstants.Lat = String(location.coordinate.latitude)
            AppConstants.Lng = String(location.coordinate.longitude)
           
            
        }
        
    }
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        
        // 1
        
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                let lines = address.lines
                AppConstants.Location = lines!.joined(separator: "\n")
                if let city = address.locality{
                    
                    AppConstants.usercityname  = String(city)
                    
                }
                else{
                    AppConstants.usercityname = "Dummy City"
                    
                }
                
                AppConstants.userselectaddressLng = String(coordinate.longitude)
                AppConstants.userselectaddressLat = String(coordinate.latitude)
                
                
                //   GlobalVariables.driverLocation = address.addressLine1()! + " , " + address.addressLine2()!
                
            }
        }
    }
    
    
    @objc func getDeviceToken(timer : Timer) {
        
        if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.UNIQUE_NUMBER)  && UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.PLAYER_ID){
            
            self.timerForToken.invalidate()
           
            
            
            let dic1 = ["device_id": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID),
                        "unique_no": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER),
                        "player_id": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.PLAYER_ID),
                        "device":"1",
                        "language_code":AppConstants.languagecode,
                        "c_long":AppConstants.Lng,
                        "apk_version":AppConstants.appversion,
                        "operating_system":"",
                        "manufacture":AppConstants.modelname,
                        "c_lat":AppConstants.Lat,
                        "package_name":AppConstants.appbundleid,
                        "model":AppConstants.modelname
                
                
               
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCONFIGURATION
            ServiceManager.sharedInstance.delegate = self
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: UserConfigureModel.self)
            
        } else {
            debugPrint("Device Token Not found..")
            
        }
        
    }
    
    

   

}


extension SplashViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? UserConfigureModel{
            let data:UserConfigureModel = responseData
            
            AppConstants.userconfiguredata = data
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
         
                
                
                if UserDefaultUtility.objectAlreadyExist(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN){
                    
                    
                    AppConstants.dicauthorization = ["Accept":"application/json",
                                                     "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                     "locale":AppConstants.languagecode
                        
                        ] as [String : AnyObject]
                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: MapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                    
                   
                }else{
                    
                    presentVC("LoginViewController")
                    
                }
                
                
                
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
