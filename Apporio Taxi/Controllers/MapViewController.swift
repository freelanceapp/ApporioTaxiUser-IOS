//
//  MapViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 11/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//





import UIKit
import GoogleMaps
import ObjectMapper
import AlamofireImage
import NVActivityIndicatorView
import MessageUI
import SwiftyJSON
import MapKit


var mapviewcontroller :  MapViewController!

class MapViewController: BaseViewController,NVActivityIndicatorViewable {
    
    @IBOutlet weak var sorrywedontservetextlbl: UILabel!
    @IBOutlet weak var gotoactiveridetextlbl: UILabel!
    
    @IBOutlet weak var findingviewcancelbtntext: UIButton!
    // @IBOutlet weak var topcategoryviewwidth: NSLayoutConstraint!
    
    @IBOutlet weak var centeraddressimage: UIImageView!
    @IBOutlet weak var dotaddressimage: UIImageView!
    var distanceKM  =  [Double]()
    
    @IBOutlet var poolslidingview: UIView!
    
    @IBOutlet weak var howmanyseatstext: UILabel!
    
    @IBOutlet weak var twoseatbtntext: UIButton!
    @IBOutlet weak var iseatbtntext: UIButton!
    
    @IBOutlet weak var dropplusbtnview: UIView!
    
    @IBOutlet weak var firstridelaterbtnview: UIView!
     var checkupdownvalue = 1
    @IBOutlet weak var addstopsvalue: UILabel!
    
    var newpath = GMSMutablePath()
    
    var polyline12 = GMSPolyline()
    
    @IBOutlet weak var secondridenowbtnview: UIView!
    
    @IBOutlet weak var favdropimage: UIImageView!
    
    @IBOutlet weak var favpickimage: UIImageView!
    
    @IBOutlet weak var topnotificationiconimage: UIImageView!
    
    var areacoordinatedata : AreaData!
    
     var minimumValue : Double!
    
    
    @IBOutlet weak var pleaseselectpackagetextlbl: UILabel!
    
    
    var numberofriders = 1
    
   // var selectdroplocationindex = 0
    
    var markers = [GMSMarker]()
    
    var driverIds = [String]()
    
    var cartypeArray = [String]()
    
    var statusArray = [String]()
    
    @IBOutlet var slidingview: UIView!
    
     var selectvalue = 0
    @IBOutlet weak var slidinginnerview: UIView!
    
    @IBOutlet weak var profileimage: UIImageView!
    
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var menutable: UITableView!
    
    @IBOutlet weak var userphonetext: UILabel!
    @IBOutlet weak var useremailtext: UILabel!
    
     var textvalue = 0
    
    
    let blackView = UIView()
    
    @IBOutlet weak var sorrynocategoryview: UIView!
    @IBOutlet weak var scrollview: UIView!
    @IBOutlet weak var gotoactiverideview: UIView!
    
    @IBOutlet weak var mapview: GMSMapView!
    
    @IBOutlet weak var ridelatertextlbl: UILabel!
    
    @IBOutlet weak var ridenowtextlbl: UILabel!
    
    @IBOutlet weak var findingviewyourridetextlbl: UILabel!
    @IBOutlet weak var findingviewpluse: NVActivityIndicatorView!
    @IBOutlet weak var findingviewsomepaitencetextlbl: UILabel!
    @IBOutlet weak var findingviewrideidtext: UILabel!
    @IBOutlet weak var findingviewimageview: UIImageView!
    @IBOutlet weak var findingviewoutercarview: UIView!
    
    @IBOutlet weak var findingrideview: UIView!
    
    @IBOutlet weak var findingcancelview: UIView!
    
    var dataArray: [String] = ["Your Trips".localized,"Favourite Drivers".localized,"Manage Your Cards".localized,"Rate Card".localized,"Wallet".localized,"Refer & Earn".localized,"Promotions".localized,"Language".localized,"Report Issue".localized,"Customer Support".localized,"Terms and Conditions".localized,"About us".localized,"Log Out".localized]
    
    
    var imageArray: [String] = ["ic_trips","icons8-taxi-driver-60","icons8-bank-cards-60","icons8-pricing-60","icons8-wallet-60","icons8-expensive-price--filled-50","icons8-notification-60","icons8-language-60","icons8-system-report-60","icons8-customer-support-60","icons8-terms-and-conditions-60","icons8-info-60","icons8-shutdown-60"]
    
    var droplocationcount = 0
    
     var i = 0
    
    var selectdroplocationindex = 0
    
    var getusername = ""
    
    var getuserphone = ""
    
    var getuseremail = ""
    
      var getuserimage = ""
    
    
     var pidarray:NSMutableArray = []
    
    @IBOutlet weak var droppointtextlbl: UILabel!
    @IBOutlet weak var pickfromtextlbl: UILabel!
  //  @IBOutlet weak var droplocationtableview: UITableView!
    
    @IBOutlet weak var locationview: UIView!
    
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    
    @IBOutlet weak var packagecollectionview: UICollectionView!
    @IBOutlet weak var ridenowview: UIView!
    
    @IBOutlet weak var topcategoryview: UIView!
    
    @IBOutlet weak var packageview: UIView!
    
    @IBOutlet weak var packageviewheight: NSLayoutConstraint!
    
    var locationManager = CLLocationManager()
    var selectcartypefirstvalue = 2000
     var selectfirstvalue = 0
     var selectsecondvalue = 0
     var check = 1000
     var checksection = 1000
    
    var scrollvalue = 0
    
    var carstimedata: CarsTimeModel!
    
    var categorycollectionviewcount = 0
    
    var servicecount = 0
    
    var vechilecount = 0
    
    var carcategorycollectionviewcount = 0
    
     var packagecategorycollectionviewcount = 0
    
      var strJsonData6 : String = ""
    
    @IBOutlet weak var carcategorycollectionview: UICollectionView!
    @IBOutlet weak var categorycollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        findingviewsomepaitencetextlbl.text = "Please have some paitence, we are finding ride for you".localized
        findingviewyourridetextlbl.text = "Finding Your Ride......".localized
        findingviewcancelbtntext.setTitle("Cancel".localized, for: UIControlState.normal)
        pickfromtextlbl.text = "Pickup From".localized
        droppointtextlbl.text = "Drop Point".localized
        pickuplocationtext.text = "Getting Location..".localized
        droplocationtext.text = "Set your drop point".localized
        ridelatertextlbl.text = "RIDE LATER".localized
        ridenowtextlbl.text = "RIDE NOW".localized
        sorrywedontservetextlbl.text = "Sorry , we don't serve this location yet.".localized
        gotoactiveridetextlbl.text = "Go to active ride".localized
        
        
         selectfirstvalue = 0
         selectsecondvalue = 0
        
        pickuplocationtext.textColor = UIColor.black
        
        AppConstants.BookingType = ""
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        AppConstants.movefromoutstation = ""
        
         AppConstants.dialogopen = "0"
        
        poolslidingview.isHidden = true
        
       sorrynocategoryview.backgroundColor = UIColor.appThemeColor()
        
        
        view.addSubview(poolslidingview)
        poolslidingview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
        
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        upGesture.direction = .up
        poolslidingview.addGestureRecognizer(upGesture)
        upGesture.delegate = self
        
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        downGesture.direction = .down
        poolslidingview.addGestureRecognizer(downGesture)
        downGesture.delegate = self
        
        poolslidingview.isUserInteractionEnabled = true
        
        
      //  sorrynocategoryview.isHidden = true

        gotoactiverideview.isHidden = true
        
       AppConstants.viewcontrollerself = self
        
        topnotificationiconimage.image = topnotificationiconimage.image!.withRenderingMode(.alwaysTemplate)
        topnotificationiconimage.tintColor = UIColor.appThemeColor()
        
        favpickimage.image = UIImage(named: "icons8-heart-outline-50")
        
        favdropimage.image = UIImage(named: "icons8-heart-outline-50")
         profileimage.makeViewCircular()
        
      
        
        locationview.isHidden = false
        ridenowview.isHidden = true
        packageview.isHidden = true
        topcategoryview.isHidden = true
        sorrynocategoryview.isHidden = true
        AppConstants.ridebooksuccessfully = 0
        findingrideview.isHidden = true
        
        AppConstants.checklocationvalue = 1
        
        findingviewoutercarview.layer.cornerRadius =  findingviewoutercarview.frame.width/2
        findingviewoutercarview.clipsToBounds = true
        findingviewoutercarview.layer.borderWidth = 1
        findingviewoutercarview.layer.borderColor = UIColor.white.cgColor
        
      self.droplocationtext.textColor = UIColor.lightGray
        
        AppConstants.droplng.removeAll()
        AppConstants.droplat.removeAll()
        AppConstants.droplocation.removeAll()
        
