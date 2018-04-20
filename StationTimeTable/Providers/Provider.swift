//
//  Provider
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import Alamofire

public typealias Success = ((AnyObject) -> ()) // Success callback definition
public typealias Failure = ((FbError) -> ()) // Failure callback definition
public typealias Parameters = [String : Any]

class Provider {
    
    private var headers: HTTPHeaders = [
        "X-Api-Authentication" : "intervIEW_TOK3n"
    ]
    
    enum ApiConstants {
        static let baseURLString = "http://api.mobile.staging.mfb.io"
    }
    
    /// Http get request returns JSON
    ///
    /// - Parameters:
    ///   - path: path of the endpoint
    ///   - parameters: parameters for the request
    ///   - success: success block that the result given
    ///   - failure: failure block that the fail reason given
    func get(path: String, parameters: Parameters?, success: Success?, failure: Failure?){
        
        let finalPath = ApiConstants.baseURLString + path
        Alamofire.request(finalPath, method: .get, parameters: parameters, headers: headers).validate().responseJSON { (response) in
            switch response.result {
            case .success(let json):
                success?(json as AnyObject)
                break
            case .failure(let error):
                failure?(FbError(description: error.localizedDescription))
                break
            }
        }
    }
}
