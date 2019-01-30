/**
 Contains all the constants related to the application
 */

import Foundation

struct AppConstants{
    
    /*   Get Plist data using this .... For Future use
    struct PListKeys{
        static let BASE_URL_KEY = "BASE_URL"
        static let KEY_GOOGLE_MAP = "KEY_GOOGLE_MAP"
    }
 
  */
    
    static  func downloadimage(imagename:String,imageview:UIImageView,placeholderimage:String)// -> UIImage
    {
        
        let image = UIImage (imageLiteralResourceName: placeholderimage)
        let combineurl = AppConstants.APIURL.IMAGE_URL + "/" + imagename
       
        
        let url = URL(string: combineurl)!
        //imageview.isHidden  = true
        imageview.af_setImage(withURL: url, placeholderImage: image, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true) { (image) in
            print("helloo")
            //imageview.isHidden  = false
        }
        
        
        
    }
    
    static  func downloadimage1(imagename:String,imageview:UIImageView,placeholderimage:String)// -> UIImage
    {
        
        let image = UIImage (imageLiteralResourceName: placeholderimage)
        //let combineurl = Session.imageurl + "/" + imagename
        let url = URL(string: imagename)!
        //imageview.isHidden  = true
        imageview.af_setImage(withURL: url, placeholderImage: image, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true) { (image) in
            print("helloo")
            //imageview.isHidden  = false
        }
        
        
        
    }
    
    
    static var dicwithpublic = ["Accept": "application/json",
               "public_key": AppConstants.publickey,
               "secret_key": AppConstants.secretkey
        
        
        ] as [String : AnyObject]
    
    
     
    static var dicauthorization = [:] as [String : AnyObject]
    
    
    static var screenframeheight: CGFloat = 0.0
    static var screenframewidth: CGFloat = 0.0
    static var changedroplat: String = ""
    static var changedroplng: String = ""
    static var changedroplocation: String = ""
     static var dropchange = 0
    
    static var usercityname: String = ""
    static var emergencylatitude: String = ""
    static var emergencylongitude: String = ""
      static var dialogopen: String = "0"
    static var movefromoutstation: String = ""
     static var pickusercityname1: String = ""
     static var dropusercityname1: String = ""
    static var cancelbtnvaluematch: String = ""
      static var drivername: String = ""
      static var checkfavvalue: Int = 1
    static var viewcontrollerself : UIViewController!
    static var  timer: DispatchSourceTimer?
    static var couponcode: String = ""
    static var checkoutid = ""
    static var couponcodevalue: Int = 0
    static var paymentoptionselect: Int = 0
    static var userconfiguredata: UserConfigureModel!
    static var modelname = ""
    static var appversion = ""
    static var appbundleid = ""
    static var enteruserphonenumber: String = ""
    static var comefromforgetscreen: String = ""
    static var checkphonenumber: Int = 0
    static var publickey = "s31kPjpFMGOArnZ0q47R8y6D5N9uSv"
    static var SelectDate :String = ""
    static var SelectTime :String = ""
    static var ReturnSelectDate :String = ""
    static var ReturnSelectDateShowdate :String = ""
    static var ReturnSelectTime :String = ""
    static var LeaveSelectDate :String = ""
     static var LeaveSelectDateshowformat :String = ""
    static var LeaveSelectTime :String = ""
    static var secretkey = "EqC2yT8RfQpXwFZ1MlNuL30OGZ4PoW"
    static var languagecode = "en"
     static var addmoney = 0
    static var cardselect = 0
    static var enteramount = ""
    static var currencysymbol = "INR"
    static var tokenvalue = 0
     static var  newtimer: DispatchSourceTimer?
    static  var timerForGetDriverLocation1 = Timer()
    static var bookingId = ""
     static var bookingStatus = ""
    static var ServiceType = ""
    static var BookingType = ""
     static var VehicleID = ""
    static var AreaID = ""
    static var VehicleType = ""
    static var ridebooksuccessfully: Int = 0
    static var bookingdetailsdata : BookingDetailsModel!
    static var bookoutstationdata : BookOutStationModel!
    static var Ridenowcheckoutmodeldata: RideNowCheckoutModel!
    static var droplat:[String] = []
    static var droplng:[String] = []
    static var droplocation:[String] = []
     static var checklocationvalue: Int = 1
      static var newchecklocationvalue: String = "0"
     static var userselectcategoryvalue = ""
    static var userselectcategorycount = ""
     static var googlemapkey = "AIzaSyCdsS7d2HHMvWuwiSOXGlbf2yRlPztHXc0"
    static var movefrom = ""
     static var movefromscreen = ""
     static var dob = ""
     static var mobilenumber = ""
     static var countrycode = ""
    static var otpvalue = ""
    static var Lat = ""
    static var Lng = ""
    static var Location = ""
     static var selectaddressLat = ""
     static var selectaddressLng = ""
     static var selectaddressLocation = ""
    static var userselectaddressLat = ""
    static var userselectaddressLng = ""
    static var userselectaddressLocation = ""
     static var userselectaddressid = ""
    static var userpickupdateslot = ""
    static var userpickuptimeslot = ""
      static var userpickuptimeslotid = ""
    static var userdropupdateslot = ""
    static var userdropuptimeslot = ""
    static var userdropuptimeslotid = ""
    static var userselectdropaddressLat = ""
    static var userselectdropaddressLng = ""
    static var userselectdropaddressLocation = ""
    static var userselectdropaddressid = ""
     static var userpickupareaid = ""
     static var userdropupareaid = ""
    
    
    