        let frame = CGRect(x: 0, y: 0, width: 230, height: 230)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballScaleMultiple, color: UIColor.appThemeColor() , padding: 10)
        
        self.findingviewpluse.addSubview(activityIndicatorView)
        
        activityIndicatorView.startAnimating()
        
        
        locationviewheight.constant = 100.0
        
        locationview.edgeWithShadow(edge: 4.0)
        
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.startUpdatingLocation()
        
        mapview.animate(toZoom: 15)
        
        
         mapview.delegate = self
        
        topcategoryview.setCornerCircular(12.0)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.scrollview.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.scrollview.addGestureRecognizer(swipeRight)
        
        
        
       
        showLoaderWithoutBackground()
       
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGACTIVE
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: ActiveRideModel.self)
        
        
       
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func editprofilebtnclick(_ sender: Any) {
        self.slidingview.alpha = 0
        self.blackView.alpha = 0
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        self.presentVC("ProfileViewController")
    }
    
    
    @objc func getDriverLocation(timer : Timer){
        
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
        
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGAUTOCANCEL
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserCancelModel.self)
        
    }
    
    
    func callpoolareaapi(){
       
        
        let dic1 = ["latitude": AppConstants.droplat[0],
                    "area_id": AppConstants.AreaID,
                    "longitude": AppConstants.droplng[0],
                    "service_type": AppConstants.ServiceType
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKDROPLOCATIONAREA
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: PoolAreaModel.self)
        
    }
    
    
    @IBAction func twoseatbtnclick(_ sender: Any) {
        poolslidingview.isHidden = true
        
        self.numberofriders = 2
        self.callpoolCheckoutmethod()
       // self.callpoolareaapi()
        
    }
    
    
    @IBAction func oneseatbtnclick(_ sender: Any) {
          poolslidingview.isHidden = true
         self.numberofriders = 1
        self.callpoolCheckoutmethod()
         //self.callpoolareaapi()
        
        
    }
    
    
    func callpoolCheckoutmethod(){
        
        AppConstants.BookingType = "1"
        pidarray.removeAllObjects()
        strJsonData6.removeAll()
        
        
        if AppConstants.droplng.count == 0{
            
            
        }else{
        
        
        
                        if AppConstants.ServiceType == "1"{
        
        
                            for i in 0...AppConstants.droplat.count - 1{
                                var nsdic : [String: AnyObject] = [:]
        
                                nsdic.updateValue((i + 1) as AnyObject, forKey: "stop")
                                nsdic.updateValue(AppConstants.droplat[i] as AnyObject, forKey: "drop_latitude")
                                nsdic.updateValue(AppConstants.droplng[i] as AnyObject, forKey: "drop_longitude")
                                nsdic.updateValue(AppConstants.droplocation[i] as AnyObject, forKey: "drop_location")
                                nsdic.updateValue("1" as AnyObject, forKey: "status")
        
        
                                print(nsdic)
        
        
                                //  strJsonData1 = json(from: nsdic)!
        
                                pidarray.add(nsdic)
        
        
        
                            }
        
                            print(pidarray)
        
                            strJsonData6 = json(from: pidarray)!
        
                        }else{
        
                            var nsdic : [String: AnyObject] = [:]
        
                            nsdic.updateValue((1) as AnyObject, forKey: "stop")
                            nsdic.updateValue(AppConstants.droplat[0] as AnyObject, forKey: "drop_latitude")
                            nsdic.updateValue(AppConstants.droplng[0] as AnyObject, forKey: "drop_longitude")
                            nsdic.updateValue(AppConstants.droplocation[0] as AnyObject, forKey: "drop_location")
                            nsdic.updateValue("1" as AnyObject, forKey: "status")
        
                            pidarray.add(nsdic)
                            strJsonData6 = json(from: pidarray)!
        
                        }
        
        
        }
        
        
        
                    let dic1 = ["service_type": AppConstants.ServiceType,
                                "vehicle_type": AppConstants.VehicleType,
                                "area":AppConstants.AreaID,
                                "pickup_latitude":AppConstants.userselectaddressLat,
                                "pickup_longitude":AppConstants.userselectaddressLng,
                                "total_drop_location":AppConstants.droplat.count,
                                "drop_location":strJsonData6,
                                "booking_type":AppConstants.BookingType,
                                "pick_up_locaion":AppConstants.userselectaddressLocation,
                                "package_id":AppConstants.VehicleID,
                                "number_of_rider": self.numberofriders
        
        
        
                        ] as [String : AnyObject]
        
                    showLoaderWithoutBackground()
        
        
        
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKOUT
                    ServiceManager.sharedInstance.delegate = self
        
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if self.categorycollectionviewcount == 1{
            
            topcategoryview.isHidden = true
        }else{
            topcategoryview.isHidden = false
            
        }
        
        
        if AppConstants.droplat.count == 0{
            
            addstopsvalue.text = "Add stops".localized
            self.droplocationtext.text = "Set your drop point".localized
            
           // self.droplocationtext.textColor = UIColor.black
            
            
        }else if AppConstants.droplat.count == 1{
           addstopsvalue.text = "Add stops".localized
            
        }
        
        else
        
        {
            if AppConstants.droplat.count == 2{
                 addstopsvalue.text =  String((AppConstants.droplat.count - 1)) + " stop".localized
            }else{
                
                 addstopsvalue.text =  String((AppConstants.droplat.count - 1)) + " stops".localized
            }
            
           
            self.droplocationtext.text = AppConstants.droplocation[0]
            
            self.droplocationtext.textColor = UIColor.black
            
        }
       
        
         getusername = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.NAME)
        
         getuserphone = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.MOBILE_NUMBER)
        
         getuseremail = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.EMAIL_ID)
        
         getuserimage = UserDefaultUtility.retrieveStringWithKey(AppConstants.UserDefaultKeys.USER_IMAGE)
        
        
        
        
        
        
        
        if getuserimage != ""{
            
            
            AppConstants.downloadimage(imagename: getuserimage, imageview: profileimage, placeholderimage: "profileeee")
            
         
        }else{
            
            profileimage.image = UIImage(named: "profileeee") as UIImage?
            
        }
        
        
        
        username.text = getusername
        userphonetext.text = getuserphone
        useremailtext.text = getuseremail
        
        
        
        self.startTimer()
        
        if  AppConstants.BookingType == "2"{
            
            pidarray.removeAllObjects()
            strJsonData6.removeAll()
            
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            
            if AppConstants.ServiceType == "1"{
            
            for i in 0...AppConstants.droplat.count - 1{
                var nsdic : [String: AnyObject] = [:]
                
                nsdic.updateValue((i + 1) as AnyObject, forKey: "stop")
                nsdic.updateValue(AppConstants.droplat[i] as AnyObject, forKey: "drop_latitude")
                nsdic.updateValue(AppConstants.droplng[i] as AnyObject, forKey: "drop_longitude")
                nsdic.updateValue(AppConstants.droplocation[i] as AnyObject, forKey: "drop_location")
                nsdic.updateValue("1" as AnyObject, forKey: "status")
                
                
                print(nsdic)
                
                
                //  strJsonData1 = json(from: nsdic)!
                
                pidarray.add(nsdic)
                
                
                
            }
            
            print(pidarray)
            
            strJsonData6 = json(from: pidarray)!
            }else{
                
                var nsdic : [String: AnyObject] = [:]
                
                nsdic.updateValue((1) as AnyObject, forKey: "stop")
                nsdic.updateValue(AppConstants.droplat[0] as AnyObject, forKey: "drop_latitude")
                nsdic.updateValue(AppConstants.droplng[0] as AnyObject, forKey: "drop_longitude")
                nsdic.updateValue(AppConstants.droplocation[0] as AnyObject, forKey: "drop_location")
                nsdic.updateValue("1" as AnyObject, forKey: "status")
                
                 pidarray.add(nsdic)
              
            
            strJsonData6 = json(from: pidarray)!
                
            }
            
            
            print(strJsonData6)
            
            
           
            
            let dic1 = ["service_type": AppConstants.ServiceType,
                        "vehicle_type": AppConstants.VehicleType,
                        "area":AppConstants.AreaID,
                        "pickup_latitude":AppConstants.userselectaddressLat,
                        "pickup_longitude":AppConstants.userselectaddressLng,
                        "total_drop_location":AppConstants.droplat.count,
                        "drop_location":strJsonData6,
                        "booking_type":AppConstants.BookingType,
                        "pick_up_locaion":AppConstants.userselectaddressLocation,
                        "package_id":"",
                        "later_date":AppConstants.SelectDate,
                        "later_time":AppConstants.SelectTime
                
                
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKOUT
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
            
            
            
        }else{
            
            
            
        }
        
        
         gotoactiverideview.isHidden = true
        
        if AppConstants.ridebooksuccessfully == 1{
            
            locationview.isHidden = true
            ridenowview.isHidden = true
            packageview.isHidden = true
            topcategoryview.isHidden = true
              sorrynocategoryview.isHidden = true
             AppConstants.ridebooksuccessfully = 0
             findingrideview.isHidden = false
            
            findingviewrideidtext.text = "Ride id: # " + AppConstants.bookingId
            
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            
            AppConstants.timerForGetDriverLocation1 = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(MapViewController.getDriverLocation), userInfo: nil, repeats: true)
            
        }else{
            AppConstants.ridebooksuccessfully = 0
            
        }
        
          if(AppConstants.checklocationvalue == 1){
            
            self.locationManager.startUpdatingLocation()
            
            mapview.animate(toZoom: 15)
        }
        
        if(AppConstants.checklocationvalue == 2){
            
            
            if(AppConstants.droplat.count == 0){
                
                
               // bottomdroplocationtext.text = "Set your drop point".localized
                
                
                
            }else{
                
                
                if AppConstants.checkfavvalue == 2{
                    AppConstants.checkfavvalue = 1
                    favdropimage.image = UIImage(named: "icons8-heart-outline-48")

                }else{
                    favdropimage.image = UIImage(named: "icons8-heart-outline-50")

                }
                
                if AppConstants.newchecklocationvalue == "0"{
                    
                    self.i = 1
                    
                }else{
                    AppConstants.newchecklocationvalue = "0"
                }
                
                
             
                
                
                
                if AppConstants.droplat.count == 0{
                    
                    
                }else{
                    self.droplocationtext.text = AppConstants.droplocation[0]
                    
                     self.droplocationtext.textColor = UIColor.black
                    
                    
                    self.locationManager.delegate = self
                    self.locationManager.requestAlwaysAuthorization()
                    //  bottomdroplocationtext.text = GlobalVarible.UserDropLocationText
                    mapview.settings.myLocationButton = false
                    //  defaultmarkerimage.hidden = true
                    
                    selectdroplocationindex = AppConstants.droplat.count - 1
                    let position = CLLocationCoordinate2DMake(Double(AppConstants.droplat[0])!, Double(AppConstants.droplng[0])!)
                    //  let position = CLLocationCoordinate2DMake(CLLocationDegrees(AppConstants.droplat.endIndex), CLLocationDegrees(AppConstants.droplng.endIndex))
                    // self.setuplocationMarker(position)
                    mapview.animate(toLocation: position)
                    
                    
                    
                }
                
//                if AppConstants.ServiceType == "1"{
//                    locationviewheight.constant = CGFloat(100.0 + (Float(droplocationcount) * 30.0))
//                    droplocationtableview.isHidden = false
//
//                }else{
//
//                    self.droplocationtext.text = AppConstants.droplocation[0]
//
//                    self.droplocationtext.textColor = UIColor.black
//
//                    locationviewheight.constant = CGFloat(100.0)
//                    droplocationtableview.isHidden = true
//
//                }
                
                //   ApiManager.sharedInstance.protocolmain_Catagory = self
                //   ApiManager.sharedInstance.FindDistance()
            }
            
        }
        
        if(AppConstants.checklocationvalue == 3){
            
            
            if AppConstants.checkfavvalue == 3{
                AppConstants.checkfavvalue = 1
                favpickimage.image = UIImage(named: "icons8-heart-outline-48")

            }else{
                favpickimage.image = UIImage(named: "icons8-heart-outline-50")

            }
            
            
            if AppConstants.newchecklocationvalue == "0"{
                
                self.i = 1
                
            }else{
                AppConstants.newchecklocationvalue = "0"
            }
            
            
            self.locationManager.delegate = self
            self.locationManager.requestAlwaysAuthorization()
           self.pickuplocationtext.text =  AppConstants.userselectaddressLocation
            mapview.settings.myLocationButton = false
            //  defaultmarkerimage.hidden = true
            
            
            let position = CLLocationCoordinate2DMake(Double(AppConstants.userselectaddressLat)!, Double(AppConstants.userselectaddressLng)!)
            // self.setuplocationMarker(position)
            mapview.animate(toLocation: position)
            
            //   ApiManager.sharedInstance.protocolmain_Catagory = self
            //   ApiManager.sharedInstance.FindDistance()
            
            
        }
        
        
        
       
        droplocationcount = AppConstants.droplat.count
      //  locationviewheight.constant = CGFloat(100.0 + (Float(droplocationcount) * 30.0))
        
        
     //   droplocationtableview.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoactiveridebtnclick(_ sender: Any) {
        
        if AppConstants.bookingStatus == "1005"{
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            
            AppConstants.newtimer?.cancel()
            AppConstants.newtimer = nil
             self.presentVC("RideFareViewController")
            
        }else{
            
             self.presentVC("TrackRideViewController")
        }
        
        
       
    }
    
    @IBAction func findingcancelbtnclick(_ sender: Any) {
        locationview.isHidden = false
        ridenowview.isHidden = false
        packageview.isHidden = false
        topcategoryview.isHidden = false
         findingrideview.isHidden = true
          sorrynocategoryview.isHidden = true
        
        
        
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGAUTOCANCEL
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: UserCancelModel.self)
        
        
    }
    
    
    @IBAction func ridelaterbtnclick(_ sender: Any) {
         AppConstants.BookingType = "2"
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        
        if AppConstants.droplat.count == 0{
            
            self.showErrorAlert("", alertMessage: "Please enter drop location first".localized, VC: self)
        }else{
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "TimePickerViewController")as! TimePickerViewController
         myModalViewController.viewcontrollerself = self
            myModalViewController.matchstring = ""
        myModalViewController.modalPresentationStyle = .overCurrentContext
        self.present(myModalViewController, animated: true, completion: nil)
            
        }
        
    }
    
    
    func createTimer() {
        
        AppConstants.timer = DispatchSource.makeTimerSource(queue: .main)
        
        
        AppConstants.timer?.schedule(deadline: .now(), repeating: .seconds(3))
        
   
        
        AppConstants.timer?.setEventHandler(handler: { [weak self] in      // assuming you're referencing `self` in here, use
            
            
           
            
            
            let dic1 = ["area": AppConstants.AreaID,
                        "service_type": AppConstants.ServiceType,
                        "vehicle_type": AppConstants.VehicleType,
                        "distance": "5",
                        "latitude": AppConstants.userselectaddressLat,
                        "longitude": AppConstants.userselectaddressLng
                        
                        ] as [String : AnyObject]
            
           // self?.showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERDRIVER
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: NearestDriverModel.self)
            
            
//            ApiManager.sharedInstance.protocolmain_Catagory = self
//            ApiManager.sharedInstance.NearestDriverUrl(latitude: GlobalVarible.PickUpLat, longitude: GlobalVarible.PickUpLng, CARTYPEId: GlobalVarible.cartypeid)
            
            
            //  print("timerstatrt")
        })
        AppConstants.timer?.resume()
        // note, timer is not yet started; you have to call `timer?.resume()`
    }
    
    func startTimer() {
        // timer?.resume()
        createTimer()
    }
    
    
    func stopTimer() {
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
    }
    
    
    
    
    
    
    @IBAction func ridenowbtnclick(_ sender: Any) {
       
        
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        
        
        
        
        if AppConstants.ServiceType == "4" {
            
            
            if AppConstants.droplat.count == 0{
                
            
                    self.showErrorAlert("", alertMessage: "Please enter drop location first".localized, VC: self)
                
                }else{
                    
                   self.callpoolareaapi()
                    
                }
                
            
            
            
        }else if AppConstants.ServiceType == "5" {
        
            if AppConstants.droplat.count == 0{
                
                
                self.showErrorAlert("", alertMessage: "Please enter drop location first".localized, VC: self)
                
            }else{
        
                
                self.callpoolareaapi()
           
        
            }
        
        } else if AppConstants.ServiceType == "1"{
        
            
            if AppConstants.droplat.count == 0{
                self.callpoolCheckoutmethod()
            }else{
                self.callpoolareaapi()
                
            }
        
        
       
        }else{
            
            self.callpoolCheckoutmethod()
        }
        
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    @IBAction func favdropupbtnclick(_ sender: Any) {
        
       // if(AppConstants.userselectdropaddressLocation == "No drop off point"){
        
        if AppConstants.droplat.count == 0{
            
            showErrorAlert("Alert".localized, alertMessage: "Please select drop location First.".localized, VC: self)
            
           // self.showalert(message: "Please select drop location First.")
            
        } else {
            
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myModalViewController = storyboard.instantiateViewController(withIdentifier: "FavoriteLocationAddVC")as! FavoriteLocationAddVC
            myModalViewController.modalPresentationStyle = .overCurrentContext
            myModalViewController.strAddress = AppConstants.droplocation[selectdroplocationindex]
            myModalViewController.getIndex = "2"
            myModalViewController.selectedindex = selectdroplocationindex
            self.present(myModalViewController, animated: false, completion: nil)
            
            
        }
    }
    
    @IBAction func droplocationbtnclick(_ sender: Any) {
        
        if AppConstants.droplng.count == 0{
            
            textvalue = 1
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            droplocationtext.textColor = UIColor.black
            pickuplocationtext.textColor = UIColor.lightGray
            dotaddressimage.image = UIImage(named: "dropoffaddress") as UIImage?
            centeraddressimage.image = UIImage(named: "Record-25") as UIImage?
            AppConstants.checklocationvalue = 2
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let LocationControllerVC = storyBoard.instantiateViewController(withIdentifier: "LocationSearchVC") as! LocationSearchVC
            LocationControllerVC.getIndex = "2"
            //LocationControllerVC.selectedindex = selectdroplocationindex
            self.present(LocationControllerVC, animated:true, completion:nil)
            
        }else{
        
        
        if textvalue == 1{
            
            textvalue = 1
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            droplocationtext.textColor = UIColor.black
            pickuplocationtext.textColor = UIColor.lightGray
            dotaddressimage.image = UIImage(named: "dropoffaddress") as UIImage?
            centeraddressimage.image = UIImage(named: "Record-25") as UIImage?
            AppConstants.checklocationvalue = 2
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let LocationControllerVC = storyBoard.instantiateViewController(withIdentifier: "LocationSearchVC") as! LocationSearchVC
            LocationControllerVC.getIndex = "2"
            //LocationControllerVC.selectedindex = selectdroplocationindex
            self.present(LocationControllerVC, animated:true, completion:nil)
            
        }else{
            
            textvalue = 1
            let position = CLLocationCoordinate2DMake(Double(AppConstants.droplat[0])!, Double(AppConstants.droplng[0])!)
            // self.setuplocationMarker(position)
            mapview.animate(toLocation: position)
            mapview.animate(toZoom: 15)
            droplocationtext.textColor = UIColor.black
            pickuplocationtext.textColor = UIColor.lightGray
            dotaddressimage.image = UIImage(named: "dropoffaddress") as UIImage?
            centeraddressimage.image = UIImage(named: "Record-25") as UIImage?
            AppConstants.checklocationvalue = 2
          
            
            
            
        }
        
        }
        
            
            
        
    }
    @IBAction func gettinglocationbtnclick(_ sender: Any) {
        
         if textvalue == 0 {
         AppConstants.checklocationvalue = 3
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        dotaddressimage.image = UIImage(named: "pickupaddress") as UIImage?
        centeraddressimage.image = UIImage(named: "Record-25 (1)") as UIImage?
            
           
           pickuplocationtext.textColor = UIColor.black
            droplocationtext.textColor = UIColor.lightGray
            
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let LocationControllerVC = storyBoard.instantiateViewController(withIdentifier: "LocationSearchVC") as! LocationSearchVC
        LocationControllerVC.getIndex = "1"
        self.present(LocationControllerVC, animated:true, completion:nil)
            
            
            
         }else{
            
            
            AppConstants.checklocationvalue = 3
            
            let position = CLLocationCoordinate2DMake(Double(AppConstants.userselectaddressLat)!, Double(AppConstants.userselectaddressLng)!)
            // self.setuplocationMarker(position)
            mapview.animate(toLocation: position)
            mapview.animate(toZoom: 15)
            
            pickuplocationtext.textColor = UIColor.black
            droplocationtext.textColor = UIColor.lightGray
            
            dotaddressimage.image = UIImage(named: "pickupaddress") as UIImage?
            centeraddressimage.image = UIImage(named: "Record-25 (1)") as UIImage?
            
            textvalue = 0
        }
    }
    
    @IBAction func favpickupbtnclick(_ sender: Any) {
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "FavoriteLocationAddVC")as! FavoriteLocationAddVC
        myModalViewController.getIndex = "1"
        myModalViewController.modalPresentationStyle = .overCurrentContext
        myModalViewController.strAddress = AppConstants.userselectaddressLocation
        self.present(myModalViewController, animated: false, completion: nil)
    }
    
    @IBAction func notificationbtnclick(_ sender: Any) {
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        self.presentVC("NotificationViewController")
        
    }
    
    @IBAction func menubtnclick(_ sender: Any) {
        AppConstants.timer?.cancel()
        AppConstants.timer = nil
        
         self.eventAnimationPopUp()
        
    }
    
    
    func getpolygon(){
        
        
        
       // let path = GMSMutablePath()
        
      

        for i in 0...(carstimedata.data?.areaCoordinatesIos?.count)! - 1{

            newpath.add(CLLocationCoordinate2D(latitude: Double((carstimedata.data?.areaCoordinatesIos![i].latitude)!)!, longitude: Double((carstimedata.data?.areaCoordinatesIos![i].longitude)!)!))
        }

//        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
//        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
//        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
//        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
//        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        
//        self.polyline12 = MKPolygon(newpath)

          self.polyline12 = GMSPolyline(path: newpath)
//        self.polyline.strokeColor = .clear
//        self.polyline.strokeWidth = 0.0
//      self.polyline.map = mapview
    }
    
    
    func carcarstimeapi(){
        
        
       
        
        let dic1 = ["latitude": AppConstants.userselectaddressLat,
                    "longitude": AppConstants.userselectaddressLng
            
            
            
            
            ] as [String : AnyObject]
        
        self.showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.HOMECARS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CarsTimeModel.self)
        
        
        
    }
    
    
   
        
    
    
    
    func eventAnimationPopUp(){
        
        //  slidinginnerview.layer.cornerRadius = 5
        
        slidingview.layer.cornerRadius = 5
        slidingview.clipsToBounds = true
        
        if let window = UIApplication.shared.keyWindow{
            print(window.frame)
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            let lefswipe = (UISwipeGestureRecognizer(target: self, action:#selector(slideToRightWithGestureRecognizer)))
            lefswipe.direction = .left
            self.blackView.addGestureRecognizer(lefswipe)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            window.addSubview(slidingview)
            slidingview.frame = CGRect(x: 15, y: 15, width: window.frame.width-100, height: window.frame.height-30)
            blackView.frame = window.frame
            blackView.alpha = 0
            //self.sligingview.alpha = 1
            
            slidingview.slideLeft()
            self.slidingview.alpha = 1
            blackView.alpha = 1
            //sligingview.slideLeft()
            
        }
    }
    @objc func handleDismiss() {
        //sligingview.slideLeft()
        slidingview.slideRight()
        self.slidingview.alpha = 0
        self.blackView.alpha = 0
        //self.blackView.removeFromSuperview()
        //self.sligingview.removeFromSuperview()
    }
    @objc func slideToRightWithGestureRecognizer(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped right")
                slidingview.slideRight()
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
            default:
                break
            }
        }
    }
    
    
    @IBAction func currentlocationbtnclick(_ sender: Any) {
        
        self.locationManager.startUpdatingLocation()
        
        mapview.animate(toZoom: 15)
    }
    
    
    @IBAction func multidroplocationbtnclick(_ sender: Any) {
        
       
        if AppConstants.droplat.count == Int((AppConstants.userconfiguredata.data?.Totaldistination)!)! + 1{
        
        }else{
            
            if AppConstants.droplat.count == 0{
                
                self.showErrorAlert("", alertMessage: "Please Enter drop Location".localized, VC: self)
            
            }else{
            
            
            AppConstants.checklocationvalue = 2
           
            
             textvalue = 1
            
            droplocationtext.textColor = UIColor.black
            pickuplocationtext.textColor = UIColor.lightGray
            AppConstants.timer?.cancel()
            AppConstants.timer = nil
            
            dotaddressimage.image = UIImage(named: "dropoffaddress") as UIImage?
            centeraddressimage.image = UIImage(named: "Record-25") as UIImage?
             self.presentVC("AddStopsViewController")
            
            }
            
            }
            
        
        
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        
        if gesture.direction == UISwipeGestureRecognizerDirection.right {

            if selectfirstvalue == 0{


            }else{
                check = selectfirstvalue - 1
                checksection = 0
                selectfirstvalue = selectfirstvalue - 1

                let indexPathForFirstRow = IndexPath(row: selectfirstvalue, section: 0)
                self.categorycollectionview.scrollToItem(at: indexPathForFirstRow, at: .centeredHorizontally, animated: true)

                
                
                self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
                
                if self.carcategorycollectionviewcount == 0{
                    
                    packageviewheight.constant = 60.0
                    packageview.isHidden = false
                     pleaseselectpackagetextlbl.text = "Please select a package".localized
                    packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package?.count)!
                    self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package![0].vehicles?.count)!
                    let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                    
                    
                    self.collectionView(packagecollectionview, didSelectItemAt: indexPathForFirstRow)
                    categorycollectionview.reloadData()
                    packagecollectionview.reloadData()
                    carcategorycollectionview.reloadData()
                    
                    
                }else{
                    packagecategorycollectionviewcount = 0
                    packageviewheight.constant = 0.0
                    packageview.isHidden = true
                    pleaseselectpackagetextlbl.text = ""
                    self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
                    let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                    
                    
                    self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
                    categorycollectionview.reloadData()
                    packagecollectionview.reloadData()
                    carcategorycollectionview.reloadData()
                    
                }

               // carcategorycollectionviewcount = 3

               // carcategorycollectionview.reloadData()

              //  categorycollectionview.reloadData()


            }



        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {


            if selectfirstvalue == categorycollectionviewcount{


            }else{



                print(check)

                if categorycollectionviewcount == check + 1{
                    print("test")
                }else{

                    check = selectfirstvalue + 1
                    checksection = 0
                    selectfirstvalue = selectfirstvalue + 1
                    let indexPathForFirstRow = IndexPath(row: selectfirstvalue, section: 0)
                    self.categorycollectionview.scrollToItem(at: indexPathForFirstRow, at: .centeredHorizontally, animated: true)

                    self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
                    
                    if self.carcategorycollectionviewcount == 0{
                        selectsecondvalue = 0
                        packageviewheight.constant = 60.0
                        packageview.isHidden = false
                        pleaseselectpackagetextlbl.text = "Please select a package".localized
                        packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package?.count)!
                        self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package![0].vehicles?.count)!
                        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                        
                        
                        self.collectionView(packagecollectionview, didSelectItemAt: indexPathForFirstRow)
                        categorycollectionview.reloadData()
                        packagecollectionview.reloadData()
                        carcategorycollectionview.reloadData()
                        
                        
                    }else{
                        packagecategorycollectionviewcount = 0
                        packageviewheight.constant = 0.0
                        packageview.isHidden = true
                        pleaseselectpackagetextlbl.text = ""
                        self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
                        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                        
                        
                        self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
                        categorycollectionview.reloadData()
                        packagecollectionview.reloadData()
                        carcategorycollectionview.reloadData()
                        
                    }

                   // carcategorycollectionview.reloadData()

                    

                }

            }


        }

   }

  

}

