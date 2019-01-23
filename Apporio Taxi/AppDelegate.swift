//
//  AppDelegate.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 11/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import OneSignal
import GoogleMaps
import GooglePlaces
import Stripe
import GoogleSignIn
import ObjectMapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,OSSubscriptionObserver, OSPermissionObserver,GIDSignInDelegate {

    var window: UIWindow?
    
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    
    var recievednotificationdata: RecievedNotificationModel!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            AppConstants.appversion = version
            print(version)
        }
        
        let modelName = UIDevice.current.model
        
        AppConstants.modelname = modelName

        
        let bundleID = Bundle.main.bundleIdentifier
        
        AppConstants.appbundleid = bundleID!

        
      
        let device_id = UIDevice.current.identifierForVendor?.uuidString
        
        
        UserDefaultUtility.saveStringWithKey((device_id)!, key: AppConstants.UserDefaultKeys.UNIQUE_NUMBER)
        
        GIDSignIn.sharedInstance().clientID = "985521669892-tf7e497c8aklkj5lccbv88o8gn31mm2g.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        ReachabilityManager.shared.startMonitoring()
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        
        GMSServices.provideAPIKey("AIzaSyAwdw2gOgLTM_lAjEtVvIH87xHx3RTKEUQ")
        GMSPlacesClient.provideAPIKey("AIzaSyDdN4fqXPnnGWuCs2d5ncpDBnGgKfDo1fM")
        
          Stripe.setDefaultPublishableKey("pk_test_sXh4q5BW3y2ySk7V82cOEcuE")
        
        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
            
            print("Received Notification: \("hello")")
            
            
            
            let dataaaa = self.json(from: notification?.payload.additionalData as Any)
            
            let jsonData =  RecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata =  jsonData
            
            
            
            print(self.recievednotificationdata)
            
            
            print(self.recievednotificationdata.type)
            
            if self.recievednotificationdata.type == 1{
           
            if self.recievednotificationdata.data?.bookingStatus == 1002{
                
                 AppConstants.timerForGetDriverLocation1.invalidate()
                
                AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
                
                if self.recievednotificationdata.data?.bookingStatus == 1007{
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    AppConstants.newtimer?.cancel()
                    AppConstants.newtimer = nil
                     AppConstants.dialogopen = "1"
                    
                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                    
                }
            
            if self.recievednotificationdata.data?.bookingStatus == 1003{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                 AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1004{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                 AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
                
               
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1005{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                 AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
            }

                
            }else if self.recievednotificationdata.type == 2{
                AppConstants.dialogopen = "1"
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                
                
                var presentedVC = self.window?.rootViewController
                
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                
                
            }else if self.recievednotificationdata.type == 5{
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                
                
                
                
            }else if self.recievednotificationdata.type == 6{
                
                
//                if self.recievednotificationdata.data?.bookingStatus == 999{
                
                UserDefaultUtility.removeAllUserDefault()
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
                    
                }
                
                
//            }else{
//
//
//            }
//
            
            
        }
        
        let notificationOpenedBlock: OSHandleNotificationActionBlock = { result in
            // This block gets called when the user reacts to a notification received
            let payload: OSNotificationPayload = result!.notification.payload
            
            
            let dataaaa = self.json(from: payload.additionalData as Any)
            
            let jsonData =  RecievedNotificationModel(JSONString: dataaaa!)
            self.recievednotificationdata =  jsonData
            
              if self.recievednotificationdata.type == 1{
            
            if self.recievednotificationdata.data?.bookingStatus == 1002{
                
                AppConstants.timerForGetDriverLocation1.invalidate()
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
                
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1003{
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1004{
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "trackride"), object: nil, userInfo: nil)
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1007{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                if AppConstants.dialogopen == "0"{
                    
                    AppConstants.dialogopen = "1"
                    
                   
                    
                    self.showalert1(message: "Your Ride Cancel by Driver!!".localized)
                }else{
                    
                    
                }
                
                
                
                
            }
            
            if self.recievednotificationdata.data?.bookingStatus == 1005{
                
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.bookingId = String((self.recievednotificationdata.data?.bookingId)!)
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(TrackViewController, animated: true, completion: nil)
            }

                
              }else if self.recievednotificationdata.type == 2{
                
                if AppConstants.dialogopen == "0"{
                    
                    AppConstants.dialogopen = "1"
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                
                
                var presentedVC = self.window?.rootViewController
                
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                    
                }else{
                    
                    
                }
                
                
              }else if self.recievednotificationdata.type == 5{
                
                
                 NotificationCenter.default.post(name: NSNotification.Name(rawValue: "chatscreen"), object: nil, userInfo: nil)
                
                
              }else if self.recievednotificationdata.type == 6{
                
//                if self.recievednotificationdata.data?.bookingStatus == 999{
                
                    UserDefaultUtility.removeAllUserDefault()
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let TrackViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                    
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(TrackViewController, animated: true, completion: nil)
                    
                    
                }
                
                
//              }else{
//
//
//            }
            
            
            
        }
        
        let onesignalInitSettings: [AnyHashable: Any] = [kOSSettingsKeyAutoPrompt: false,kOSSettingsKeyInFocusDisplayOption: OSNotificationDisplayType.none.rawValue]
        
        
        
        
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "468c3d76-ca91-421e-9928-2ee475d58f51",
                                        handleNotificationReceived: notificationReceivedBlock,
                                        handleNotificationAction: notificationOpenedBlock,
                                        settings: onesignalInitSettings)
        
        
        
        
        
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
        OneSignal.promptLocation()
        
        
        
        OneSignal.add(self as OSSubscriptionObserver)
        
        OneSignal.add(self as OSPermissionObserver)
        
        
        
        // Override point for customization after application launch.
        return true
    }
    
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    
    
    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {
        if !stateChanges.from.subscribed && stateChanges.to.subscribed {
            print("Subscribed for OneSignal push notifications!")
        }
        print("SubscriptionStateChange: \n\(stateChanges)")
        
        //The player id is inside stateChanges. But be careful, this value can be nil if the user has not granted you permission to send notifications.
        if let playerId = stateChanges.to.userId {
            print("Current playerId \(playerId)")
             UserDefaultUtility.saveStringWithKey((playerId), key: AppConstants.UserDefaultKeys.PLAYER_ID)
            
            
            
//            if  GlobalVarible.afterallownotificationsetting == 1{
//
//                GlobalVarible.afterallownotificationsetting = 0
//
//                let userid = NsUserDekfaultManager.SingeltionInstance.getuserdetaild(key: NsUserDekfaultManager.Keyuserid)
//
//                var UserDeviceKey = ""
//
//                let UserDeviceKey1 = UserDefaults.standard.string(forKey: "device_key")
//
//                if UserDeviceKey1 == nil{
//
//                    UserDeviceKey = ""
//
//                }else{
//
//                    UserDeviceKey = UserDeviceKey1!
//
//                }
//
//
//                var uniqueid = ""
//
//
//                let uniqueid1 =  UserDefaults.standard.string(forKey: "unique_number")
//
//                if uniqueid1 == nil{
//
//                    uniqueid = ""
//                }else{
//
//                    uniqueid = uniqueid1!
//
//                }
//
//
//
//
//
//
//
//            }else{
//
//            }
//
            
        }
    }
    
    
    func onOSPermissionChanged(_ stateChanges: OSPermissionStateChanges!) {
        // Example of detecting answering the permission prompt
        if stateChanges.from.status == OSNotificationPermission.notDetermined {
            if stateChanges.to.status == OSNotificationPermission.authorized {
                print("Thanks for accepting notifications!")
             //   GlobalVarible.notificationvalue = 0
            } else if stateChanges.to.status == OSNotificationPermission.denied {
              //  GlobalVarible.notificationvalue = 1
                print("Notifications not accepted. You can turn them on later under your iOS settings.")
                
                
                
            }
        }
        // prints out all properties
        print("PermissionStateChanges: \n\(stateChanges)")
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        
        let googlesigin = GIDSignIn.sharedInstance().handle(url as URL?,
                                                            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?,
                                                            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        //   let facebookurl = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[.sourceApplication] as! String!, annotation: options[.annotation])
        
        //       let facebookurl = SDKApplicationDelegate.shared.application(app,open: url as URL!,sourceApplication: (options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!),
        //            annotation: options[UIApplicationOpenURLOptionsKey.annotation] as Any)
        
        return googlesigin
        
        //  return googlesigin || facebookurl
        
    }

    
    
    func showalert1(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                AppConstants.dialogopen = "0"
                self.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
               // self.window?.rootViewController?.dismiss(animated: true, completion: nil)
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    

}

