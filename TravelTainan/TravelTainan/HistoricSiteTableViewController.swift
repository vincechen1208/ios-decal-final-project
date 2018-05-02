//
//  HistoricSiteTableViewController.swift
//  
//
//  Created by Ashley Chang on 4/20/18.
//

import UIKit
import GoogleMaps

class HistoricSiteTableCell :UITableViewCell {
  
    @IBOutlet weak var siteImage: UIImageView!
    @IBOutlet weak var siteName: UITextField!
}

class HistoricSiteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var siteArray = [HistoricSiteDestination(name: "Chikan Tower", location: CLLocationCoordinate2D(latitude: 22.997484, longitude: 120.202546), imageArray: Constants().ckImages), HistoricSiteDestination(name: "Confucius Temple", location: CLLocationCoordinate2D(latitude: 22.990467, longitude: 120.204307), imageArray: Constants().ctImages), HistoricSiteDestination(name: "Grand Matsu Temple", location: CLLocationCoordinate2D(latitude: 22.996678, longitude: 120.201542), imageArray: Constants().gmImages), HistoricSiteDestination(name: "Wufei Temple", location: CLLocationCoordinate2D(latitude: 22.9816674, longitude: 120.204516), imageArray: Constants().fiveImages), HistoricSiteDestination(name: "Zheng Chenggong Shrine", location: CLLocationCoordinate2D(latitude: 22.987819, longitude: 120.207764), imageArray: Constants().zhengImages), HistoricSiteDestination(name: "Anping Old Fort", location: CLLocationCoordinate2D(latitude: 23.001549, longitude: 120.160624), imageArray: Constants().anpingImages), HistoricSiteDestination(name: "Eternal Golden Castle", location: CLLocationCoordinate2D(latitude: 22.987932, longitude: 120.159244), imageArray: Constants().goldImages)]
    
    var selectedIndexPath: IndexPath?
    let cellHeight:CGFloat = 280
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Tainan Historic Tour"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return siteArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "historicSiteTableCell", for: indexPath) as? HistoricSiteTableCell {
            cell.siteImage.image = siteArray[indexPath.row].imageArray[0]
            cell.siteName.text = siteArray[indexPath.row].name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "historicToInfoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HistoricSiteInfoViewController {
            vc.currSite = siteArray[(selectedIndexPath?.row)!]
            vc.selectedIndex = selectedIndexPath?.row
        }
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