extension MapViewController: CLLocationManagerDelegate, GMSMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            
            reverseGeocodeCoordinate(coordinate: location.coordinate)
            mapview.animate(toLocation: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
            AppConstants.userselectaddressLng = String(location.coordinate.longitude)
            AppConstants.userselectaddressLat = String(location.coordinate.latitude)
            
            
            mapview.animate(toZoom: 15)
            self.locationManager.stopUpdatingLocation()
            
            
        }
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        self.ridenowview.isHidden = true
        self.topcategoryview.isHidden = true
        self.packageview.isHidden = true
        self.sorrynocategoryview.isHidden = true
      
   
        
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        reverseGeocodeCoordinate(coordinate: position.target)
        
//        if mapcameracheck == 1 {
//
//            mapcameracheck = 0
//        }else{
//            if(GlobalVarible.checklocationvalue == 2){
//
//            }else{
//                self.mapview.clear()
//                //  self.postdata.removeAll()
//                // self.datagetfromgeofire()
//
//            }
//
//            reverseGeocodeCoordinate(coordinate: position.target)
//
//        }
//
//
//        //self.ridenowview.hidden = false
//
//
//        print(position.target.latitude)
//        print(position.target.longitude)
        
    }
    
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                self.ridenowview.isHidden = false
                if self.categorycollectionviewcount == 1{
                    
                    self.topcategoryview.isHidden = true
                }else{
                    self.topcategoryview.isHidden = false
                    
                }
                
                self.packageview.isHidden = false
                
                
                 if(AppConstants.checklocationvalue == 1){
                    
                    
                    if(self.i == 1){
                        self.pickuplocationtext.text =  AppConstants.userselectaddressLocation
                        self.i = 0
                        
                        self.carcarstimeapi()
                        
                    }else{
                        
                        
     
                
                
                let lines = address.lines
                    AppConstants.userselectaddressLng = String(coordinate.longitude)
                    AppConstants.userselectaddressLat = String(coordinate.latitude)
                AppConstants.userselectaddressLocation = lines!.joined(separator: " ")
                self.pickuplocationtext.text = lines!.joined(separator: " ")
                    
                        if let city = address.locality{
                            
                            AppConstants.pickusercityname1  = String(city)
                            
                        }
                        else{
                            AppConstants.pickusercityname1 = ""
                            
                        }
                    
                        
                        if (AppConstants.usercityname == AppConstants.pickusercityname1){
                            
                            
                        }else{
                            
                            
                           self.carcarstimeapi()
                        }
                    
                    
                  

                    }
                    
                }
                
                if(AppConstants.checklocationvalue == 3){
                    if(self.i == 1){
                        self.pickuplocationtext.text =  AppConstants.userselectaddressLocation
                        self.i = 0
                        
                        self.carcarstimeapi()
                        
                    }else{
                  
                        if let city = address.locality{
                            
                            AppConstants.pickusercityname1  = String(city)
                            
                        }
                        else{
                            AppConstants.pickusercityname1 = "Dummy City"
                            
                        }
                        
                    let lines = address.lines
                    AppConstants.userselectaddressLng = String(coordinate.longitude)
                    AppConstants.userselectaddressLat = String(coordinate.latitude)
                    AppConstants.userselectaddressLocation = lines!.joined(separator: " ")
                    self.pickuplocationtext.text = lines!.joined(separator: " ")
                        
                        
                        if (AppConstants.usercityname == AppConstants.pickusercityname1){
                            
                            
                        }else{
                            
                            
                            self.carcarstimeapi()
                        }
                    
                    }
                    
                }
                
                if(AppConstants.checklocationvalue == 2){
                    
                    
                    if(self.i == 1){
                       
                        self.i = 0
                        
     
                        if AppConstants.droplat.count == 0{
                            
                            
                        }else{
                           
                            
                            if let city = address.locality{
                                
                                AppConstants.dropusercityname1  = String(city)
                                
                            }
                            else{
                                AppConstants.dropusercityname1 = "Dummy City"
                                
                            }
                            
                            self.droplocationtext.text = AppConstants.droplocation[0]
                            
                            self.droplocationtext.textColor = UIColor.black
                            
                        }
                        
                        
                    }else{
                        
                 
                    let lines = address.lines
                        
                        
                        if AppConstants.droplat.count == 0{
                            
                            
                            if let city = address.locality{
                                
                                AppConstants.dropusercityname1  = String(city)
                                
                            }
                            else{
                                AppConstants.dropusercityname1 = "Dummy City"
                                
                            }
                            
                            
                            
                             AppConstants.droplat.append(String(coordinate.latitude))
                            AppConstants.droplng.append(String(coordinate.longitude))
                            AppConstants.droplocation.append(lines!.joined(separator: " "))
                            
                          
                            
                            self.droplocationtext.text = lines!.joined(separator: " ")
                            
                            self.droplocationtext.textColor = UIColor.black
                            
                            
                            
                            
                           
                            
                        }else{
                            
                            if let city = address.locality{
                                
                                AppConstants.dropusercityname1  = String(city)
                                
                            }
                            else{
                                AppConstants.dropusercityname1 = "Dummy City"
                                
                            }
                            
                            
                            AppConstants.droplat[0] = String(coordinate.latitude)
                            AppConstants.droplng[0] = String(coordinate.longitude)
                            AppConstants.droplocation[0] = lines!.joined(separator: " ")
                            
                            self.droplocationtext.text = lines!.joined(separator: " ")
                        
                         self.droplocationtext.textColor = UIColor.black
                            
                        }
                    
                  
       
                    
                    }
                    
                }
                
                UIView.animate(withDuration: 0.25) {
                    self.view.layoutIfNeeded()
                }
                
            }
            
        }
        
    }
    
    
}