    //MARK:This structure contains Api URLs
    
    
    struct APIURL{
        static let BASE_URL:String = "http://taxi.apporio.in/Production/public/"
        static let IMAGE_URL = "http://taxi.apporio.in/Production/public/"
       
    }
    
    
    struct KeyName{

         static let GoogleMapKey:String = "AIzaSyC7lIIgBajzx409vxmmY_CJPcRvDb114w4"
         static let ProductName:String = "APPORIO"
    }
    
   
  
    //MARK:This structure contains Api End Points
    
    struct ApiEndPoints {
        static let devicetoken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE1NDA1MTY5ZjI5N2Q2ZmJlZGNiODllOTc4OWJlMTljNGYzYjQxNmIzMGYwNDEzZmI5NmQwYzUxMDBlZTNhOTY5MTU4OWUyNjcyYjVjNTdmIn0.eyJhdWQiOiI0IiwianRpIjoiMTU0MDUxNjlmMjk3ZDZmYmVkY2I4OWU5Nzg5YmUxOWM0ZjNiNDE2YjMwZjA0MTNmYjk2ZDBjNTEwMGVlM2E5NjkxNTg5ZTI2NzJiNWM1N2YiLCJpYXQiOjE1NDU0Nzg1MzMsIm5iZiI6MTU0NTQ3ODUzMywiZXhwIjoxNTc3MDE0NTMzLCJzdWIiOiIyMiIsInNjb3BlcyI6W119.l6CAYwnIpoJ6pzTVE9oXkw_ZubqnkOahw7om8YEwtNcYB5BKv5pJYMBkWV_1go_s0-yWsxN_ujyHjHtaEOVS8Q8_dUntOtzDEPxvQ_qgGSWNjQOlhTsLkAqiui9fkigpHOKPuaLUJUn21L2tvYkkOVW5MYaQ9KYyh8RWcw0BXrfWEZ926F40vIlAvoLi9OnTzPfZxl3GsoqVOQIZhdCkRlO3F1cIaII4-DS9Y_MVuI8XYP82JvWZ0Z_u1t12Dzr97PT6C8lE9EC5DhlMBRUssf2WKN0DM2-dAW7zydMfn9WKEAeu-_v_HIZku4l28g85pmSKVx9LKHg5G6MW4a_58QMC-MNVExQOBTI_gZtZdu-PjQmdIKFhhR84jQOUOdJPWasPjqJqX78pWEovWH-viaAnRHkDoKdpTuiH4VD6RF2L0vCvyjTJ-uWZ7l9OLDkfk52BBoi8f-JlscfhtYelgrK5zlAE8jVQxocI3dr4nHlSPFzRtdaxHsk9Ytxv6MVSvutgBMYxhYMWthdvj0chyhu_SuVcPByq2xnusBkqEh0bxXdSduLNxQ3xAkRg4n0L7zfuuCJqgPc6w-D_Mcloh07Ibq0udyVoKuSSj2jrJ_OiijCTUx4wSf5lOefCkZ1io1ljuVsdcME3buinbJLVB1vd-MD7vpII7KJ_-6hTomk"
        static let DEVICE_AUTH = "/authorise-application"
        static let USER_LOGIN = "/login"
        static let USER_SIGNUP = "/register"
        static let OTP_VERIFICATION = "/otp-verification"
        static let FORGOT_PASSWORD = "/forgotpassword"
        static let AllServiceProducts = "/all-services-products"
        static let CUSTOMER_ADDRESS = "/customer-addresses"
        static let ADD_NEW_ADDRESS = "/add-new-address"
        static let DELETE_CUSTOMER_ADDRESS = "/delete-customer-address"
        static let PICKUP_TIME_SLOTS = "/pickup-time-slots"
        static let DROP_TIME_SLOTS = "/drop-time-slots"
        static let ORDER_CHECKOUT = "/order-checkout1"
        static let PLACE_ORDER = "/place-order"
        static let APPLY_COUON = "/apply-coupon"
        static let ALL_COUPONS = "/all-coupons"
        static let APPLY_PAYMENT_OPTIONS = "/apply-payment-option"
        static let CUSTOMER_ACTIVE_ORDERS = "/customer-active-orders"
        static let CUSTOMER_COMPLETED_ORDERS = "/customer-completed-orders"
        static let CUSTOMER_ORDER_DETAIL = "/complete-order-detail"
        static let PAYMENT_OPTIONS = "/payment-options"
        static let SHOW_CHECK_OUT_DATA = "/show-check-out-data"
        static let EDIT_PROFILE = "/edit-profile"
        static let ORDER_TRACKING = "/order-tracking"
        static let ORDERSUMMARY = "/order-summary"
        static let ADD_MONEY = "/add-money"
        static let VIEW_TRANSACTION = "/view-transaction"
        static let SEARCH_COUPON = "/search-coupon"
        static let  PAY = "/pay"
        static let UPDATE_PASSWORD = "/update-password"
        static let LIVETRACKING = "/livetracking"
        
        
        
        
        static let HOMECARS = "api/user/cars"
        static let USERCHECKOUT = "api/user/checkout"
        static let CHECKDROPLOCATIONAREA = "api/user/check-droplocation/area"
        static let USERDRIVER = "api/user/driver"
        static let USERFAVOURITELOCATION = "api/user/favourite/location"
        static let USERBOOKINGAUTOCANCEL = "api/user/booking/autocancel"
        static let USERVIEWFAVOURITE = "api/user/viewfavourite"
        static let USERCONFIRM = "api/user/confirm"
         static let USERBOOKINGACTIVE =  "api/user/booking/active"
        static let USERBOOKINGDETAILS =  "api/user/booking/details"
        static let USERBOOKINGTRACKING =  "api/user/booking/tracking"
        static let USERRECEIPT =  "api/user/receipt"
        static let USERBOOKINGHISTORY = "api/user/booking/history"
        static let USERBOOKINGHISTORYDetail = "api/user/booking/history/detail"
        static let USERBOOKINGHISTORYACTIVE = "api/user/booking/history/active"
        static let USERCMSPAGES = "api/user/cms/pages"
         static let USERWALLETTRANSACTION = "api/user/wallet/transaction"
        static let USERCARDS = "api/user/cards"
        static let USERCARDSDelete = "api/user/card/delete"
        static let USERSAVECARD = "api/user/save-card"
        static let USERCARDMAKEPAYMENT = "api/user/card/make-payment"
        static let USERWALLETADDMONEY = "api/user/wallet/addMoney"
       static let USERREFER = "api/user/refer"
        static let USERCONFIGURATION = "api/user/configuration"
        static let USERLOGIN = "api/user/login"
        static let USERDETAILS = "api/user/details"
        static let USEROTP = "api/user/otp"
         static let USERLOGOUT = "api/user/logout"
        static let USERSIGNUP = "api/user/signup"
        static let USERFORGOTPASSWORD = "api/user/forgotpassword"
        static let USERSOCIALSIGNIN = "api/user/socialsignin"
        static let USERSOCIALSIGNUP = "api/user/socialsingup"
        static let USERCHECKOUTAPPLYPROMO = "api/user/checkout/apply-promo"
        static let USERPROMOTIONNOTIFICAION = "api/user/promotion/notification"
        static let USERPAYMENTOPTION = "api/user/payment-option"
        static let USERPAYMENT = "api/user/payment"
        static let USERBOOKINGRATEDRIVER = "api/user/booking/rate/driver"
        static let USERADDFAVOURITEDRIVER = "api/user/addfavourite/driver"
        static let USERFAVOURITEDRIVER = "api/user/favourite/drivers"
        static let USERBOOKINGCANCEL = "api/user/booking/cancel"
        static let USERCHATSENDMESSAGE = "api/user/chat/send_message"
        static let USERCHAT = "api/user/chat"
        static let USERCUSTOMERSUPPORT = "api/user/customer_support"
        static let USERCHANGEPASSWORD = "api/user/change-password"
        static let USEREDITPROFILE = "api/user/edit-profile"
         static let USERBOOKINGINVOICE = "api/user/booking/invoice"
        static let USEROUTSTATIONDETAILS = "api/user/outstation-details"
        static let USERRATECARD = "api/user/pricecard"
        static let USERAREAS = "api/user/areas"
        static let USERCHECKDROPLOCATIONAREA = "api/user/check-droplocation/area"
        static let USERDEMOUSER = "api/user/demoUser"
        static let USERACTIVEERSOSREQUEST = "api/user/sos/request"
        static let USERBOOKINGMAKEPAYMENT = "api/user/booking/make-payment"
        static let USERBOOKINGCHANGEADDRESS = "api/user/booking/change_address"
        static let USERCANCELREASON = "api/user/cancelReasons"
        
        

       
        
        

        
        

        
        

        
        

       
        

        
        

       
        
        


        
        

        
        

        
        
        
        

        
        

        

        

        
        

        

        
        
        
        
        
        
        
        
        
        
