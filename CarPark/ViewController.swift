//
//  ViewController.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 14/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var entryDateTime: UIDatePicker!
    @IBOutlet weak var exitDateTime: UIDatePicker!
    @IBOutlet weak var parkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func processParking(detailView: ParkingViewController, enter: Date, leave: Date) {
        let priceCalc = PriceCalculator()
        let rateSelector = RateSelector()
        let correctRate = rateSelector.selectRate(enter: enter, leave: leave)
        detailView.setParkRateName(rName: correctRate.name)
        detailView.setParkRateType(rType: correctRate.typeText)
        let totalPrice = priceCalc.calculatePrice(enter: enter, leave: leave, rate: correctRate)
        detailView.setParkPrice(price: totalPrice)
    }
    
    @IBAction func didPressParkBtn(_ sender: UIButton) {
        if(entryDateTime.date > exitDateTime.date) {
            let alert = UIAlertController(title: "Date Error", message: "Please make sure entry date comes before exit date", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default) {
                action -> Void in print("Ok")
                return;
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:m a"
        NSLog("entry: %@", formatter.string(from: entryDateTime.date))
        NSLog("exit: %@", formatter.string(from: exitDateTime.date))
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let parkingVC = storyBoard.instantiateViewController(withIdentifier: "ParkingViewController") as! ParkingViewController
        self.processParking(detailView: parkingVC, enter: entryDateTime.date, leave: exitDateTime.date)
        self.navigationController?.pushViewController(parkingVC, animated: true)
    }
}

