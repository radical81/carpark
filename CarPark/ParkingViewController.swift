//
//  ParkingViewController.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 15/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ParkingViewController: UIViewController {
    @IBOutlet weak var parkDetails: UITextView!
    @IBOutlet weak var totalPrice: UILabel!
    
    fileprivate var parkRateDesc: String?
    fileprivate var parkPrice: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        if (self.parkRateDesc != nil) {
            parkDetails.text = self.parkRateDesc
        }
        if (self.parkPrice != nil) {
            totalPrice.text = String(format: "%.2f", self.parkPrice!.doubleValue)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        parkDetails.text = ""
        totalPrice.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setParkRateDescText(description: String) {
        self.parkRateDesc = description
    }
    
    func setParkPrice(price: NSNumber) {
        self.parkPrice = price
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
