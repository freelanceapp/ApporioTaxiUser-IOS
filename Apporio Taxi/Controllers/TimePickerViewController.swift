//
//  TimePickerViewController.swift
//  TaxiUser
//
//  Created by AppOrio on 29/05/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import ObjectMapper

class TimePickerViewController: BaseViewController {
    
    @IBOutlet weak var selectdatetimetext: UILabel!
    
    var matchstring = ""
    
  
    
    var renttypeid = ""
    
    var cartypeid = ""
    
    var viewcontrollerself : UIViewController!
    
    
    @IBOutlet weak var cancelbtntextlabel: UIButton!
    @IBOutlet weak var donebtntextlabel: UIButton!
    @IBOutlet weak var selectdatetimetextlabel: UILabel!
    
    @IBOutlet weak var datepick: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        
        selectdatetimetext.text = "Select Date & Time".localized
        donebtntextlabel.setTitle("Done".localized, for: .normal)
        cancelbtntextlabel.setTitle("Cancel".localized, for: .normal)
       
       // let newdate = date.addingTimeInterval(7200)
        let value = Int((AppConstants.userconfiguredata.data?.rideLate?.rideLaterHours)!)! * 3600
        
        let newdate = date.addingTimeInterval(TimeInterval(value))
        print(newdate)
        datepick.minimumDate = newdate
        
        //let formatter = DateFormatter()
      //  datepick.minimumDate = date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changedatevaluebtn(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        let strDate = formatter.string(from: datepick.date)
        print(strDate)
        
        
        
        formatter.dateFormat = "HH:mm:ss"
        let time = formatter.string(from: datepick.date)
        print(time)

        selectdatetimetext.text = strDate + " " + time
        
        
    }
    
    
    
    @IBAction func donebtn(_ sender: Any) {
        
        
        if matchstring == "leavebookoutstation"{
            
            
            let formatter = DateFormatter()
           // formatter.dateFormat = "E, dd MMM yyyy"
            formatter.dateFormat = "yyyy-MM-dd"
            let strDate = formatter.string(from: datepick.date)
            print(strDate)
            
            
            
            formatter.dateFormat = "HH:mm:ss"
            let time = formatter.string(from: datepick.date)
            print(time)
            
            
            AppConstants.LeaveSelectDate = strDate
            AppConstants.LeaveSelectTime = time
            
            let formatter1 = DateFormatter()
            // formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter1.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
            formatter1.amSymbol = "AM"
            formatter1.pmSymbol = "PM"
             let dateString = formatter1.string(from: datepick.date)
            AppConstants.LeaveSelectDateshowformat = dateString
            
            
            
            self.dismissVC()
             self.viewcontrollerself.viewWillAppear(true)
       
            
            self.matchstring = ""
            
        }else if matchstring == "returnbookoutstation"{
        
            let formatter = DateFormatter()
            // formatter.dateFormat = "E, dd MMM yyyy"
            formatter.dateFormat = "yyyy-MM-dd"
            let strDate = formatter.string(from: datepick.date)
            print(strDate)
           
            
            formatter.dateFormat = "HH:mm:ss"
            let time = formatter.string(from: datepick.date)
            print(time)
            
            AppConstants.ReturnSelectDate = strDate
            AppConstants.ReturnSelectTime = time
            
            let formatter1 = DateFormatter()
           // formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter1.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
            formatter1.amSymbol = "AM"
            formatter1.pmSymbol = "PM"
            
            let dateString = formatter1.string(from: datepick.date)
            
            AppConstants.ReturnSelectDateShowdate = dateString
            
            self.dismissVC()
            self.viewcontrollerself.viewWillAppear(true)
            
            
            self.matchstring = ""

        
        
        }else{
            
            
            let formatter = DateFormatter()
            //formatter.dateFormat = "E, dd MMM yyyy"
            formatter.dateFormat = "yyyy/MM/dd"
            let strDate = formatter.string(from: datepick.date)
            print(strDate)
            
            
            
            formatter.dateFormat = "HH:mm:ss"
            let time = formatter.string(from: datepick.date)
            print(time)
            
            AppConstants.SelectDate = strDate
            AppConstants.SelectTime = time
            
            
             self.dismiss(animated: true, completion: nil)
            self.viewcontrollerself.viewWillAppear(true)
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let ridelaterviewcontroller = storyBoard.instantiateViewController(withIdentifier: "RideLaterViewController") as! RideLaterViewController
//            ridelaterviewcontroller.modalPresentationStyle = .overCurrentContext
//            //  paymentviewcontroller.modalPresentationStyle = .Popover
//            self.present(ridelaterviewcontroller, animated:true, completion:nil)
//
        }
        
        
    }
    
    
    @IBAction func Cancelbtn(_ sender: Any) {
        
        AppConstants.SelectDate = ""
        
        AppConstants.SelectTime = ""
        
         AppConstants.BookingType = ""
        AppConstants.ReturnSelectDate = ""
        
        AppConstants.ReturnSelectTime = ""
        
        AppConstants.LeaveSelectDate = ""
        
        AppConstants.LeaveSelectTime = ""
        
        self.dismiss(animated: true, completion: nil)

        
    }
    
    


}