extension MapViewController: UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate{
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([(AppConstants.userconfiguredata.data?.customerSupport?.mail!)!])
        mailComposerVC.setSubject("Report Issue Regarding TaxiUser App".localized)
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!".localized, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email".localized, message: "Your device could not send e-mail.  Please check e-mail configuration and try again.".localized, delegate: self, cancelButtonTitle: "ok".localized)
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
            return dataArray.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
            let cell1 = menutable.dequeueReusableCell(withIdentifier: "MenuTable1", for: indexPath)
            
            
            
            let imageview :UIImageView = (cell1.contentView.viewWithTag(1) as? UIImageView)!
            let label : UILabel = (cell1.contentView.viewWithTag(2) as? UILabel)!
            let labelshow : UILabel = (cell1.contentView.viewWithTag(3) as? UILabel)!
            
            
            if indexPath.row == 6{
                labelshow.isHidden = false
                
                
            }else if indexPath.row == 11  {
                labelshow.isHidden = false
                }else{
                 labelshow.isHidden = true
                
            }
            
            let image = UIImage(named: imageArray[indexPath.row])
            
            imageview.image = image
            label.text = dataArray[indexPath.row]
            
            
            return cell1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
     
           
             menutable.deselectRow(at: indexPath, animated: true)
            if indexPath.row == 0{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                
               
               self.presentVC("AllTripsViewController")
            }
            if indexPath.row == 1{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("ManageFavouriteViewController")
                
            }
            if indexPath.row == 2{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                AppConstants.enteramount = ""
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("ManageYourCardViewController")
                
            }
            if indexPath.row == 3{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                 self.presentVC("RateCardViewController")
                
                
                
            }
            if indexPath.row == 4{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("WalletViewController")
                
            }
            if indexPath.row == 5{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("ReferEarnViewController")
                
            }
            if indexPath.row == 6{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("NotificationViewController")
                
            }
            if indexPath.row == 7{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                
                let alertView = UIAlertController(title: "Select Language".localized, message: "Please Choose Language".localized, preferredStyle: .alert)
                let langEnglish = UIAlertAction(title: "English", style: .default, handler: { (alert) in
                    
//                    GlobalVarible.languagecodeselectinmenu = 1
//
//                    GlobalVarible.languagecode = "en"
//
//                    UserDefaults.standard.set("en", forKey: "PreferredLanguage")
//                    Language.language = Language(rawValue: "en")!
//                    UserDefaults.standard.synchronize()
                    
                })
                let langSpanish = UIAlertAction(title: "Spanish", style: .default, handler: { (alert) in
                    
//                    GlobalVarible.languagecodeselectinmenu = 1
//
//                    GlobalVarible.languagecode = "es"
//
//                    UserDefaults.standard.set("es", forKey: "PreferredLanguage")
//                    Language.language = Language(rawValue: "es")!
//                    UserDefaults.standard.synchronize()
                    
                })
                let langFrench = UIAlertAction(title: "French", style: .default, handler: { (alert) in
                    
//                    GlobalVarible.languagecodeselectinmenu = 1
//
//                    GlobalVarible.languagecode = "fr"
//
//                    UserDefaults.standard.set("fr", forKey: "PreferredLanguage")
//                    Language.language = Language(rawValue: "fr")!
//                    UserDefaults.standard.synchronize()
                    
                })
                let langPortuguese = UIAlertAction(title: "Portuguese", style: .default, handler: { (alert) in
                    
//                    GlobalVarible.languagecodeselectinmenu = 1
//
//                    GlobalVarible.languagecode = "pt"
//
//                    UserDefaults.standard.set("pt", forKey: "PreferredLanguage")
//                    Language.language = Language(rawValue: "pt")!
//                    UserDefaults.standard.synchronize()
                    
                })
                let langTurkish = UIAlertAction(title: "Turkish", style: .default, handler: { (alert) in
                    
//                    GlobalVarible.languagecodeselectinmenu = 1
//
//                    GlobalVarible.languagecode = "tr"
//
//                    UserDefaults.standard.set("tr", forKey: "PreferredLanguage")
//                    Language.language = Language(rawValue: "tr")!
//                    UserDefaults.standard.synchronize()
                    
                })
                let langArabic = UIAlertAction(title: "عربى", style: .default, handler: { (alert) in
//                    GlobalVarible.languagecodeselectinmenu = 1
//                    UserDefaults.standard.set("ar", forKey: "PreferredLanguage")
//                    GlobalVarible.languagecode = "ar"
//                    Language.language = Language(rawValue: "ar")!
                    
                })
                let cancelAction = UIAlertAction(title: "Cancel".localized,
                                                 style: .cancel, handler: nil)
                alertView.addAction(langEnglish)
                alertView.addAction(langSpanish)
                alertView.addAction(langFrench)
                alertView.addAction(langPortuguese)
                alertView.addAction(langTurkish)
                alertView.addAction(langArabic)
                alertView.addAction(cancelAction)
                self.present(alertView, animated: true, completion: nil)
                
                
                
            }
            if indexPath.row == 8{
                
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                
                let mailComposeViewController = configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }
                
            }
            if indexPath.row == 9{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                 self.presentVC("CustomerSupportViewController")
                
            }
            if indexPath.row == 10{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("TermsConditionsViewController")
                
            }
            if indexPath.row == 11{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                self.presentVC("AboutUsViewController")
                
            }
            if indexPath.row == 12{
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
                
                let refreshAlert = UIAlertController(title:  "Log Out".localized, message: "Are You Sure to Log Out ?".localized, preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Confirm".localized , style: .default, handler: { (action: UIAlertAction!) in
                    
                    
                    
                   
                  
                    self.showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERLOGOUT
                    ServiceManager.sharedInstance.delegate = self
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: LogOutModel.self)
                    
                }))
                
                
                refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
                    
                    refreshAlert .dismiss(animated: true, completion: nil)
                    
                    
                }))
                
                present(refreshAlert, animated: true, completion: nil)

                
            }
            
            
            
            
        
    }
    
    
  
    
}

