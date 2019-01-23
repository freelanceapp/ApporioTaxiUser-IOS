//
//  LoginViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 30/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import GoogleSignIn
import ObjectMapper

class LoginViewController: BaseViewController,GIDSignInUIDelegate,GIDSignInDelegate {
    @IBOutlet weak var selctcountrycodetextlbl: UILabel!
    
    @IBOutlet weak var hiddenviewcancelbtn: UIButton!
    @IBOutlet weak var hiddenviewokbtn: UIButton!
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var innerhiddenview: UIView!
    
    @IBOutlet weak var loginbtntext: UIButton!
    @IBOutlet weak var backgroundimageview: UIImageView!
    
    @IBOutlet weak var countrycodetext: UILabel!
    
    var selectcountrycodetext = "+91"
    
    
    @IBOutlet weak var loginasdemouserbtntext: UIButton!
    @IBOutlet weak var loginasdemouserview: UIView!
    
    @IBOutlet weak var loginasdemouserviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var enterphonenumbertext: UITextField!
    @IBOutlet weak var innerview: UIView!
    
     var check = 0
    
    var checkfromgoogle = 0
    
    @IBOutlet weak var orsigninwithtextlbl: UILabel!
    @IBOutlet weak var enterpasswordtext: UITextField!
    
    @IBOutlet weak var forgotpasswordtextlbl: UILabel!
    @IBOutlet weak var newheresignuptext: UILabel!
    @IBOutlet weak var googlebtn: UIButton!
    
    
    
    var firstName = ""
    var lastName = ""
    var fbOrGoogleId = ""
    var fborGoogleImageUrl = ""
    var fbOrGoogleMail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        enterphonenumbertext.placeholder = "Phone Number".localized
        enterpasswordtext.placeholder = "Password".localized
        loginbtntext.setTitle("Login".localized, for: UIControlState.normal)
        orsigninwithtextlbl.text = "or Sign in with".localized
        loginasdemouserbtntext.setTitle("Login as demo user".localized, for: UIControlState.normal)
        forgotpasswordtextlbl.text = "Forgot Password?".localized
        newheresignuptext.text = "New? Sign up here!".localized
        selctcountrycodetextlbl.text = "Select Country".localized
        hiddenviewokbtn.setTitle("OK".localized, for: UIControlState.normal)
        hiddenviewcancelbtn.setTitle("CANCEL".localized, for: UIControlState.normal)
        
        
        countrycodetext.text = selectcountrycodetext
        hiddenview.isHidden = true
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        innerview.edgeWithOutShadow(edge: 8.0)
        loginbtntext.edgeWithOutShadow(edge: 8.0)
        
        googlebtn.edgeWithOutShadow(edge: 8.0)
        
        loginasdemouserview.edgeWithShadow(edge: 8.0)
        
        
        if AppConstants.userconfiguredata.data?.Demo == "1"{
            loginasdemouserview.isHidden = false
            loginasdemouserviewheight.constant = 50.0
            
        }else{
            loginasdemouserview.isHidden = true
             loginasdemouserviewheight.constant = 0.0
            
        }
        
        
        
        selectcountrycodetext = (AppConstants.userconfiguredata.data?.countries![check].phonecode)!
        
         countrycodetext.text = selectcountrycodetext

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hiddenviewokbtnclick(_ sender: Any) {
        countrycodetext.text = selectcountrycodetext
        
         hiddenview.isHidden = true
    }
    
    @IBAction func loginasdemouserbtnclick(_ sender: Any) {
        let refreshAlert = UIAlertController(title:  "For Demo Testing ".localized, message: "Make Sure you logged as Demo in Driver app as well.".localized, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok".localized , style: .default, handler: { (action: UIAlertAction!) in
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: CreateDemoDriverViewController = storyboard.instantiateViewController(withIdentifier: "CreateDemoDriverViewController") as! CreateDemoDriverViewController
            next.modalPresentationStyle = .overCurrentContext
            self.present(next, animated: true, completion: nil)
            
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)

        
    }
    
    @IBAction func hiddenviewcancelbtnclick(_ sender: Any) {
         hiddenview.isHidden = true
    }
    
    @IBAction func selectcountrtycodebtn(_ sender: Any) {
        hiddentableview.reloadData()
         hiddenview.isHidden = false
        
        
    }
    @IBAction func loginbtnclick(_ sender: Any) {
        
       
        
        let dic1 = ["phone": countrycodetext.text! + self.enterphonenumbertext.text!,
                    "password": self.enterpasswordtext.text!
                   
            
            
            ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERLOGIN
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicwithpublic, returningClass: AccessTokenModel.self)
        
    }
    
