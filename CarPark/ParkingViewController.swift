//
//  ParkingViewController.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 15/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ParkingViewController: UIViewController {
    
    @IBOutlet weak var rateName: UILabel!
    @IBOutlet weak var rateType: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    fileprivate var parkRateName: String?
    fileprivate var parkRateType: String?
    fileprivate var parkPrice: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    override func viewWillAppear(_ animated: Bool) {
        if (self.parkRateName != nil) {
            rateName.text = self.parkRateName
        }
        if (self.parkRateType != nil) {
            rateType.text = self.parkRateType
        }
        if (self.parkPrice != nil) {
            totalPrice.text = String(format: "%.2f", self.parkPrice!.doubleValue)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        rateName.text = ""
        rateType.text = ""
        totalPrice.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setParkRateName(rName: String) {
        self.parkRateName = rName
    }
    
    func setParkRateType(rType: String) {
        self.parkRateType = rType
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