extension MapViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//         print("demo")
//    }
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//
//         carcategorycollectionview.isUserInteractionEnabled = true
//    }
//
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//
//
//        var visibleRect = CGRect()
//
//        visibleRect.origin = carcategorycollectionview.contentOffset
//        visibleRect.size = carcategorycollectionview.bounds.size
//
//        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//
//        guard let indexPath = carcategorycollectionview.indexPathForItem(at: visiblePoint) else { return }
//
//        print(indexPath)
//
//
//
//
//
//
//
//        if scrollvalue == 1{
//            scrollvalue = 0
//
//           carcategorycollectionview.isUserInteractionEnabled = false
//
//
//        }else{
//        carcategorycollectionview.isUserInteractionEnabled = true
//
//
//        }
//
//
//        if indexPath == [0, carcategorycollectionviewcount - 2] || indexPath == [0, 1] {
//
//            scrollvalue = 1
//            print("hello")
//
//        }else{
//
//            print("hello1")
//        }
//
//
//    }
//
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.tag == 1{
            
            print("xfgchjkl\(self.carcategorycollectionviewcount)")
            var cellWidth = 70
            
            var cellSpacing = 5
            
            if self.carcategorycollectionviewcount > 3{
                cellWidth = 60
                cellSpacing = 5
                
            }else{
                
                cellWidth = 90
                cellSpacing = 5
                
            }
            
            
            
             let cellCount = carcategorycollectionviewcount
        
            let totalCellWidth = cellWidth * cellCount
            let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        let leftInset = (carcategorycollectionview.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
            
            
        }else if collectionView.tag == 2{
            
            let cellWidth = 70

            let cellSpacing = 10
            
            
            print(categorycollectionview.contentSize.width)
            
            let cellCount = categorycollectionviewcount
            
            let totalCellWidth = cellWidth * cellCount
            let totalSpacingWidth = cellSpacing * (cellCount - 1)
            
            let leftInset = (categorycollectionview.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            
          
            
            return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
            
        }else{
            let cellWidth = 180
            
            let cellSpacing = 10
            
            let cellCount = packagecategorycollectionviewcount
            
            let totalCellWidth = cellWidth * cellCount
            let totalSpacingWidth = cellSpacing * (cellCount - 1)
            
            let leftInset = (packagecollectionview.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            
            return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
            
            
            
        }
    }
    
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()



        let flowLayout: UICollectionViewFlowLayout = categorycollectionview.collectionViewLayout as! UICollectionViewFlowLayout

        flowLayout.itemSize = CGSize(width:(self.categorycollectionview.frame.width / 3) - 6 ,height: 45)


    

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1{
        
        return carcategorycollectionviewcount
            
        }else if collectionView.tag == 2{
            return categorycollectionviewcount
            
        }else{
            
            return packagecategorycollectionviewcount
        }
        
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
           
            let cell = carcategorycollectionview.dequeueReusableCell(withReuseIdentifier: "carcategorycell", for: indexPath)
            
          //  let mainview: UIView = cell.contentView.viewWithTag(1)!
            
            let carname: UILabel = cell.contentView.viewWithTag(2) as! UILabel
            
             let selectedview: UIView = cell.contentView.viewWithTag(4)!
            
            let cartypeimage: UIImageView = cell.contentView.viewWithTag(3) as! UIImageView
            
            
            
            
           // mainview.edgeWithShadow(edge: 4.0)
            
             if carstimedata.data?.serviceTypes![selectfirstvalue].package?.count == 0{
                 carname.text = carstimedata.data?.serviceTypes![selectfirstvalue].vehicles![indexPath.row].vehicleTypeName
                
                let newString = carstimedata.data?.serviceTypes![selectfirstvalue].vehicles![indexPath.row].vehicleTypeImage!
                
                let url = AppConstants.APIURL.IMAGE_URL + newString!
                
                let url1 = NSURL(string: url)

                
                cartypeimage.af_setImage(withURL:
                    url1! as URL,
                                           placeholderImage: UIImage(named: "dress"),
                                           filter: nil,
                                           imageTransition: .crossDissolve(1.0))
             
          
              
                
             }else{
                
                let newString = carstimedata.data?.serviceTypes![selectfirstvalue].package![selectsecondvalue].vehicles![indexPath.row].vehicleTypeImage
                
                let url = AppConstants.APIURL.IMAGE_URL + newString!
                
                let url1 = NSURL(string: url)
                
                
                cartypeimage.af_setImage(withURL:
                    url1! as URL,
                                         placeholderImage: UIImage(named: "dress"),
                                         filter: nil,
                                         imageTransition: .crossDissolve(1.0))
                
             
                
             carname.text = carstimedata.data?.serviceTypes![selectfirstvalue].package![selectsecondvalue].vehicles![indexPath.row].vehicleTypeName
            }
            
            
            if(selectcartypefirstvalue == indexPath.row){
                
                selectedview.backgroundColor = UIColor.appThemeColor()
                
            }else{
                selectedview.backgroundColor = UIColor.white
            }
            
         packagecollectionview.reloadData()
          
           // carname.text = "demo"
            
            return cell
            
            
        }else if collectionView.tag == 2{
            
            let cell1 = categorycollectionview.dequeueReusableCell(withReuseIdentifier: "categorycell", for: indexPath)
            
            let mainview: UIView = cell1.contentView.viewWithTag(1)!
            
            let categoryname: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            mainview.edgeWithOutShadow(edge: 16.0)
            
            
            
            categoryname.text = carstimedata.data?.serviceTypes![indexPath.row].serviceName
            
            if(selectfirstvalue == indexPath.row){

                mainview.backgroundColor = UIColor.appThemeColor()

            }else{
                mainview.backgroundColor = UIColor.white
            }
            
           // topcategoryviewwidth
            
            
           
            
            return cell1
            
        }else if collectionView.tag == 3{
            
             let cell2 = packagecollectionview.dequeueReusableCell(withReuseIdentifier: "packagecell", for: indexPath)
            
            
            let mainview: UIView = cell2.contentView.viewWithTag(1)!
            
            let categoryname: UILabel = cell2.contentView.viewWithTag(2) as! UILabel
            
            categoryname.text = carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].name
             mainview.edgeWithOutShadow(edge: 4.0)
            
            if(selectsecondvalue == indexPath.row){
                
                mainview.backgroundColor = UIColor.appThemeColor()
                
            }else{
                mainview.backgroundColor = UIColor.white
            }
            
            return cell2
            
        }
        
        else{
            
              let cell23 = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
            
            return cell23
        }
        
        
        
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
         self.selectvalue = 1
        
        if collectionView.tag == 1{
            
            selectcartypefirstvalue = indexPath.row
           
            if carstimedata.data?.serviceTypes![selectfirstvalue].package?.count == 0{
                
                AppConstants.ServiceType = String((carstimedata.data?.serviceTypes![selectfirstvalue].id!)!)
                
                AppConstants.ServiceType = String((carstimedata.data?.serviceTypes![selectfirstvalue].vehicles![indexPath.row].servicetypeid!)!)
                
                AppConstants.VehicleType = String((carstimedata.data?.serviceTypes![selectfirstvalue].vehicles![indexPath.row].id!)!)
                
                AppConstants.AreaID = String((carstimedata.data?.id!)!)
                
                
                
              if  AppConstants.ServiceType == "4"{
                
                firstridelaterbtnview.isHidden = true
                secondridenowbtnview.isHidden = false
                
                ridenowtextlbl.text = "Continue".localized
                    
              }else if AppConstants.ServiceType == "5"{
                
                firstridelaterbtnview.isHidden = true
                secondridenowbtnview.isHidden = false
                
                ridenowtextlbl.text = "Ride Now".localized
                
                
              }else{
                
                firstridelaterbtnview.isHidden = false
                secondridenowbtnview.isHidden = false
                
                ridenowtextlbl.text = "Ride Now".localized
                ridelatertextlbl.text = "Ride Later".localized
                
                }
                
                
                if AppConstants.ServiceType == "1"{
                    
                    if (AppConstants.userconfiguredata.data?.Multidestination)!{
                         dropplusbtnview.isHidden = false
                    }else{
                         dropplusbtnview.isHidden = true
                    }
                    
                   
                }else{
                    
                     dropplusbtnview.isHidden = true
                }
                
                
          
               
            }else{
                
                AppConstants.ServiceType = String((carstimedata.data?.serviceTypes![selectfirstvalue].id!)!)
                
                 AppConstants.ServiceType = String((carstimedata.data?.serviceTypes![selectfirstvalue].package![selectsecondvalue].vehicles![indexPath.row].servicetypeid!)!)
                
                AppConstants.VehicleType = String((carstimedata.data?.serviceTypes![selectfirstvalue].package![selectsecondvalue].vehicles![indexPath.row].id!)!)
                
                AppConstants.AreaID = String((carstimedata.data?.id!)!)
                
                if  AppConstants.ServiceType == "4"{
                    
                    firstridelaterbtnview.isHidden = true
                    secondridenowbtnview.isHidden = false
                    
                    ridenowtextlbl.text = "Continue".localized
                    
                }else if AppConstants.ServiceType == "5"{
                    
                    firstridelaterbtnview.isHidden = true
                    secondridenowbtnview.isHidden = false
                    
                    ridenowtextlbl.text = "Ride Now".localized
                    
                    
                }else{
                    
                    firstridelaterbtnview.isHidden = false
                    secondridenowbtnview.isHidden = false
                    
                    ridenowtextlbl.text = "Ride Now".localized
                    ridelatertextlbl.text = "Ride Later".localized
                    
                }
                
                if AppConstants.ServiceType == "1"{
                    
                    if (AppConstants.userconfiguredata.data?.Multidestination)!{
                        dropplusbtnview.isHidden = false
                    }else{
                        dropplusbtnview.isHidden = true
                    }
                }else{
                    
                    dropplusbtnview.isHidden = true
                }
                
                
               
            }
            
            
          //  packagecollectionview.reloadData()
            
            carcategorycollectionview.reloadData()
          //  categorycollectionview.reloadData()

            
        }else if collectionView.tag == 2{
//            check = indexPath.row
//            checksection = 0
            
          //  selectsecondvalue = 0
            selectfirstvalue = indexPath.row
            
//            if carstimedata.data?.serviceTypes![selectfirstvalue].id == 4{
//
//
//
//
//            }else{
//
//
//
          
                
//          self.carcategorycollectionviewcount = 10
//            carcategorycollectionview.reloadData()
            
            
             self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
            
            if self.carcategorycollectionviewcount == 0{
                
                packageviewheight.constant = 60.0
                packageview.isHidden = false
                pleaseselectpackagetextlbl.text = "Please select a package".localized
                 packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package?.count)!
                self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package![0].vehicles?.count)!
                
                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
             
                
                self.collectionView(packagecollectionview, didSelectItemAt: indexPathForFirstRow)
               
              //  packagecollectionview.reloadData()
              //  carcategorycollectionview.reloadData()
                categorycollectionview.reloadData()
                
                
            }else{
                packagecategorycollectionviewcount = 0
                packageviewheight.constant = 0.0
                packageview.isHidden = true
                pleaseselectpackagetextlbl.text = ""
                 self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![indexPath.row].vehicles?.count)!
                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                
                self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
                packagecollectionview.reloadData()
           //     carcategorycollectionview.reloadData()
               categorycollectionview.reloadData()
                
            }
                
          //  }
            
        }else if collectionView.tag == 3{
            
             selectsecondvalue = indexPath.row
            
            
            
            
                            packageviewheight.constant = 60.0
                            packageview.isHidden = false
            pleaseselectpackagetextlbl.text = "Please select a package".localized
            
                          //  packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package?.count)!
                            self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].vehicles?.count)!
                             AppConstants.VehicleID = String((carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].id)!)
                            let indexPathForFirstRow = IndexPath(row: 0, section: 0)
            
            
                            self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
                            packagecollectionview.reloadData()
                          //  carcategorycollectionview.reloadData()
                           categorycollectionview.reloadData()
            //
            
            
            