    @IBAction func forgotpasswordbtnclick(_ sender: Any) {
        AppConstants.comefromforgetscreen = "forgot"
        self.presentVC("VerifyPhoneViewController")
        
    }
    @IBAction func googlebtnclick(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func newsignupbtnclick(_ sender: Any) {
        
        self.presentVC("SignUpViewController")
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
       
        
        
        if (error == nil) {
            
            let userId = user.userID
            //  let idToken = user.authentication.idToken
            let fullName = user.profile.name
            
            // let image = user.profile.imageURL(withDimension: 400)
            
            
            let profilePicture = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 400)
            
            // let profilePicture = String(describing: GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 400))
            let email = user.profile.email
            //  self.signOutGoogle()
            
           self.firstName = fullName!
           self.fbOrGoogleId = userId!
          self.fborGoogleImageUrl = String(describing: profilePicture!)
//            print(fborGoogleImageUrl)
//
            self.fbOrGoogleMail = email!
            
//            let dic=[ googleLoginUrl2: "\(userId!)"]
//
//            ApiManager.sharedInstance.protocolmain_Catagory = self
//
//            ApiManager.sharedInstance.postData(dictonary: dic as NSDictionary, url: googleLoginUrl)
            
            //   ApiController.sharedInstance.parsPostData(dic, url: googleLoginUrl, reseltCode: 9)
            
            checkfromgoogle = 1
            
            let dic = ["Accept": "application/json",
                       "public_key": AppConstants.publickey,
                       "secret_key": AppConstants.secretkey
                
                
                ] as [String : AnyObject]
            
            let dic1 = ["social_id": "\(userId!)"
           
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERSOCIALSIGNIN
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: dic, returningClass: AccessTokenModel.self)
            
            
        } else {
            print("\(error.localizedDescription)")
        }
        
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension LoginViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (AppConstants.userconfiguredata.data?.countries?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
        
        
        let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
        
        let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
        
        firsttext.text = (AppConstants.userconfiguredata.data?.countries![indexPath.row].phonecode)! + "  " +  (AppConstants.userconfiguredata.data?.countries![indexPath.row].name)!
        
         let tableheight = hiddentableview.contentSize.height
        
      
        if tableheight < AppConstants.screenframeheight - 200.0{
            
            innerhiddenviewheight.constant = tableheight + 100.0
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hiddentableview.deselectRow(at: indexPath, animated: true)
        check = indexPath.row
        hiddentableview.reloadData()
        
        selectcountrycodetext = (AppConstants.userconfiguredata.data?.countries![indexPath.row].phonecode)!
        
    }
    
    
    
}


extension LoginViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? AccessTokenModel{
            let data:AccessTokenModel = responseData
            
           
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                    UserDefaultUtility.saveStringWithKey((data.data?.accessToken)!, key: AppConstants.UserDefaultKeys.CLIENT_ID)
            
                AppConstants.dicauthorization = ["Accept":"application/json",
                                                 "Authorization": "Bearer " + UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.CLIENT_ID),
                                                 "locale":AppConstants.languagecode
                    
                    ] as [String : AnyObject]
                
                
               
                
                
                let dic1 = ["unique_no": UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.UNIQUE_NUMBER),
                            "package_name":AppConstants.appbundleid,
                   
                    ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERDETAILS
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserLoginModel.self)
                
                
            } else {
                
                if  checkfromgoogle == 1{
                    checkfromgoogle = 0
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpwithgoogleViewController") as! SignUpwithgoogleViewController
                    
                    vc.googleFirstName = self.firstName
                    vc.googleLastName = self.lastName
                    vc.googleId = self.fbOrGoogleId
                  
                    vc.googleMail = fbOrGoogleMail
                    vc.googleImage = fborGoogleImageUrl
                    self.present(vc, animated: true, completion: nil)
                
                }else{
                
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                }
            }
            
            
        }
        
        
        
        if let responseData = response as? UserLoginModel{
            
            
            let data:UserLoginModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
       
                
                UserDefaultUtility.saveStringWithKey((data.data!.email)!, key: AppConstants.UserDefaultKeys.EMAIL_ID)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userPhone)!, key: AppConstants.UserDefaultKeys.MOBILE_NUMBER)
                
                UserDefaultUtility.saveStringWithKey((data.data!.userName)!, key: AppConstants.UserDefaultKeys.NAME)
                
               
                UserDefaultUtility.saveStringWithKey((data.data!.password)!, key: AppConstants.UserDefaultKeys.PASSWORD)
                 UserDefaultUtility.saveStringWithKey((data.data!.userprofileimage)!, key: AppConstants.UserDefaultKeys.USER_IMAGE)
                
                UserDefaultUtility.saveStringWithKey(AppConstants.UserDefaultKeys.IS_ALREADY_LAUNCHED, key: AppConstants.UserDefaultKeys.IS_ALREADY_LOGIN)
                
               
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: MapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
                
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
