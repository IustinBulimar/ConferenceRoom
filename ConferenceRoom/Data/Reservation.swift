//
//  Reservation.swift
//  Scheduler
//
//  Created by Iustin Bulimar on 1/19/19.
//  Copyright © 2019 Iustin Bulimar. All rights reserved.
//

import Foundation

struct Reservation {
    
//    var startDate: Date
//    var endDate: Date
    var time: String?
    var name: String?
    var organizer: String?
    
    var isCurrent: Bool = false
    
}