//            self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].vehicles?.count)!
//
//            if self.carcategorycollectionviewcount == 0{
//
//                packageviewheight.constant = 60.0
//                packageview.isHidden = false
//
//
//                packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package?.count)!
//                self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].vehicles?.count)!
//                 AppConstants.VehicleID = String((carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].id)!)
//                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
//
//
//                self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
//                packagecollectionview.reloadData()
//                carcategorycollectionview.reloadData()
//                categorycollectionview.reloadData()
//
//
//            }else{
//                packagecategorycollectionviewcount = 0
//                packageviewheight.constant = 0.0
//                packageview.isHidden = true
//                 self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![indexPath.row].vehicles?.count)!
//                 AppConstants.VehicleID = String((carstimedata.data?.serviceTypes![selectfirstvalue].package![indexPath.row].id)!)
////                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
////
////
////                self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)
//                packagecollectionview.reloadData()
//                carcategorycollectionview.reloadData()
//                categorycollectionview.reloadData()
//
//
//            }
//
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1{
            
            if indexPath.row == carcategorycollectionviewcount - 1 {
                
                print("dgfhjkl")
            }
        }else{
        
        
            
        }
        
    }
    
    
}


extension MapViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? CarsTimeModel{
            let data:CarsTimeModel = responseData
            
