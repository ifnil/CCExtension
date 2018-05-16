//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension Dictionary {
    /// Dictionary -> JSON Data
    public var jsonData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self)
        } catch let error {
            debugPrint(error.localizedDescription, self.debugDescription)
            return nil
        }
    }
}
