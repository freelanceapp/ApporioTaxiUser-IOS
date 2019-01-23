//
//  LocationServiceManager.swift
//  Wapanda
//
//  Created by daffomac-31 on 24/07/17.
//  Copyright © 2017 Wapanda. All rights reserved.
//
import Foundation
import CoreLocation
import UIKit



 
//extension WelcomeViewProtocol
//{
//    func receivedAddressFromLocation(_ address:String){}
//}
//

class LocationServiceManager: NSObject, CLLocationManagerDelegate{
    
    
    static let sharedInstance = LocationServiceManager()
    var currentLocation: CLLocation?
    
    var UserLocationUpdateTimer: Timer!
 
//    weak var viewDelegate: WelcomeViewProtocol?
    
    private var manager = CLLocationManager()
    
    

    private func configureLocationServices(){
        self.checkForUserPermissions()

    }
    
    //MARK: Location Manager Delegate
    private func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == .authorizedAlways || status == .authorizedWhenInUse {

            manager.startUpdatingLocation()
            manager.delegate = self

            
        }
        else{
            self.checkForUserPermissions()
        }
    }
    
    func checkForUserPermissions(){
        manager.delegate = self

        switch CLLocationManager.authorizationStatus()
        {
        case .authorizedAlways:
                   // viewDelegate?.showLoading()
            manager.startUpdatingLocation()
            LocationServiceManager.sharedInstance.startDriverUpdateTimer(withtimeInterVal: 3)
            break
        case .notDetermined:
                   // viewDelegate?.showLoading()
            manager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            LocationServiceManager.sharedInstance.startDriverUpdateTimer(withtimeInterVal: 3)
            break
        case .restricted, .denied:
            
            print("")
          //  viewDelegate?.hideLoading()
          //  self.viewDelegate!.showControllerWithVC(ErrorMessage: AppConstants.ScreenSpecificConstant.WelcomeScreen.MESSAGE_LOCATION_SERVICE_DISABLED)
            
            
            
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.currentLocation = locations.last
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    
    func startDriverUpdateTimer(withtimeInterVal timeInterVal:TimeInterval)
    {
        if let _ = self.UserLocationUpdateTimer
        {
            self.UserLocationUpdateTimer.invalidate()
            self.UserLocationUpdateTimer = nil
        }
        
        
        self.UserLocationUpdateTimer = Timer.scheduledTimer(timeInterval: timeInterVal, target: self, selector: #selector(sendLocationUpdateForUser), userInfo: nil, repeats: true)
    }
    
    
    
    func stopUserUpdateTimer()
    {
        if let _ = self.UserLocationUpdateTimer
        {
            self.UserLocationUpdateTimer.invalidate()
        }
        self.UserLocationUpdateTimer = nil
    }
    
    
    
    @objc func sendLocationUpdateForUser()
    {
        /*
        if UserDefaultUtility.retrieveBoolForKey(AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN) && self.currentLocation != nil
        {
       //     self.viewDelegate?.locationUpdated(lat: (self.currentLocation?.coordinate.latitude)!, long: (self.currentLocation?.coordinate.longitude)!)
        }
        */
    
        if self.currentLocation != nil {
            
             LocationServiceManager.sharedInstance.stopUserUpdateTimer()
            
            debugPrint(self.currentLocation?.coordinate.latitude ?? "No Latitude", self.currentLocation?.coordinate.longitude ?? "No Longtitude")
            

          //  self.viewDelegate?.locationUpdated(lat: (self.currentLocation?.coordinate.latitude)!, long: (self.currentLocation?.coordinate.longitude)!)
            
        }
        
        
    }
    
//    func getFakeGPSCoordinatesFromLocation(location: CLLocation)->CLLocation{
//        let lat = location.coordinate.latitude + 11.0238408
//        let lng = -(180 - location.coordinate.longitude) + 27.9180363
//
//        return CLLocation(latitude: lat, longitude: lng)
//    }
    
}
