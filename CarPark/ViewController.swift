//
//  ViewController.swift
//  CarPark
//
//  Created by Rex Jason Alobba on 14/6/17.
//  Copyright © 2017 Rex Jason Alobba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var parkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressParkBtn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let parkingVC = storyBoard.instantiateViewController(withIdentifier: "ParkingViewController") as! ParkingViewController
        self.navigationController?.pushViewController(parkingVC, animated: true)
    }

}

