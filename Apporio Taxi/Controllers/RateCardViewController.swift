//
//  RateCardViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 06/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class RateCardViewController: BaseViewController {
    
    @IBOutlet weak var topcollectionview: UICollectionView!
    
    @IBOutlet weak var toppricecardtextlbl: UILabel!
    
    @IBOutlet weak var bottomcollectionview: UICollectionView!
    
    @IBOutlet weak var selectareatext: UILabel!
    
    @IBOutlet weak var innerhiddenviewheight: NSLayoutConstraint!
    
    var countarrayvalue = [Int]()
    
    
   
     var check = 0
    
    
   // @IBOutlet weak var bottomcollectionviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var hiddentableview: UITableView!
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var hiddencancelbtntext: UIButton!
    @IBOutlet weak var hiddenokbtntextlbl: UIButton!
    @IBOutlet weak var tophiddenselectareatextlbl: UILabel!
    @IBOutlet weak var innerhiddenview: UIView!
    
    var ratecarddata: RateCardModel!
    
    
    var selectareadata: SelectAreaModel!
    
    var selecttopcollectionvalue = 0
    
    var selectbottomcollectionvalue = 0
    
    
    var firstcollectionviewcount = 0
    
    var secondcollectionviewcount = 0
    
    var firsttableviewcount = 0
    
    var secondtableviewcount = 0
    
    var selectedareabyuser = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenview.isHidden = true
        
        toppricecardtextlbl.text = "Price Card".localized
        tophiddenselectareatextlbl.text = "Select Area".localized
        hiddencancelbtntext.setTitle("CANCEL".localized, for: UIControlState.normal)
        hiddenokbtntextlbl.setTitle("OK".localized, for: UIControlState.normal)
        
       
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERAREAS
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: [:], requestHeader: AppConstants.dicauthorization, returningClass: SelectAreaModel.self)
      
        
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func callApi(){
        
       
        
        let dic1 = ["area": selectedareabyuser
            
            ] as [String : AnyObject]
        
        
        showLoaderWithoutBackground()
        
        
        
        let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.USERRATECARD
        ServiceManager.sharedInstance.delegate = self
        
        ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: RateCardModel.self)
        
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        self.dismissVC()
    }
    
    
    @IBAction func selectareabtnclick(_ sender: Any) {
      hiddenview.isHidden = false
        
    }
    
    
    @IBAction func hiddencancelbtnclick(_ sender: Any) {
        
         hiddenview.isHidden = true
    }
    
    @IBAction func hiddenokbtnclick(_ sender: Any) {
        
        
       
        
          self.callApi()
         hiddenview.isHidden = true
        
    }
    
   

}

extension RateCardViewController: UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
       
        
        
        let flowLayout: UICollectionViewFlowLayout = topcollectionview.collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.itemSize = CGSize(width:(self.topcollectionview.frame.width / 4) - 6 ,height: 40)
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            
            return firstcollectionviewcount
        }else{
            
            return secondcollectionviewcount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            
            let cell = topcollectionview.dequeueReusableCell(withReuseIdentifier: "topcell", for: indexPath)
            
            
            let mainview: UIView = cell.contentView.viewWithTag(1)!
            
            let textlbl: UILabel = cell.contentView.viewWithTag(2) as! UILabel
            
            mainview.edgeWithOutShadow(edge: 16.0)
            
            textlbl.text = self.ratecarddata.data![indexPath.row].serviceName
            
            textlbl.textColor = UIColor.white
            
            if selecttopcollectionvalue == indexPath.row{
                mainview.backgroundColor = UIColor.appThemeColor()
                
            }else{
                
                mainview.backgroundColor = UIColor.darkGray
            }
            
            return cell
            
        }else{
            
            let cell = bottomcollectionview.dequeueReusableCell(withReuseIdentifier: "bottomcell", for: indexPath) as! RateCardCollectionViewCell
            
            cell.mainview.edgeWithShadow(edge: 16.0)
            
          //  let newstring = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![indexPath.row].vehicleTypeImage
            
            cell.firsttext.text = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![indexPath.row].vehicleTypeName
            
            cell.secondtext.text = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![indexPath.row].vehicleTypeDescription
            
            
           
            
        
            cell.innertableview.reloadData()
           
            
            return cell
            
        }
        
        
        
    }
    
    
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    if collectionView.tag == 1{
        
       countarrayvalue.removeAll()
        selecttopcollectionvalue = indexPath.row
        
        secondcollectionviewcount = (self.ratecarddata.data![indexPath.row].vehicleType?.count)!
        
      // let indexPathForFirstRow = IndexPath(row: 0, section: 0)

      //  self.bottomcollectionview.scrollToItem(at:IndexPath(item: 0, section: 0), at: .right, animated: false)

        
//        self.bottomcollectionview?.scrollToItem(at: IndexPath(row: indexPath.row, section: 0),at: .centeredHorizontally,
//                                                                                                  animated: true)
//

    //  self.collectionView(bottomcollectionview, didSelectItemAt: indexPathForFirstRow)

        selectbottomcollectionvalue = 0
        
        firsttableviewcount = (self.ratecarddata.data![selecttopcollectionvalue].vehicleType![0].priceCardValues?.count)!
        
      //   bottomcollectionview.scrollToItem(at: indexPath, at: .right, animated: true)
       
        bottomcollectionview.reloadData()
        topcollectionview.reloadData()
        
        
        
    }else{
        
        
        bottomcollectionview.deselectItem(at: indexPath, animated: true)
        
         bottomcollectionview.reloadData()
        
    }
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.tag == 1{
     
            
            
            let cellWidth = 90
            
            let cellSpacing = 2
            
            let cellCount = firstcollectionviewcount
            
            let totalCellWidth = cellWidth * cellCount
            let totalSpacingWidth = cellSpacing * (cellCount - 1)
            
            let leftInset = (topcollectionview.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            
            return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
            
            
        }else{
            
              return UIEdgeInsetsMake(0, 10, 0, 10)
        }
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //manageScroll(scrollView.contentOffset.x)
        
        
        
        
        let visibleRect = CGRect(origin: bottomcollectionview.contentOffset, size: bottomcollectionview.bounds.size)
                        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                        let indexPath = bottomcollectionview.indexPathForItem(at: visiblePoint)
                     
        
        
        let cell = bottomcollectionview.cellForItem(at: indexPath!) as! RateCardCollectionViewCell
        
        selectbottomcollectionvalue = (indexPath?.row)!
        
        
        firsttableviewcount = (self.ratecarddata.data![selecttopcollectionvalue].vehicleType![selectbottomcollectionvalue].priceCardValues?.count)!
        
        
        
        cell.innertableview.reloadData()
        
        
    }
    
    
    

    
    

    
    
   
}

