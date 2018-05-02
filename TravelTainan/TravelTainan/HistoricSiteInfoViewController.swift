//
//  HistoricSiteInfoViewController.swift
//  TravelTainan
//
//  Created by Ashley Chang on 4/22/18.
//  Copyright © 2018 Vincent Chen. All rights reserved.
//

import UIKit

class HistoricSiteInfoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var siteName: UITextField!
    @IBOutlet weak var siteInfo: UITextView!
    
    var currSite: HistoricSiteDestination?
    var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let site = currSite {
            let animated = UIImage.animatedImage(with: site.imageArray , duration: 8.0)
            imageView.image = animated
            siteName.text = site.name
            siteInfo.text = Constants().infoArray[selectedIndex!]
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
