//
//  DailyOutlookX.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

import Foundation
import Combine

@MainActor
final class DailyOutLookModel: ObservableObject {
    
    
    struct dailyOutlook: Decodable {
        
        let DOY: String
        let error: Bool
        let datex: String
        let entry: String       // The value of this is what I want to display
    }
    
    
  
}
   




    

