//
//  ViewController.swift
//  Scheduler
//
//  Created by Iustin Bulimar on 1/19/19.
//  Copyright © 2019 Iustin Bulimar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reservationsTableView: UITableView!
    @IBOutlet weak var leftCalendarButton: UIButton!
    @IBOutlet weak var rightCalendarButton: UIButton!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    
    
    var reservations: [Reservation] = [
        Reservation(time: "09:00 - 10:00", name: "Marketing Meeting", organizer: "John Smith", isCurrent: false),
        Reservation(time: "10:30 - 12:45", name: "Sales Team Update", organizer: "Jane Doe", isCurrent: true),
        Reservation(time: "13:00 - 15:00", name: "Marketing Meeting", organizer: "John Smith", isCurrent: false),
        Reservation(time: "15:00 - 15:30", name: "Sales Team Update", organizer: "Jane Doe", isCurrent: false),
        Reservation(time: "16:45 - 17:30", name: "Marketing Meeting", organizer: "John Smith", isCurrent: false),
        Reservation(time: "18:00 - 19:45", name: "Sales Team Update", organizer: "Jane Doe", isCurrent: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reservationsTableView.tableFooterView = UIView()
        reservationsTableView.register(cellClass: ReservationCell.self)
        reservationsTableView.dataSource = self
        
        bookButton.layer.borderColor = UIColor.white.cgColor
        bookButton.layer.borderWidth = 2
        
        
        leftCalendarButton.setImage(UIImage(named: "arrow-left")!.withRenderingMode(.alwaysTemplate), for: .normal)
        rightCalendarButton.setImage(UIImage(named: "arrow-right")!.withRenderingMode(.alwaysTemplate), for: .normal)
        
        
    }

    @IBAction func didTapCheckInButton() {
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reservation = reservations[indexPath.row]
        let cell = tableView.dequeueReusableCell(ofType: ReservationCell.self, for: indexPath)
        
        cell.timeLabel.text = reservation.time
        cell.nameLabel.text = reservation.name
        cell.organizerLabel.text = reservation.organizer
        
        cell.currentIndicatorImageView.isHidden = !reservation.isCurrent
        cell.currentIndicatorImageView.image = UIImage(named: "triangle-right")!.withRenderingMode(.alwaysTemplate)
        
        return cell
    }
    
}