        //----Added----
        
        /*
        static let GOOGLE_DIRECTION_API = "https://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%f,%f&key=\(PListUtility.getValue(forKey: AppConstants.PListKeys.KEY_GOOGLE_MAP) as! String)"
        static let GOOGLE_DIRECTION_WITH_WAYPOINT_API = "https://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%f,%f&waypoints=%f,%f&key=\(PListUtility.getValue(forKey: AppConstants.PListKeys.KEY_GOOGLE_MAP) as! String)"
        */
        
    }
    
    
    //MARK:- This structure contains Error message for various events
    
    struct ValidationErrors{
        static let ENTER_PHONE_NUMBER = "Please enter the phone number"
        static let INVALID_PHONE_NUMBER = "Please enter the valid phone number"
        static let ENTER_EMAILID_OR_PHONE_NUMBER = "Please enter email id or phone number"
        static let ENTER_VALID_EMAILID_OR_PHONE_NUMBER = "Please enter the valid email id or phone number"
        static let ENTER_PASSWORD = "Please enter the password"
        static let CURRENT_PASSWORD = "Please enter the current password"
        static let NEW_PASSWORD = "Please enter the new password"
        static let ENTER_EMAIL_AND_PASSWORD = "Please enter email and password"
        

        static let INVALID_PASSWORD = "Invalid password.(Should be more than 6 characters and less than 25 characters)"
        static let ENTER_EMAIL_ID = "Please enter the email id"
        static let INVALID_EMAIL_ID = "Please enter the valid email id"
        static let ENTER_FIRST_NAME = "Please enter first name"
        static let ENTER_VALID_LAST_NAME = "Please enter valid last name"
        static let ENTER_VALID_FIRST_NAME = "Please enter valid first name"
        static let ENTER_VALID_EMAIL = "Please enter the valid email id"


