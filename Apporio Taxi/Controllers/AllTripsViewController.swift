//
//  AllTripsViewController.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import CarbonKit

class AllTripsViewController: BaseViewController,CarbonTabSwipeNavigationDelegate {
    
    @IBOutlet weak var yourtripstextlbl: UILabel!
    
    @IBOutlet weak var carbonkitview: UIView!
    
    var catArray = [String]()
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yourtripstextlbl.text = "Your Trips".localized
        
        catArray = ["Active".localized,"Past".localized]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: catArray, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: carbonkitview)
        self.style()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func style() {
        
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.white
        //carbonTabSwipeNavigation.toolbar.tintColor = UIColor.clear
        //carbonTabSwipeNavigation.toolbar.backgroundColor = UIColor.clear
        carbonTabSwipeNavigation.setIndicatorColor(UIColor(red:0.00, green:0.24, blue:0.52, alpha:0.7))
        carbonTabSwipeNavigation.setIndicatorHeight(1.0)
        
        let n = catArray.count
        
        let s1 = CGFloat(n)
        for i in 0...n-1{
            carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth((view.frame.width)/s1, forSegmentAt: i)
        }
        carbonTabSwipeNavigation.setSelectedColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0), font: UIFont.boldSystemFont(ofSize: 13))
        carbonTabSwipeNavigation.setNormalColor(UIColor(red:0.39, green:0.49, blue:0.55, alpha:1.0) , font: UIFont.boldSystemFont(ofSize: 13))
        // carbonTabSwipeNavigation.setSelectedColor(UIColor(hex: APP_COLOR_DARK_GREEN)
        // , font: UIFont.boldSystemFontOfSize(16))
        
    }

    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        switch index {
            
        case  0:
            
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "ActiveTripViewController") as! ActiveTripViewController
            let INDEX: Int  = Int(index)
            print(INDEX)
            
            return vc
            
        case 1:
            
            print("Hellllllllllllllllllllloooooo  index  is " , index )
            
            let mainStory = UIStoryboard.init(name: "Main", bundle: nil)
            let vc  = mainStory.instantiateViewController(withIdentifier: "CompletedtripViewController") as! CompletedtripViewController
            let INDEX: Int  = Int(index)
            print(INDEX)
            
            
            /*   let vc  = self.storyboard!.instantiateViewController(withIdentifier: "NewRideVCID") as!  NewRideVC
             let INDEX: Int  = Int(index)
             print(INDEX)*/
            
            return vc
            
            
            
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "ActiveTripViewController")
            
        }
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAt index: UInt) {
        
        
    }
    
    
    
    
    @IBAction func backbtnclick(_ sender: Any) {
        
       dismissVC()
    }
    

   

}
