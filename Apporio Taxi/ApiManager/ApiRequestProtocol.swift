

import Foundation

protocol ApiRequestProtocol {
    
    associatedtype Request
    associatedtype ResponseBack
    //associatedtype ErrorResolve
    
    /**
     This method is used for making API Request
     
     - parameter reqFromData:      request conatins request Dictionary
     - parameter responseCallback: used for response callback either Success or Error
     - returns: Void
     
     */
    
    func makeAPIRequest(withReqFormData reqFromData:Request, responseCallback:ResponseBack) -> Void
    
    /**
     This method is used for canceling API Call
     - returns: Void
     */
    
    func cancel() -> Void
    
    /**
     This method is used for checking whether Api call is in progress or not

     - returns: Boolean value if in progress then true otherwise false
     */
    
    func isInProgress() -> Bool
}
