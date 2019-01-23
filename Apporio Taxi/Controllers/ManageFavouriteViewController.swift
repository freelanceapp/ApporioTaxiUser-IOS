//
//  ManageFavouriteViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 03/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import StarryStars

class ManageFavouriteViewController: BaseViewController {

    @IBOutlet weak var favdrivertableview: UITableView!
    @IBOutlet weak var topmanagefavouritedrivertextlbl: UILabel!
    
    var viewfavouritedriverdata: ViewFavouriteDriverModel!
    
    var tablecount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topmanagefavouritedrivertextlbl.text = "Manage Favourite Driver".localized
        
       
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERFAVOURITEDRIVER
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: ViewFavouriteDriverModel.self)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
   
}

extension ManageFavouriteViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favdrivertableview.dequeueReusableCell(withIdentifier: "managecell", for: indexPath) as! ManageFavouriteTableViewCell
        
        
        cell.driverimageview.makeViewCircular()
        
        let newstring = viewfavouritedriverdata.data![indexPath.row].driver?.profileImage
        
        AppConstants.downloadimage(imagename: newstring!, imageview: cell.driverimageview, placeholderimage: "output1")
        
        cell.drivername.text = viewfavouritedriverdata.data![indexPath.row].driver?.fullName
        
        cell.driverphone.text = viewfavouritedriverdata.data![indexPath.row].driver?.phoneNumber
        
        cell.driverratingtext.text = viewfavouritedriverdata.data![indexPath.row].driver?.rating
        
        if viewfavouritedriverdata.data![indexPath.row].driver?.rating == ""{
            
            cell.driverratingvalue.rating = 0.0
        }else{
        
            cell.driverratingvalue.rating = Float((viewfavouritedriverdata.data![indexPath.row].driver?.rating)!)!
            
        }
        
        
       
        
        return cell
    }
    
    
    
}


extension ManageFavouriteViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
       
        
        
        if let responseData = response as? ViewFavouriteDriverModel{
            
            let data:ViewFavouriteDriverModel = responseData
            
            viewfavouritedriverdata = data
            
            if viewfavouritedriverdata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                tablecount = (viewfavouritedriverdata.data?.count)!
                
                favdrivertableview.reloadData()
               
            }else if viewfavouritedriverdata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: viewfavouritedriverdata.message!, VC: self)
                
            }
            
            
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    
    
}