            self.carstimedata = data
            
            if carstimedata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                 sorrynocategoryview.isHidden = true
                ridenowview.isHidden = false
                
                packageview.isHidden = false
              
                
                self.getpolygon()
                
                
                AppConstants.currencysymbol = carstimedata.currency!
                
                
                if carstimedata.data?.serviceTypes?.count == 1{
                    
                     topcategoryview.isHidden = true
                }else{
                    topcategoryview.isHidden = false
                    
                }
                
                
   
                

                

                if self.carcategorycollectionviewcount == 0{

                    packageviewheight.constant = 60.0
                    packageview.isHidden = false
                    pleaseselectpackagetextlbl.text = "Please select a package".localized
                    packagecategorycollectionviewcount = 0
                   // self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![0].package![0].vehicles?.count)!


                }else{
                    packagecategorycollectionviewcount = 0
                    packageviewheight.constant = 0.0
                    packageview.isHidden = true
                    pleaseselectpackagetextlbl.text = ""


                }



                self.categorycollectionviewcount = (carstimedata.data?.serviceTypes?.count)!

                self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![0].vehicles?.count)!

                if self.carcategorycollectionviewcount == 0{

                    packageviewheight.constant = 60.0
                    packageview.isHidden = false
                    pleaseselectpackagetextlbl.text = "Please select a package".localized
                    packagecategorycollectionviewcount = (carstimedata.data?.serviceTypes![0].package?.count)!
                     self.carcategorycollectionviewcount = (carstimedata.data?.serviceTypes![0].package![0].vehicles?.count)!


                }else{
                    packagecategorycollectionviewcount = 0
                    packageviewheight.constant = 0.0
                    pleaseselectpackagetextlbl.text = ""
                    packageview.isHidden = true


                }


                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                // self.MapCollectionview?.selectItem(at: indexPathForFirstRow, animated: true, scrollPosition: .top)

                self.collectionView(carcategorycollectionview, didSelectItemAt: indexPathForFirstRow)

                 //self.carcategorycollectionviewcount = 6

                categorycollectionview.reloadData()

                carcategorycollectionview.reloadData()

                packagecollectionview.reloadData()
                
                
                
                
