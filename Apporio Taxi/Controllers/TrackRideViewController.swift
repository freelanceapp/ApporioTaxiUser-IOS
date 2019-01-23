//
//  TrackRideViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 20/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import GoogleMaps
import StarryStars
import ObjectMapper
import AlamofireImage
import GooglePlaces

class TrackRideViewController: BaseViewController {
    
    
    @IBOutlet weak var sosbtntext: UIButton!
    
    @IBOutlet weak var forcancellingchargetext: UILabel!
    
    @IBOutlet weak var forcancelchargeheight: NSLayoutConstraint!
    
    var checkcancelprice = "0"
    
    @IBOutlet weak var otptextheight: NSLayoutConstraint!
    @IBOutlet weak var otptext: UILabel!
    
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var editlocationbtn: UIButton!
    
    @IBOutlet weak var editimageview: UIImageView!
    
    @IBOutlet weak var innerhiddenview: UIView!
    
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var hiddenviewcancelbtntext: UIButton!
    @IBOutlet weak var cancelridehiddentextlbl: UILabel!
    
    @IBOutlet weak var hiddenviewokbtntext: UIButton!
    
    @IBOutlet weak var firstimagecircleview: UIView!
    
    var tablecount = 0
    
    @IBOutlet weak var toparrowimageview: UIImageView!
    @IBOutlet weak var topimagecircleview: UIView!
    @IBOutlet weak var fourthimagecircleview: UIView!
    @IBOutlet weak var thirdimagecircleview: UIView!
    @IBOutlet weak var secondimagecircleview: UIView!
    @IBOutlet weak var sosview: UIView!
    @IBOutlet weak var thirdbtnviewheight: NSLayoutConstraint!
    @IBOutlet weak var thirdbtnviewwidth: NSLayoutConstraint!
    
    @IBOutlet weak var fourthbtnviewwidth: NSLayoutConstraint!
    var checkupdownvalue = 1
    
    
    
    @IBOutlet var topslideview: UIView!
    @IBOutlet weak var paymentmethodtext: UILabel!
    @IBOutlet weak var paymentextlbl: UILabel!
    @IBOutlet weak var mapview: GMSMapView!
    
    @IBOutlet weak var categorycartypenumbertext: UILabel!
    @IBOutlet weak var categorycartypeview: UIView!
    
    @IBOutlet weak var categorycartypetext: UILabel!
    @IBOutlet weak var toplocationview: UIView!
    
    @IBOutlet weak var toplocationimageview: UIImageView!
    
    @IBOutlet weak var toplocationtext: UILabel!
     var markerList = [GMSMarker]()
     var marker = GMSMarker()
    var originMarker: GMSMarker!
    var destinationMarker: GMSMarker!
    
     var check = 1000
    var selectcancelreasonid = ""
    var originCoordinate: CLLocationCoordinate2D!
    
    var destinationCoordinate: CLLocationCoordinate2D!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var driverimageview: UIImageView!
    
    @IBOutlet weak var driverratingtext: UILabel!
    
    @IBOutlet weak var driverratingvalue: RatingView!
    @IBOutlet weak var ridestatustext: UILabel!
    
    @IBOutlet weak var drivernametext: UILabel!
    
    
    @IBOutlet weak var drivernamebottomtext: UILabel!
    
    var startlat = ""
    var startlng = ""
     var bearingfactor = ""
    var droplat = ""
    var droplng = ""
    
    
    @IBOutlet weak var firstbtnview: UIView!
    
    @IBOutlet weak var thirdbtnview: UIView!
    @IBOutlet weak var secondbtnview: UIView!
    
    @IBOutlet weak var fourthview: UIView!
    @IBOutlet weak var firstbtnimageview: UIImageView!
    
    @IBOutlet weak var fourthbtnimageview: UIImageView!
    @IBOutlet weak var secondbtnimageview: UIImageView!
    
