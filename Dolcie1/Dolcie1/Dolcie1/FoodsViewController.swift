//
//  FoodsViewController.swift
//  Dolcie1
//
//  Created by Caroline Win on 11/14/15.
//  Copyright © 2015 MAC. All rights reserved.
//

import UIKit
import SwiftHTTP

class FoodsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var counter=0
    
    @IBAction func incrementCounter(sender: UIButton) {
        counter++
        
        sender.setTitle(String(counter), forState: UIControlState.Normal)
        
        do {
            let opt = try HTTP.GET("https://api.nutritionix.com/v1_1/search/donatos?results=0%3A20&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id&appId=0957869a&appKey=5162308af2fc1b259e1f36ed1894eb4c")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                print("opt finished: \(response.description[0].brand_id)")
                //print("data is: \(response.data)") access the response of the data with response.data
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