        static let ENTER_OTP = "Please enter the code"
        static let INVALID_OTP = "Please provide a valid code"
        static let SELECT_SELFIE = "Please upload your selfie image"
        static let SELECT_INSURANCE = "Please upload your insurance image"
        static let SELECT_VEHICLE = "Please upload your vehicle image"
        
    }
    
    //MARK:- This structure contains Request header keys
    
    struct APIRequestHeaders {
        
        static let CONTENT_TYPE = "Content-Type"
        static let APPLICATION_JSON = "application/json"
        static let API_KEY = "api_key"
        static let API_KEY_VALUE = "e29e457aa39593afbef47dfde7a558adf12ebdf7f67156621a6026b7e567ca73"
    }
    
    //MARK:- This structure contains keys for error handling
    
    struct ErrorHandlingKeys{
        
        static let IS_ERROR = ""
        static let ERROR_KEY = "code"
        static let ERROR_DETAIL = "detail"
    }
    
    //MARK:- This structure contains the error messages corresponding to error code
    
    struct ErrorMessages{
        
        static let ERROR_TITLE = "Alert"
        static let ALERT_TITLE = "Alert"
        static let MESSAGE_TITLE = "Message"
        static let INVALID_KEY_MESSAGE = "Valid api key is required. Please provide a valid api key along with request"
        static let INVALID_INPUT_MESSAGE = "Please provide a valid input"
        static let INVALID_LOGIN_MESSAGE = "Your phone/email is not registered"
        static let SOME_ERROR_OCCURED = "Oops-something went wrong. Please try again"
        static let PLEASE_CHECK_YOUR_INTERNET_CONNECTION = "Please check your internet connection"
        static let REQUEST_TIME_OUT = "Looks like the server is taking to long to respond, please try again in sometime"
        static let EMAIL_ALREADY_REGISTERED = "This email is already registered"
        static let PHONE_ALREADY_REGISTERED = "This phone is already registered"
        static let INVALID_INPUT = "Please provide a valid input"
        static let INVALID_OTP = "Please provide a valid code"
        static let PHONE_NOT_REGISTERED = "This number is not registered"
        static let EMAIL_NOT_REGISTERED = "This email is not registered"
        static let PHONE_NOT_VERIFIED = "Phone number is not verified."
        static let EMAIL_NOT_VERIFIED = "Email is not verified."
        static let INTERNAL_ERROR = "Oops-something went wrong. Please try again"
        static let ALREADY_REGISTERED = "You are already registered with the credential."
        static let ACCOUNT_DISABLED_MESSAGE = "Your account has been disabled. Please contact the administrator"
        static let ACCOUNT_UNVERIFIED = "Your account is not verified"
        static let INVALID_AUTH = "Session Expire. Please login again."
        static let NOT_FOUND = "No record found"
        
    }
    
    
    /// Use When you require any specific
    struct ScreenSpecificErrorMessage {
        struct UpcomingTripList{
            static let NOT_FOUND = "Data not found"
        }
    }

    
    /// For screen specific Constant example you can see below -
    struct ScreenSpecificConstant {
        