    @IBOutlet weak var thirdbtnimageview: UIImageView!
    
    @IBOutlet weak var firstbtntextlbl: UILabel!
    
    @IBOutlet weak var fourthtextlbl: UILabel!
    @IBOutlet weak var thirdbtntextlbl: UILabel!
    
    @IBOutlet weak var secondbtntextlbl: UILabel!
    var locationManager = CLLocationManager()
    
    var bookingdetailsdata: BookingDetailsModel!
    
    var cancelreasondata: CancelReasonModel!
    
    var bookingtrackingdata: BookingTrackingModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelridehiddentextlbl.text = "Cancel Ride".localized
        hiddenviewcancelbtntext.setTitle("Cancel".localized, for: UIControlState.normal)
        hiddenviewokbtntext.setTitle("OK".localized, for: UIControlState.normal)
        sosbtntext.setTitle("SOS".localized, for: UIControlState.normal)
        
        
        
        editimageview.isHidden = true
        editlocationbtn.isUserInteractionEnabled = false
        topslideview.isHidden = false
        firstimagecircleview.makeViewCircular()
        secondimagecircleview.makeViewCircular()
        thirdimagecircleview.makeViewCircular()
        fourthimagecircleview.makeViewCircular()
        topimagecircleview.makeViewCircular()
        
        driverratingvalue.editable = false
        
        hiddenview.isHidden = true
        
