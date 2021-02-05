//
//  Helpers.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/5/21.
//

import Foundation

extension String {
   func replace(string:String, replacement:String) -> String {
       return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
   }

   func removeWhitespace() -> String {
       return self.replace(string: " ", replacement: "")
   }
 }
