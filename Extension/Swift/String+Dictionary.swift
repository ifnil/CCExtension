//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension String {
    
    /// JSON String -> JSON Dictionary
    public var jsonDictionary: Dictionary<String, Any>? {
        guard let JsonData = self.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            return nil
        }
        do {
            if let JSONDictionary = try JSONSerialization.jsonObject(with: JsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, Any> {
                return JSONDictionary
            } else {
                return nil
            }
        } catch let error {
            print("format \(self) to Dictionary fail:\(error.localizedDescription)")
            return nil
        }
    }
    
    /// url format -> Dictionary  ext:http://domain.com?ID=1&code=2
    public var urlDictionary: Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        let params = self.components(separatedBy: "&")
        for param in params {
            let strs = (param as NSString).components(separatedBy: "=")
            if strs.count >= 2 {
                if let value = (strs[1] as NSString).removingPercentEncoding {
                    dict[strs[0]] = value
                } else {
                    print("un-resolve key:\(strs[0]) value:\(strs[1])")
                }
            } else {
                print("un-resolve strs \(strs)")
            }
        }
        return dict
    }
}