        firstbtntextlbl.text = "Call".localized
        secondbtntextlbl.text = "Chat".localized
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        sosview.edgeWithOutShadow(edge: 8.0)
      
        
        toplocationview.edgeWithOutShadow(edge: 16.0)
        
        
        view.addSubview(topslideview)
        topslideview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
        
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        upGesture.direction = .up
        topslideview.addGestureRecognizer(upGesture)
        upGesture.delegate = self
        
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(wasSwiped(gestureRecognizer:)))
        downGesture.direction = .down
        topslideview.addGestureRecognizer(downGesture)
        downGesture.delegate = self
        
        topslideview.isUserInteractionEnabled = true
        
        bottomview.edgeWithOutShadow(edge: 4.0)
        
        
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.startUpdatingLocation()
        
        mapview.animate(toZoom: 15)
        
        
        mapview.delegate = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showtrack),
            name: NSNotification.Name(rawValue: "trackride"),
            object: nil)
        
        
        
        
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGDETAILS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: BookingDetailsModel.self)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sosbtnclick(_ sender: Any) {
        
        presentVC("EmergencyViewController")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
            // self.timer1.invalidate()
            if AppConstants.dropchange == 1{
                
                AppConstants.newtimer?.cancel()
                AppConstants.newtimer = nil
                
                AppConstants.dropchange = 0
                
                
                
                let dic1 = ["booking_id": AppConstants.bookingId,
                            "location":AppConstants.changedroplocation,
                            "latitude":AppConstants.changedroplat,
                            "longitude":AppConstants.changedroplng
                            
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGCHANGEADDRESS
                ServiceManager.sharedInstance.delegate = self
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: ChangeAddressModel.self)
               
            }else{
                AppConstants.dropchange = 0
                
        }
        

    }
    
    
    @IBAction func editlocationbtnclick(_ sender: Any) {
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @objc func showtrack(notification: NSNotification){
        
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
       
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGDETAILS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: BookingDetailsModel.self)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hiddenokbtnclick(_ sender: Any) {
        
        if selectcancelreasonid == ""{
            
            
            self.showErrorAlert("", alertMessage: "Please select cancel reason first".localized, VC: self)
            
            
        }else{
            
             hiddenview.isHidden = true
            
            
            
            let dic1 = ["booking_id": AppConstants.bookingId,
                        "cancel_reason_id":selectcancelreasonid,
                        "cancel_charges":cancelreasondata.cancelCharges
                       
                
                ] as [String : AnyObject]
            
            showLoaderWithoutBackground()
            
            
            
            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGCANCEL
            ServiceManager.sharedInstance.delegate = self
            
            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CancelRideModel.self)
            
            
            
            
        }
        
    }
    
    @IBAction func hiddencancelbtnclick(_ sender: Any) {
        topslideview.isHidden = false
        hiddenview.isHidden = true
    }
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: {
            AppConstants.viewcontrollerself.viewDidLoad()
        })
        
       // dismissVC()
    }
    
    @IBAction func firstbtnclick(_ sender: Any) {
        print("hello")
       
        
        
        if let url = URL(string: "telprompt://\(bookingdetailsdata.data?.driver?.phoneNumber! ?? "345678")") {
            
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
            
            
        }
        
     
        
        
        
    
        
    }
    
    @IBAction func secondbtnclick(_ sender: Any) {
        
        
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginView = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
        let navController = UINavigationController(rootViewController: LoginView)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func thirdbtnclick(_ sender: Any) {
    
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
        
        
       
        
        let dic1 = ["booking_id": AppConstants.bookingId,
                    
                    
                    
                    
                    ] as [String : AnyObject]
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERCANCELREASON
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: CancelReasonModel.self)
        
     
        
        
       
    }
    
    @IBAction func fourthbtnclick(_ sender: Any) {
        
        var shareText = ""
        
        if AppConstants.bookingdetailsdata.data?.shareablelink == ""{
               shareText = "hellotest"
            
        }else{
            shareText = (AppConstants.bookingdetailsdata.data?.shareablelink)!
            
        }
        
        //let shareText = "hellotest"
        
        print(shareText)
        
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        
        self.present(activityViewController, animated: true) {
            print("option menu presented")
        }
        
    }
    
    
    @IBAction func slidebtnclick(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.5) {
            
            
            if self.checkupdownvalue == 0{
               
                
                  self.checkupdownvalue = 1
                self.topslideview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
                
                
                
            } else{
                  self.checkupdownvalue = 0
                
                self.topslideview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 98, width: UIScreen.main.bounds.size.width, height: 178)
          
            }
            
            
        }
        
        self.topslideview.layoutIfNeeded()
        self.topslideview.setNeedsDisplay()
        
        
    }
    
    
    func createTimer() {

        AppConstants.newtimer = DispatchSource.makeTimerSource(queue: .main)


        AppConstants.newtimer?.schedule(deadline: .now(), repeating: .seconds(5))


        AppConstants.newtimer?.setEventHandler(handler: { [weak self] in      // assuming you're referencing `self` in here, use `weak` to avoid strong reference cycles
            // do something

           
            let dic1 = ["booking_id": AppConstants.bookingId,




                        ] as [String : AnyObject]

          //  self.showLoaderWithoutBackground()



            let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGTRACKING
            ServiceManager.sharedInstance.delegate = self

            ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: BookingTrackingModel.self)

            //  print("timerstatrt")
        })
        AppConstants.newtimer?.resume()
        // note, timer is not yet started; you have to call `timer?.resume()`
    }

    func starttimer() {
        // timer?.resume()
        createTimer()
    }


    func stopTimer() {
        AppConstants.newtimer?.cancel()
        AppConstants.newtimer = nil
    }

    
    func checkstatusvalue(){
        
      
        
        
        drivernametext.text = bookingdetailsdata.data?.driver?.fullName
        drivernamebottomtext.text = bookingdetailsdata.data?.vehicleDetails?.vehicleModel
        
        ridestatustext.text = bookingdetailsdata.data?.location?.tripStatusText
        
        driverratingtext.text = bookingdetailsdata.data?.driver?.rating
        
        if (bookingdetailsdata.data?.location?.locationEditable)!{
            
            editimageview.isHidden = false
            editlocationbtn.isUserInteractionEnabled = true
        }else{
            editimageview.isHidden = true
            editlocationbtn.isUserInteractionEnabled = false
            
        }
        
        if(bookingdetailsdata.data?.otpenable == "0"){
            
            otptext.isHidden = true
            otptextheight.constant = 0.0
            
        }else{
            
            otptext.isHidden = false
            otptext.text = "OTP : ".localized + (bookingdetailsdata.data?.rideotp)!
            otptextheight.constant = 23.0
            
        }
        
        
        if bookingdetailsdata.data?.driver?.rating == ""{
            
            
        }else{
            
            driverratingvalue.rating = Float((bookingdetailsdata.data?.driver?.rating!)!)!
        }
        
        driverimageview.makeViewCircular()
        
        
        let newString = bookingdetailsdata.data?.driver?.profileImage
        
         AppConstants.downloadimage(imagename: newString!, imageview: driverimageview, placeholderimage: "output1")
                 
        
       
        
        self.categorycartypeview.layer.borderWidth = 1.0
        self.categorycartypeview.layer.cornerRadius = 4
        
        
        
        categorycartypetext.text = (bookingdetailsdata.data?.vehicleDetails?.service)! + "|" + (bookingdetailsdata.data?.vehicleDetails?.vehicle)!
        
        
        categorycartypenumbertext.text = (bookingdetailsdata.data?.vehicleDetails?.vehicleNumber)!
        
        paymentextlbl.text = "Payment".localized
        
        paymentmethodtext.text = bookingdetailsdata.data?.paymentMethod?.paymentMethod
        
        toplocationtext.text = bookingdetailsdata.data?.location?.locationText
        
        if bookingdetailsdata.data?.stillMarker?.markerLat == ""{
            startlat = ""
            startlng = ""
            
        }else{
        
        startlat = (bookingdetailsdata.data?.stillMarker?.markerLat)!
        
        startlng = (bookingdetailsdata.data?.stillMarker?.markerLong)!
            
        }
        
        droplat = (bookingdetailsdata.data?.movableMarker?.driverMarkerLat)!
        
        droplng = (bookingdetailsdata.data?.movableMarker?.driverMarkerLong)!
        
        bearingfactor = (bookingdetailsdata.data?.movableMarker?.driverMarkerBearing)!
        
        if (bookingdetailsdata.data?.cancelable)!{
            
            thirdbtntextlbl.text = "Cancel".localized
            thirdbtnview.isHidden = false
            thirdbtnviewwidth.constant = 50.0
            
            
            
        }else{
            
            thirdbtnview.isHidden = true
           // thirdbtnviewwidth.constant = 0.0
            
        }
        
        if (bookingdetailsdata.data?.sosVisibility)!{
            
            sosview.isHidden = false
            
        }else{
            sosview.isHidden = true
            
        }
        
        
        if (bookingdetailsdata.data?.shareable)!{
            fourthtextlbl.text = "Share".localized
            fourthview.isHidden = false
            fourthbtnviewwidth.constant = 50.0
            
        }else{
            fourthview.isHidden = true
          //  fourthbtnviewwidth.constant = 0.0
            
        }
        mapview.clear()
       // self.drawRoute1()
        
        self.starttimer()
        
    }
  
    
    func drawRoute1(){
        
                 markerList.removeAll()
        
                 var bounds = GMSCoordinateBounds()
        
        if self.startlat == ""{
            
            
        }else{
        
                self.originCoordinate = CLLocationCoordinate2DMake(Double(self.startlat)!, Double(self.startlng)!)
        
                originMarker = GMSMarker(position: self.originCoordinate)
        
                self.markerList.append(originMarker)
            if bookingtrackingdata.data?.stilMarker?.markerType == "PICK"{
                originMarker.icon = UIImage(named: "marker_locate")
            }else{
                
                originMarker.icon = UIImage(named: "marker-new_,home")
                
            }
            
            
            
            
        }
                 originMarker.map = self.mapview
        
                self.destinationCoordinate = CLLocationCoordinate2DMake(Double(self.droplat)! , Double(self.droplng)!)
        
                destinationMarker = GMSMarker(position: self.destinationCoordinate)
        
        
                self.markerList.append(destinationMarker)
         destinationMarker.icon = UIImage(named: "marker_blue@80")
       //  destinationMarker.icon = UIImage(named: "ic_home_locaion_marker")
       // destinationMarker.map = self.mapview
        
                for marker in markerList {
                    bounds = bounds.includingCoordinate(marker.position)
                }
        
                let coordinates = CLLocationCoordinate2D(latitude: Double(droplat)!, longitude: Double(droplng)!)

       

                CATransaction.begin()
                CATransaction.setAnimationDuration(1.0)
                destinationMarker.rotation = Double(bearingfactor)!
                CATransaction.commit()

                CATransaction.begin()
                CATransaction.setAnimationDuration(1.0)
                destinationMarker.position =  coordinates
                CATransaction.commit()
                destinationMarker.map = mapview
        
        
        if self.startlat == ""{
            
            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(120, 30, 180, 30))
            mapview.animate(with: update)
            
             mapview.animate(toZoom: 15)
        }else{

        
                let coordinateTo = CLLocation(latitude: Double(startlat)!, longitude: Double(startlng)!)
        
        
        
                let pickuplat = Double(droplat)
                let pickuplng = Double(droplng)
        
                let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
        
                let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
        
                print(distanceInMeter)
        
                if distanceInMeter < 500{
        
        
        
                    let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(120, 30, 180, 30))
                    mapview.animate(with: update)
        
                    mapview.animate(toZoom: 15)
                }else{
                    let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(120, 30, 180, 30))
                    mapview.animate(with: update)
        
                }
            
        }

    }
    
    
   

}


