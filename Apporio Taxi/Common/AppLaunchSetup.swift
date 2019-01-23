/**
 This class handle all the setup work on project launch
 */


import Foundation
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces



class AppLaunchSetup: NSObject {
    
    /*
     Create Singleton object for the class
     */
    static let shareInstance = AppLaunchSetup()
    
    private override init() {
        
        
    }
    
    
    /**
     This method is used to enable IQKeyabord
     */
    
    func setupIQKeyboard(){
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = false
        IQKeyboardManager.sharedManager().enable = true
    }
   
   
    /**
     This method used to setup google map sdk on launch
     */
    
    func setupGoogleMap(){
        let keyGoogleMap = AppConstants.KeyName.GoogleMapKey
        GMSServices.provideAPIKey(keyGoogleMap)
        GMSPlacesClient.provideAPIKey(keyGoogleMap)
    }
}