extension RateCardViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
          
            
          
            return firsttableviewcount
            
        }else{
            
            return secondtableviewcount
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "innercell", for: indexPath)
            
            
            let firsrtext: UILabel = cell.contentView.viewWithTag(1) as! UILabel
            
             let secondtext: UILabel = cell.contentView.viewWithTag(2) as! UILabel
            
             let thirdtext: UILabel = cell.contentView.viewWithTag(3) as! UILabel
            
            
            print("fdbhjng/\(countarrayvalue.count)")
            
            
//            self.bottomcollectionview?.scrollToItem(at: IndexPath(row: 0, section: 0),at: .centeredHorizontally,
//                                                    animated: true)
//

           firsrtext.text = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![selectbottomcollectionvalue].priceCardValues![indexPath.row].pricingParameter

            secondtext.text = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![selectbottomcollectionvalue].priceCardValues![indexPath.row].descriptionValue

            thirdtext.text = self.ratecarddata.data![selecttopcollectionvalue].vehicleType![selectbottomcollectionvalue].priceCardValues![indexPath.row].parameterPrice

           

            
            return cell
            
        }else{
           let cell1 = hiddentableview.dequeueReusableCell(withIdentifier: "hiddencell", for: indexPath)
            
            
            let firsttext: UILabel = cell1.contentView.viewWithTag(2) as! UILabel
            
            let imageview: UIImageView = cell1.contentView.viewWithTag(1) as! UIImageView
            
            firsttext.text = self.selectareadata.data![indexPath.row].areaName
            
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
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            
            
        }else{
            hiddentableview.deselectRow(at: indexPath, animated: true)
            
            
            hiddentableview.deselectRow(at: indexPath, animated: true)
            check = indexPath.row
            
          
            
            selectedareabyuser = self.selectareadata.data![indexPath.row].id!
            
            selectareatext.text = "Select City : ".localized + self.selectareadata.data![indexPath.row].areaName!
            
          
                
           
            hiddentableview.reloadData()
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
}



extension RateCardViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
    
        
        if let responseData = response as? SelectAreaModel{
            
            let data:SelectAreaModel = responseData
            
            self.selectareadata = data
            
            if self.selectareadata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                secondtableviewcount = (self.selectareadata.data?.count)!
                
                selectedareabyuser = self.selectareadata.data![0].id!
                
                selectareatext.text = "Select City : ".localized + self.selectareadata.data![0].areaName!
                
                self.callApi()
                
                
                hiddentableview.reloadData()
                
            }else if selectareadata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else{
                
                
            }
        }
        
        if let responseData = response as? RateCardModel{
            
            let data:RateCardModel = responseData
            
            self.ratecarddata = data
            
            if self.ratecarddata.result == "1" {
                
                hideLoaderWithoutBackground()
                
                
                firstcollectionviewcount =  (self.ratecarddata.data?.count)!
                
                let indexPathForFirstRow = IndexPath(row: 0, section: 0)
                
                
                self.collectionView(topcollectionview, didSelectItemAt: indexPathForFirstRow)
                
                topcollectionview.reloadData()
             
            
            }else if ratecarddata.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            } else{
                
                
            }
    }
    }
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        
       
    }
    
    
    
}




