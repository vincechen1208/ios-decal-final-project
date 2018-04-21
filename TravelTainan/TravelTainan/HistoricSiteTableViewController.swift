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
    var siteArray = [HistoricSiteDestination(name: "Chikan Tower", location: CLLocationCoordinate2D(latitude: 22.997484, longitude: 120.202546)), HistoricSiteDestination(name: "Confucius Temple", location: CLLocationCoordinate2D(latitude: 22.990467, longitude: 120.204307)), HistoricSiteDestination(name: "Grand Matsu Temple", location: CLLocationCoordinate2D(latitude: 22.996678, longitude: 120.201542)), HistoricSiteDestination(name: "Temple of the Five Concubines", location: CLLocationCoordinate2D(latitude: 22.9816674, longitude: 120.204516)), HistoricSiteDestination(name: "Zheng Chenggong Shrine", location: CLLocationCoordinate2D(latitude: 22.987819, longitude: 120.207764)), HistoricSiteDestination(name: "Anping Old Fort", location: CLLocationCoordinate2D(latitude: 23.001549, longitude: 120.160624)), HistoricSiteDestination(name: "Eternal Golden Castle", location: CLLocationCoordinate2D(latitude: 22.987932, longitude: 120.159244))]
    var siteImages: [UIImage] = [UIImage(named:"cktower1")!, UIImage(named:"ctemple")!, UIImage(named:"matsu")!, UIImage(named:"wufei")!, UIImage(named:"chengshrine")!, UIImage(named:"anping")!, UIImage(named:"goldcastle")!]
    var selectedIndexPath: IndexPath?
    let cellHeight:CGFloat = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
            cell.siteImage.image = siteImages[indexPath.row]
            cell.siteName.text = siteArray[indexPath.row].name
            return cell
        } else {
            return UITableViewCell()
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