        struct WelcomeScreen {
            static let TITLE_LOCATION_ACCESS_DISABLED = "Location Access Disabled"
            static let MESSAGE_LOCATION_SERVICE_DISABLED = "Allow ApporioEats to access this device's location?"
            static let APP_TITLE_DESC = "Use you \(KeyName.ProductName) Account to get started"
            static let REGISTER = "Register"
            static let LOGIN = "Login"
            
        }
        
        
        struct Common{
            
           
            static let BACK_BUTTON_TITLE = "Back"
            static let SKIP_BUTTON_TITLE = "Skip"
            static let EMPTY_STRING = ""
            static let LOGOUT_TITLE = "Logout"
            static let YES_TITLE = "Yes"
            static let OK_TITLE = "Ok"
            static let NO_TITLE = "No"
            static let Cancel_TITLE = "Cancel"
            static let LOGOUT_MESSAGE = "Are you sure you want to logout?"
            static let SETTINGS = "Go To Settings"
            static let ACCESS_DENIED = "Access Denied"
            static let CONTACT_ACCESS_PERMISSION_MESSAGE = "Please allow the app to access your contacts through the Settings"
            static let SAVE_BUTTON_TITLE = "Save"
            static let EDIT_BUTTON_TITLE = "Edit"
            static let PRODUCT_NAME_PRODUCTION = "Wapanda"
        }
        struct UploadScreen {
            static let TITLE_GALLERY_ACCESS_DISABLED = "Enable Gallery Access"
            static let TITLE_CAMERA_ACCESS_DISABLED = "Enable Camera Access"
            static let MESSAGE_GALLERY_SERVICE_DISABLED = "To upload documents, you'll need to enable Gallery Access"
            static let MESSAGE_CAMERA_SERVICE_DISABLED = "To upload documents, you'll need to enable Camera Access"
            static let NUMBER_OF_DOCUMENTS_UPLOAD = 2
        }
        