extension TrackRideViewController: UIGestureRecognizerDelegate {
    
    
    
    
    
    @objc func wasSwiped(gestureRecognizer: UISwipeGestureRecognizer) {
        
        
         UIView.animate(withDuration: 0.5) {
        
        
        switch gestureRecognizer.direction {
        case .up:
//            gestureRecognizer.view?.frame.origin.y -= 80

            self.checkupdownvalue = 1
            self.topslideview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 178, width: UIScreen.main.bounds.size.width, height: 178)
            
            
            
        case .down:
//            gestureRecognizer.view?.frame.origin.y += 80
           self.checkupdownvalue = 0
            self.topslideview.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 98, width: UIScreen.main.bounds.size.width, height: 178)
        default:
            break
        }
            
            
        }
        
        self.topslideview.layoutIfNeeded()
        self.topslideview.setNeedsDisplay()
        
    }
    
    
    
    
    
}

extension TrackRideViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
        
        
        let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
        
        let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
        
        firsttext.text = cancelreasondata.data![indexPath.row].reason
        
        let tableheight = hiddentableview.contentSize.height
        
        if tableheight < AppConstants.screenframeheight - 200.0{
            if checkcancelprice == "1"{
                innerhiddenviewheight.constant = tableheight + 170.0
                
            }else{
                innerhiddenviewheight.constant = tableheight + 100.0
            }
           
            
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
        
        
        selectcancelreasonid = String((cancelreasondata.data![indexPath.row].id!))
      
        
    }
    
}


