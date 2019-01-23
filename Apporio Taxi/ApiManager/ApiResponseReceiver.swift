
//Note :- This method is used for Handling Api Response

import ObjectMapper

protocol ApiResponseReceiver{
    
    func onSuccess<T: Mappable>(_ response:T) -> Void
    func onError(_ errorResponse:String , errorObject:AnyObject?) -> Void
}