        struct LoginScreen {
            static let NAVIGATION_TITLE = "Login"
            static let LOGIN_SUBTITLE = "LOG IN WITH YOUR \(KeyName.ProductName) ACCOUNT"
            static let EMAIL = "Email"
            static let EMAIL_PLACEHOLDER = "name@example.com"
            static let PASSWORD = "Password"
            static let PASSWORD_PLACEHOLDER = "Password"
            static let FORGOT_PASSWORD = "FORGOT PASSWORD ?"
            static let REGISTER = "REGISTER"
            static let LOGIN = "LOGIN"
        }
        
        
        
        struct SignUpScreen {
            static let NAVIGATION_TITLE = "Create an account"
            static let FIRST_NAME_PLACEHOLDER = "First Name"
            static let LAST_NAME_PLACEHOLDER = "Last Name"
            static let EMAIL_PLACEHOLDER = "Enter Email Address"
            static let MOBILE_NUMBER_PLACEHOLDER = "Enter Mobile Number"
            static let PASSWORD_PLACEHOLDER = "Enter Password"
            static let SIGNUP_SUBTITLE = "We use your email and mobile number to send your order confirmations and receipts"
            
        }
        struct ResetPasswordScreen {
            static let NEW_PASSWORD_PLACEHOLDER_TEXT = "New Password"
            static let CURRENT_PASSWORD_PLACEHOLDER_TEXT = "Current Password"
            static let PASSWORD_CHANGE_SUCCESS = "Your password has been changed successfully"
        }
       
    }
    
    
    //MARK:- Common constants
    
    struct Common{
        static let LOGIN_SUCCESSFULL = "Login successful"
        static let LOGOUT_SUCCESSFUL = "Logged out successfully"
    }
    
    //MARK:- NSNotification Names
    struct NSNotificationNames {
        static let INTERNET_RECHABLE_NOTIFICATION = "INTERNET_RECHABLE"
        static let INTERNET_UNREACHABLE_NOTIFICATION = "INTERNET_UNREACHABLE"
        static let REFRESH_PAYMENT_OPTION = "REFRESH_PAYMENT_OPTION"
        static let APP_BECOME_ACTIVE_NOTIFICATION = "APP_BECAME_ACTIVE_NOTIF"
    }
    
    //MARK: - UserInfo Object Constants
    
    struct UserInfoConstants{
        
        static let USER_ID = "USER_ID"
        static let FIRST_NAME = "FIRST_NAME"
        static let PHONE = "PHONE"
        static let EMAIL = "EMAIL"
        static let COUNTRY_CODE = "COUNTRY_CODE"
        static let USER_INFO = "USER_INFO"
    }
    
    
    
    //MARK: - Persistent user default data keys
    
    struct UserDefaultKeys{
        static let IS_ALREADY_LOGIN = "isAlreadyLogin"
        static let NON_LOGGED_IS_USER = "isNonLoggedUser"
        static let DEVICE_TOKEN = "DEVICE_TOKEN"
        static let IS_ALREADY_LAUNCHED = "IS_ALREADY_LAUNCHED"
         static let CLIENT_ID = "CLIENT_ID"
        static let PLAYER_ID = "PLAYER_ID"
         static let UNIQUE_NUMBER = "UNIQUE_NUMBER"
         static let USER_ID = "USER_ID"
        static let USER_IMAGE = "User_image"
         static let NAME = "NAME"
        static let EMAIL_ID = "EMAIL_ID"
        static let PASSWORD = "password"
        static let DOB = "dob"
        static let MOBILE_NUMBER = "MOBILE_NUMBER"
    }
    
    //MARK:- Date Formatter constants
    
    struct DateConstants {
        static let DOB_FORMAT = "dd/MM/yyyy"
        static let DOB_FORMAT_FROM_SERVER = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let TIME_FORMAT_IN_12_HOUR = "hh:mm a"
        
    }
    
    struct ToastMessages{
        static let OTP_SENT = "Verification code has been sent"
        static let LOGIN_SUCCESS = "OTP has been sent"
    }
}
