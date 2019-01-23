
import UIKit

class BaseViewController: UIViewController  {

    let bgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetRechableNotification), name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_RECHABLE_NOTIFICATION), object: nil)
      
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetUnreachableNotification), name: NSNotification.Name(rawValue: AppConstants.NSNotificationNames.INTERNET_UNREACHABLE_NOTIFICATION), object: nil)
        
        
        bgView.frame =  CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        bgView.backgroundColor = UIColor.white
        bgView.alpha = 1.0
        
        
        if ReachabilityManager.shared.isNetworkAvailable{
           
            
        }
        else{
            
             internetUnreachableNotification()
        }
        
        
        
        
    }
    
    //MARK: - Notification Methods
    
    @objc func internetUnreachableNotification(){
        
        debugPrint("internet is not connected")
        
        
                let alertController = UIAlertController( title: AppConstants.ErrorMessages.ALERT_TITLE,
                                                         message: AppConstants.ErrorMessages.PLEASE_CHECK_YOUR_INTERNET_CONNECTION, preferredStyle: .alert)
        
                let OKAction = UIAlertAction(title: NSLocalizedString("Open Settings", comment: ""), style: .default) { (action) in
        
                    if let url = NSURL(string: "App-Prefs:root=Settings") {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
        
                }
                alertController.addAction(OKAction)
                present(alertController, animated: true, completion: nil)
        
        
    }
    
    @objc func internetRechableNotification() {
        
        debugPrint("internet is connected")
        
    }
    
    
    
    // MARK: - Loader type
    
    func showLoader(_ VC : AnyObject?){
        
        VC?.addSubview(bgView)
        DispatchQueue.main.async(execute: {
            SVProgressHUD.show()
            SVProgressHUD.setRingThickness(5.0)
        })
    
    }
    
    func hideLoader(){
        self.bgView.removeFromSuperview()
        SVProgressHUD.dismiss()
        
        
    }
    
    func showLoaderWithoutBackground(){
        SVProgressHUD.show()
        SVProgressHUD.setRingThickness(5.0)
        SVProgressHUD.setDefaultMaskType(.clear)
    }
    
    
    func hideLoaderWithoutBackground(){
         SVProgressHUD.dismiss()
    }
    
    
    // MARK: - Helper Methods
    
    func showErrorAlert(_ alertTitle: String, alertMessage: String,VC : AnyObject?){
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            VC!.present(alertController, animated: true, completion: nil)
            
        })
     
        
    }
    
    
    
    
    
   
    
}



