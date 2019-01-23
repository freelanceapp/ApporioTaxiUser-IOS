//
//  AddStopsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 05/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit

class AddStopsViewController: BaseViewController {
    
    @IBOutlet weak var donebtntext: UIButton!
    @IBOutlet weak var locationview: UIView!
    
    @IBOutlet weak var pleasekeepstopstextlbl: UILabel!
    @IBOutlet weak var asfaryourdrivertimetextlbl: UILabel!
    
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var pickfromtextlbl: UILabel!
    
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var topaddstopstextlbl: UILabel!
    
    @IBOutlet weak var droplocationtableview: UITableView!
    
      var droplocationcount = 0
    
    
    var selectdroplocationindex = 0
    
    @IBOutlet weak var droppointtextlbl: UILabel!
    
    @IBOutlet weak var plusiconimage: UIImageView!
    
    @IBOutlet weak var setdroplocationtext: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topaddstopstextlbl.text = "Add Stops".localized
        pickfromtextlbl.text = "Pickup From".localized
        droppointtextlbl.text = "Drop Point".localized
        pleasekeepstopstextlbl.text = "Please keep stops to 3 minutes or less".localized
        asfaryourdrivertimetextlbl.text = "As for your driver's time.please limit each stop to 3 minuutes or less,otherwise your fare may change.".localized
        donebtntext.setTitle("DONE".localized, for: UIControlState.normal)
        
        
        
        pickuplocationtext.text = AppConstants.userselectaddressLocation
        
        plusiconimage.image = plusiconimage.image!.withRenderingMode(.alwaysTemplate)
        plusiconimage.tintColor = UIColor.black
        
        locationview.edgeWithShadow(edge: 8.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        droplocationcount = AppConstants.droplat.count
        
       self.setdroplocationtext.text = AppConstants.droplocation[0]
        
         locationviewheight.constant = CGFloat(100.0 + (Float(droplocationcount - 1) * 30.0))
        
       
        
        droplocationtableview.reloadData()
    }
    
    
    @IBAction func addlocationbtnclick(_ sender: Any) {
        
        
       
        
        if AppConstants.droplat.count == Int((AppConstants.userconfiguredata.data?.Totaldistination)!)! + 1{
            
        
        }else{
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let LocationControllerVC = storyBoard.instantiateViewController(withIdentifier: "LocationSearchVC") as! LocationSearchVC
            LocationControllerVC.fromwhichscreen = "addstop"
        LocationControllerVC.getIndex = "2"
        //LocationControllerVC.selectedindex = selectdroplocationindex
        self.present(LocationControllerVC, animated:true, completion:nil)
            
        }
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        let refreshAlert = UIAlertController(title:  "".localized, message: "Are you sure you want to make changes".localized, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "ok".localized , style: .default, handler: { (action: UIAlertAction!) in
            
            self.dismissVC()
            
            
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
   
    @IBAction func donebtnclick(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title:  "".localized, message: "Are you sure you want to make changes".localized, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "ok".localized , style: .default, handler: { (action: UIAlertAction!) in
            
            self.dismissVC()
            
          
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)

        
    }
    
}

extension AddStopsViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return droplocationcount - 1
        
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = droplocationtableview.dequeueReusableCell(withIdentifier: "dropcell", for: indexPath) as! DropLocationTableViewCell
        
       self.setdroplocationtext.text = AppConstants.droplocation[0]
        
       self.setdroplocationtext.textColor = UIColor.black
        
        cell.droplocationtext.text = AppConstants.droplocation[indexPath.row + 1]
        
        
       
            cell.droplocationtext.textColor = UIColor.black
            
     
        cell.cancelbtn.tag = indexPath.row + 1
        cell.cancelbtn.addTarget(self, action: #selector(ClickOnRemovedroplocation), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            droplocationtableview.deselectRow(at: indexPath, animated: true)
         selectdroplocationindex = indexPath.row
        
//            textvalue = 1
//
//            AppConstants.checklocationvalue = 2
//
//            selectdroplocationindex = indexPath.row
//            self.locationManager.delegate = self
//            self.locationManager.requestAlwaysAuthorization()
//
//            mapview.settings.myLocationButton = false
//
//
//
//            let position = CLLocationCoordinate2DMake(Double(AppConstants.droplat[indexPath.row])!, Double(AppConstants.droplng[indexPath.row])!)
//
//            print(position)
//
//            // self.setuplocationMarker(position)
//            mapview.animate(toLocation: position)
//
//            if AppConstants.ServiceType == "1"{
//
//            droplocationtableview.isHidden = false
//
//            }else{
//            droplocationtableview.isHidden = true
//
//            }
//
//            droplocationtableview.reloadData()
        
    }
    
    
    
    @objc func ClickOnRemovedroplocation(_ sender:AnyObject){
        
        selectdroplocationindex = 0
        
        if AppConstants.droplat.count == 1{
            
            
        }else{
            
            
        
        
        AppConstants.droplocation.remove(at: sender.tag)
        AppConstants.droplat.remove(at: sender.tag)
        AppConstants.droplng.remove(at: sender.tag)
        
        
        
        droplocationcount = AppConstants.droplat.count
        
            self.setdroplocationtext.text = AppConstants.droplocation[0]
            
       
            locationviewheight.constant = CGFloat(100.0 + (Float(droplocationcount - 1) * 30.0))
        
            
        droplocationtableview.reloadData()
        
        }
        
    }


    
    
}