extension TrackRideViewController: CLLocationManagerDelegate, GMSMapViewDelegate{
    
    

    
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            
           // reverseGeocodeCoordinate(coordinate: location.coordinate)
            mapview.animate(toLocation: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
            
            
              mapview.animate(toZoom: 15)
            self.locationManager.stopUpdatingLocation()
            
            
        }
        
        
}


}


extension TrackRideViewController: ApiResponseReceiver {
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        
        if let responseData = response as? ChangeAddressModel{
            
            let data:ChangeAddressModel = responseData
            
            if data.result == "1"{
                
                hideLoaderWithoutBackground()
                let dic1 = ["booking_id": AppConstants.bookingId,
                            
                            
                            ] as [String : AnyObject]
                
                showLoaderWithoutBackground()
                
                
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERBOOKINGDETAILS
                ServiceManager.sharedInstance.delegate = self
                
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: BookingDetailsModel.self)
                
                
            }else if cancelreasondata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
            
        }
        
        if let responseData = response as? CancelReasonModel{
            
            let data:CancelReasonModel = responseData
            
            cancelreasondata = data
            
            if cancelreasondata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                topslideview.isHidden = true
                hiddenview.isHidden = false
                
                if cancelreasondata.cancelCharges == "0" || cancelreasondata.cancelCharges == ""{
                    checkcancelprice = "0"
                    forcancelchargeheight.constant = 0.0
                }else{
                    
                    checkcancelprice = "1"
                    forcancelchargeheight.constant = 50.0
                
                 self.forcancellingchargetext.text = "For cancelling , you will be charged ".localized + AppConstants.currencysymbol + " " + cancelreasondata.cancelCharges!
                }
                tablecount = (cancelreasondata.data?.count)!
                
                hiddentableview.reloadData()
                
                
                
                
            }else if cancelreasondata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
        }
        
        
        if let responseData = response as? BookingDetailsModel{
            
            let data:BookingDetailsModel = responseData
            
            bookingdetailsdata = data
            
            AppConstants.bookingdetailsdata = data
            
            if bookingdetailsdata.result == "1" {
                
                hideLoaderWithoutBackground()
                
              
                self.checkstatusvalue()
                
              
            
                
            }else if bookingdetailsdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        if let responseData = response as? CancelRideModel{
            
            let data:CancelRideModel = responseData
            
          
            
            if data.result == "1" {
                
                hideLoaderWithoutBackground()
                
                self.view.window?.rootViewController?.dismiss(animated: true, completion: {
                    AppConstants.viewcontrollerself.viewDidLoad()
                })
                

                
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else {
                topslideview.isHidden = false
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
                
            }
            
            
        }
        
        
        if let responseData = response as? BookingTrackingModel{
            
            let data:BookingTrackingModel = responseData
            
            bookingtrackingdata = data
            
            if bookingtrackingdata.result == "1" {
                
                if bookingtrackingdata.data?.stilMarker?.markerLat == ""{
                    startlng = ""
                    startlat = ""
                    
                }else{
                
                startlat = (bookingtrackingdata.data?.stilMarker?.markerLat)!
                
                startlng = (bookingtrackingdata.data?.stilMarker?.markerLong)!
                    
                }
                
                
                AppConstants.emergencylatitude = (bookingtrackingdata.data?.movableMarkerType?.driverMarkerLat)!
                
                AppConstants.emergencylongitude = (bookingtrackingdata.data?.movableMarkerType?.driverMarkerLong)!
                
                droplat = (bookingtrackingdata.data?.movableMarkerType?.driverMarkerLat)!
                
                droplng = (bookingtrackingdata.data?.movableMarkerType?.driverMarkerLong)!
                
                bearingfactor = (bookingtrackingdata.data?.movableMarkerType?.driverMarkerBearing)!
                mapview.clear()
                self.drawRoute1()
                
                
            }else{
                
                
                
            }
        }
        }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
       // showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
}




extension TrackRideViewController:GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place)
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        print("Place attributions: \(place.coordinate.latitude)")
        print("Place attributions: \(place.coordinate.longitude)")
        //  manualloactioncheck = "manual"
        
        
        
        
        // GlobalVarible.Pickuptext = place.formattedAddress!
        // GlobalVarible.UserDropLocationText = place.formattedAddress!
        AppConstants.changedroplocation = place.name
        AppConstants.changedroplat = String(place.coordinate.latitude)
        AppConstants.changedroplng = String(place.coordinate.longitude)
        
        AppConstants.dropchange = 1
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