//                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
//
//
//                self.collectionView(topcollectionview, didSelectItemAt: indexPathForFirstRow)
//
//
//
//
//
//                topcollectionview.reloadData()
                
            }else if carstimedata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                
                ridenowview.isHidden = true
                topcategoryview.isHidden = true
                packageview.isHidden = true
            sorrynocategoryview.isHidden = false
                
                self.newpath.removeAllCoordinates()
                
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        
        if let responseData = response as? RideNowCheckoutModel{
            
            let data:RideNowCheckoutModel = responseData
            
             AppConstants.Ridenowcheckoutmodeldata = data
            
            if AppConstants.Ridenowcheckoutmodeldata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                AppConstants.checkoutid = String((AppConstants.Ridenowcheckoutmodeldata.data?.id)!)
                
              self.presentVC("RideNowViewController")
                
            }else if AppConstants.Ridenowcheckoutmodeldata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? BookOutStationModel{
            
            let data:BookOutStationModel = responseData
            
          AppConstants.bookoutstationdata = data
            
            if AppConstants.bookoutstationdata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                self.presentVC("BookOutstationRideViewController")
                
            }else if AppConstants.bookoutstationdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: AppConstants.bookoutstationdata.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? LogOutModel{
            
            let data:LogOutModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        if let responseData = response as? PoolAreaModel{
            
            let data:PoolAreaModel = responseData
            
            
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                AppConstants.BookingType = "1"
                pidarray.removeAllObjects()
                strJsonData6.removeAll()
                
                
                
                if AppConstants.ServiceType == "4" {
                    
                    
                    
                        
                    
                        
                        let dic1 = ["area": AppConstants.AreaID,
                                    "city": AppConstants.dropusercityname1
                            
                            ] as [String : AnyObject]
                        
                        showLoaderWithoutBackground()
                        
                        
                        
                        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USEROUTSTATIONDETAILS
                        ServiceManager.sharedInstance.delegate = self
                        
                        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: BookOutStationModel.self)
                        
            
                    
                }else if AppConstants.ServiceType == "5" {
                    
                   
                        
                        UIView.animate(withDuration: 0.5) {
                            
                            
                            if self.checkupdownvalue == 0{
                                
                                self.poolslidingview.isHidden = false
                                self.checkupdownvalue = 1
                                self.poolslidingview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
                                
                                
                                
                            } else{
                                self.checkupdownvalue = 0
                                //  self.poolslidingview.isHidden = true
                                self.poolslidingview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 178)
                                
                            }
                            
                            
                        }
                        
                        self.poolslidingview.layoutIfNeeded()
                        self.poolslidingview.setNeedsDisplay()
                        
                    
                    
                } else{
                    
                
                    
                    if AppConstants.droplat.count == 0{
                        
                 
                        
                    }else{
                        
                        
                        if AppConstants.ServiceType == "1"{
                            
                            
                            for i in 0...AppConstants.droplat.count - 1{
                                var nsdic : [String: AnyObject] = [:]
                                
                                nsdic.updateValue((i + 1) as AnyObject, forKey: "stop")
                                nsdic.updateValue(AppConstants.droplat[i] as AnyObject, forKey: "drop_latitude")
                                nsdic.updateValue(AppConstants.droplng[i] as AnyObject, forKey: "drop_longitude")
                                nsdic.updateValue(AppConstants.droplocation[i] as AnyObject, forKey: "drop_location")
                                nsdic.updateValue("1" as AnyObject, forKey: "status")
                                
                                
                                print(nsdic)
                                
                                
                                //  strJsonData1 = json(from: nsdic)!
                                
                                pidarray.add(nsdic)
                                
                                
                                
                            }
                            
                            print(pidarray)
                            
                            strJsonData6 = json(from: pidarray)!
                            
                        }else{
                            
                            var nsdic : [String: AnyObject] = [:]
                            
                            nsdic.updateValue((1) as AnyObject, forKey: "stop")
                            nsdic.updateValue(AppConstants.droplat[0] as AnyObject, forKey: "drop_latitude")
                            nsdic.updateValue(AppConstants.droplng[0] as AnyObject, forKey: "drop_longitude")
                            nsdic.updateValue(AppConstants.droplocation[0] as AnyObject, forKey: "drop_location")
                            nsdic.updateValue("1" as AnyObject, forKey: "status")
                            
                            pidarray.add(nsdic)
                            strJsonData6 = json(from: pidarray)!
                            
                        }
                        
                        
                    }
                    
                   
                    
                    let dic1 = ["service_type": AppConstants.ServiceType,
                                "vehicle_type": AppConstants.VehicleType,
                                "area":AppConstants.AreaID,
                                "pickup_latitude":AppConstants.userselectaddressLat,
                                "pickup_longitude":AppConstants.userselectaddressLng,
                                "total_drop_location":AppConstants.droplat.count,
                                "drop_location":strJsonData6,
                                "booking_type":AppConstants.BookingType,
                                "pick_up_locaion":AppConstants.userselectaddressLocation,
                                "package_id":AppConstants.VehicleID
                        
                        
                        
                        ] as [String : AnyObject]
                    
                    showLoaderWithoutBackground()
                    
                    
                    
                    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCHECKOUT
                    ServiceManager.sharedInstance.delegate = self
                    
                    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RideNowCheckoutModel.self)
                    
                    
                    
                }
                
                
                
                
 
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        if let responseData = response as? UserCancelModel{
            
            let data:UserCancelModel = responseData
            
            // AppConstants.Ridenowcheckoutmodeldata = data
            
            if data.result == "1" {
               
                // if data.bookable!{
                AppConstants.bookingId = String((data.data?.bookingId!)!)
                
                print("dfhbjng/\(data.data?.bookingStatus)")
                
                if data.data?.bookingStatus == "1016"{
                    
                    AppConstants.timerForGetDriverLocation1.invalidate()
                    hideLoaderWithoutBackground()
                    gotoactiverideview.isHidden = true
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    locationview.isHidden = false
                    ridenowview.isHidden = false
                    packageview.isHidden = false
                    topcategoryview.isHidden = false
                    findingrideview.isHidden = true
                    sorrynocategoryview.isHidden = true
                    findingrideview.isHidden = true
                }else{
                    AppConstants.timerForGetDriverLocation1.invalidate()
                    hideLoaderWithoutBackground()
                    gotoactiverideview.isHidden = false
                    AppConstants.timer?.cancel()
                    AppConstants.timer = nil
                    locationview.isHidden = false
                    ridenowview.isHidden = false
                    packageview.isHidden = false
                    topcategoryview.isHidden = false
                    findingrideview.isHidden = true
                    sorrynocategoryview.isHidden = true
                    findingrideview.isHidden = true
                    
                    
                }
                
                
                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                 AppConstants.timerForGetDriverLocation1.invalidate()
                gotoactiverideview.isHidden = true
                
                hideLoaderWithoutBackground()
                //   showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        
        
        if let responseData = response as? ActiveRideModel{
            
            let data:ActiveRideModel = responseData
            
           // AppConstants.Ridenowcheckoutmodeldata = data
            
            if data.result == "1" {
                
                self.carcarstimeapi()
                 AppConstants.bookingStatus = ""
                 AppConstants.timerForGetDriverLocation1.invalidate()
                hideLoaderWithoutBackground()
                 gotoactiverideview.isHidden = false
                AppConstants.timer?.cancel()
                AppConstants.timer = nil
                locationview.isHidden = false
                                    ridenowview.isHidden = false
                                    packageview.isHidden = false
                                    topcategoryview.isHidden = false
                                    findingrideview.isHidden = true
                                    sorrynocategoryview.isHidden = true
                                findingrideview.isHidden = true
               // if data.bookable!{
                    AppConstants.bookingId = String(data.data![0].id!)
                
                AppConstants.bookingStatus = data.data![0].bookingStatus!

            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                
                self.carcarstimeapi()
                
                 gotoactiverideview.isHidden = true
                 AppConstants.timerForGetDriverLocation1.invalidate()
                
                
                
                hideLoaderWithoutBackground()
             //   showErrorAlert("Alert", alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        
        if let responseData = response as? NearestDriverModel{
            
            let data:NearestDriverModel = responseData
            
            
            if(data.result == "0"){
                
                self.markers.removeAll()
                self.driverIds.removeAll()
                self.mapview.clear()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }else{
                
                self.markers.removeAll()
                self.driverIds.removeAll()
                
                
                let arraycount = Int((data.data?.count)!)
                
                for i in 0..<arraycount{
                    
                    
                    
                  //  self.movedfrom = "CarSelect"
                    
                    if(data.data?[i].currentLatitude != "") {
                        
                        
                        let latitude =   (data.data?[i].currentLatitude)!
                        
                        let longitude =     (data.data?[i].currentLongitude)!
                        
                        
                        var bearningdegree = "0.0"
                        
                        if(data.data?[i].bearing == ""){
                            
                            bearningdegree = "0.0"
                            
                        }else{
                            
                            bearningdegree =  (data.data?[i].bearing)!
                        }
                        // let status =   (getFireBaseGetNearesDriverdata.details?[i].driverOnlineOfflineStatus)!
                        
                        var distanceInMeter = 0.0
                        
                        
                        
                        if(self.selectvalue == 1){
                            
                            
//                            let coordinateTo = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
//
//                            // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
//
//                            let pickuplat = Double(GlobalVarible.PickUpLat)
//                            let pickuplng = Double(GlobalVarible.PickUpLng)
//
//                            let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
//
//                            distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
                            
                            let distanceInKilometer =  Float((data.data?[i].distance)!)! * 0.001
                            
                            print(distanceInKilometer)
                            
                            
                            self.distanceKM.append(Double(distanceInKilometer))
                            
                            // self.addarray.append(postId as AnyObject)
                            
                            
                            self.minimumValue = self.distanceKM.min()
                            
                            
                            
                        }
                        
                    setMarkers(driverId: (data.data?[i].driverId)!, lat: Double(latitude)!, long: Double(longitude)! ,status: Int("1")! , cartypeid: AppConstants.VehicleType ,BearningFactor: bearningdegree)
                        
                       // testing()
                        
                        
                    }else{
                        
                        
                    }
                }
                
                
            }
            
        }
            
            
            
//            if data.result == "1" {
//
//                hideLoaderWithoutBackground()
//
//                UserDefaultUtility.removeAllUserDefault()
//
//                self.presentVC("SplashViewController")
//
//            } else {
//                hideLoaderWithoutBackground()
//                showErrorAlert("Alert", alertMessage: data.message!, VC: self)
//
//            }
//
//
//        }
//
        
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
       // showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
}



extension MapViewController
    
{
    
    
   
    
    func setMarkers(driverId: String ,lat:Double , long: Double , status: Int , cartypeid: String,BearningFactor: String)
    {
        
        
        var Index = -10
        
        for (index , items) in driverIds.enumerated()
        {
            if items == driverId
            {
                
                Index = index
                print(index)
                break
            }
            else
            {
                Index = -10
            }
            
        }
        
        
        print(Index)
        if Index != -10
        {
            
            //  self.seatnolabel.text = totaltime
            print(status)
            
            // let oldLocationCenter = CLLocation(latitude:  Double(GlobalVarible.PickUpLat)!, longitude:  Double(GlobalVarible.PickUpLng)!)
            
            //  let location = CLLocation(latitude: lat, longitude: long)
            
            self.updateMarker(index: Index ,driverId: driverId , lat: lat , long: long , status: status , cartypeid: cartypeid , degrees: Double(BearningFactor)! , duration: 1.0)
            //  self.updateMarker(Index ,driverId: driverId , lat: lat , long: long , status: status , cartypeid: cartypeid)
            
        }
        
        if Index == -10 // Means Marker Not Added
        {
            
            if status == 2 {
                
                
                return
                
                
                
            }
                
            else
            {
                
                self.driverIds.append(driverId)
                let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
                let marker = GMSMarker(position: coordinates)
                
              
                
                
                if cartypeid == "1"{
                    
                    marker.icon = UIImage(named: "marker_blue@80")
                    //ic_car_green
                }else if cartypeid == "2"{
                    
                    marker.icon = UIImage(named: "marker_yellow@80")
                }else if cartypeid == "3"{
                    
                    marker.icon = UIImage(named: "marker_red@80")
                    // ic_luxurycar_30
                }else if cartypeid == "4"{
                    
                    marker.icon = UIImage(named: "marker_gray@80")
                }else if cartypeid == "5"{
                    marker.icon = UIImage(named: "marker_blue@80")
                    
                }else if cartypeid == "6"{
                    marker.icon = UIImage(named: "marker_gray@80")
                    
                }else{
                    
                    marker.icon = UIImage(named: "marker_blue@80")
                }
                
                
                
                
                CATransaction.begin()
                CATransaction.setAnimationDuration(1.0)
                marker.rotation = Double(BearningFactor)!
                CATransaction.commit()
                
                // marker.icon = UIImage(named: "car_30")
                
                
                // Setting Tags to marker for get Positions
                marker.accessibilityLabel = driverId
                marker.accessibilityValue = String(status)
                
                self.markers.append(marker)
                self.setMarker()
                
                
            }
            
            
            
        }
        
    }
    
    
    
    
    
    func mapView(mapView: GMSMapView, didTapInfoWindowOfMarker marker: GMSMarker) {
        print("hello")
        
        let index:Int! = Int(marker.accessibilityLabel!)
        
        print(index)
        
        
    }
    
    
    
}

extension MapViewController
{
    func setMarker()
    {
        self.mapview.clear()
        for items in self.markers
        {
            
            
            items.map = mapview
            
        }
        
    }
    
    
    
    func updateMarker(index: Int , driverId: String ,lat:Double , long: Double , status: Int , cartypeid: String, degrees: CLLocationDegrees, duration: Double)
        // {
        
        // func updateMarker(index: Int , driverId: String ,lat:Double , long: Double , status: Int , cartypeid: String)
    {
        
        
        if status == 2  // Offline
        {
            self.markers.remove(at: index)
            self.driverIds.remove(at: index)
            self.setMarker()
        }
            
        else  // Online
        {
            
            let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            let marker = GMSMarker(position: coordinates)
            
         
            
            
            if cartypeid == "1"{
                
                marker.icon = UIImage(named: "marker_blue@80")
                //ic_car_green
            }else if cartypeid == "2"{
                
                marker.icon = UIImage(named: "marker_yellow@80")
            }else if cartypeid == "3"{
                
                marker.icon = UIImage(named: "marker_red@80")
                // ic_luxurycar_30
            }else if cartypeid == "4"{
                
                marker.icon = UIImage(named: "marker_gray@80")
            }else if cartypeid == "5"{
                marker.icon = UIImage(named: "marker_blue@80")
                
            }else if cartypeid == "6"{
                marker.icon = UIImage(named: "marker_gray@80")
                
            }else{
                
                marker.icon = UIImage(named: "marker_blue@80")
            }
            
            
            
            
            
            marker.accessibilityLabel = driverId
            marker.accessibilityValue = String(status)
            
            print(degrees)
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            marker.rotation = degrees
            CATransaction.commit()
            
            // Movement
            CATransaction.begin()
            CATransaction.setAnimationDuration(duration)
            marker.position = coordinates
            
            
            
            CATransaction.commit()
            
            
            self.markers[index] = marker
            self.setMarker()
            
        }
        
        
    }
    
}


extension MapViewController: UIGestureRecognizerDelegate {
    
    
    
    
    
    @objc func wasSwiped(gestureRecognizer: UISwipeGestureRecognizer) {
        
        
        UIView.animate(withDuration: 0.5) {
            
            
            switch gestureRecognizer.direction {
            case .up:
                //            gestureRecognizer.view?.frame.origin.y -= 80
                //self.poolslidingview.isHidden = false
                 self.poolslidingview.isHidden = false
               self.checkupdownvalue = 1
                self.poolslidingview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
                
                
                
            case .down:
                //            gestureRecognizer.view?.frame.origin.y += 80
              //  self.poolslidingview.isHidden = true
               self.checkupdownvalue = 0
                self.poolslidingview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: 178)
            default:
                break
            }
            
            
        }
        
        self.poolslidingview.layoutIfNeeded()
        self.poolslidingview.setNeedsDisplay()
        
    }
    
   
    
    
    
}


extension GMSPolygon{
    
    
    func contains(coordinate: CLLocationCoordinate2D) -> Bool {
        
        if self.path != nil {
            
            if GMSGeometryContainsLocation(coordinate, self.path!, true) {
                print("hellocome")
                return true
                
                
            }
            else {
                print("hellocome1")
                return false
            }
        }
        else {
            print("hellocome12")
            return false
        }
    }
    
}



