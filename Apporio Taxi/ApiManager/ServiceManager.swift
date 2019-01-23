//
//  ServiceManager.swift
//  ApporioEats
//
//  Created by Apporio on 01/06/18.
//  Copyright © 2018 Apporio. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper


class ServiceManager: NSObject  {
    
    static let sharedInstance = ServiceManager()
    var delegate : ApiResponseReceiver?


    // POST API -
    
    func requestPostWithParameter<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
        print(urlString)
        print(requestDictionary)
        print(requestHeader)
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            Alamofire
                .request(urlString, method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                
                    switch response.result {
                    
                    case .success(let responseDetail):
                        
                        print(responseDetail.toJSON().description)
                        self.delegate?.onSuccess(responseDetail)
                   
                    case .failure(let error):
                        //let errorDetail:String = error as! String
                        self.delegate?.onError(error.localizedDescription , errorObject: nil)

                    }
            }
        
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    //GET API -
     func requestGETWithURL<T:Mappable>(_ urlString:String , requestHeader:[String:AnyObject], returningClass:T.Type)-> Void{
        
        print(urlString)
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            Alamofire
                .request(urlString, method: .get, parameters: nil, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        print(response)
                        self.delegate?.onSuccess(responseDetail)
                        
                        
                    case .failure(let error):
                        //let errorDetail:String = error as! String
                        self.delegate?.onError(error.localizedDescription , errorObject: nil)
                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
        
        
    }
    
    
    func requestPostWithImageParameter<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] ,imagesData:[Data], imageParamName:[String], returningClass:T.Type)-> Void {
        
        print(urlString)
        print(requestDictionary)
        print(requestHeader)
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                // import image to request
                
                
                for (index,imageData) in imagesData.enumerated() {
                    multipartFormData.append(imageData, withName: "\(imageParamName[index])", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                }
                for (key, value) in requestDictionary {
                    multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to: urlString, headers: headers,
               
               encodingCompletion: { encodingResult in
                switch encodingResult {
                 case .success(let upload, _, _):
                    
                    upload.responseObject(completionHandler: { (response: DataResponse<T>) in
                        
                        if let responsedata = response.result.value {
                            print(responsedata.toJSON().description)
                            self.delegate?.onSuccess(responsedata)
                            
                        } else {
                            debugPrint("Error...")
                        }
                    })
                    
                case .failure(let error):
                    self.delegate?.onError(error.localizedDescription , errorObject: nil)
                    
                }
                
            })
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
    }
    
    
    
}
