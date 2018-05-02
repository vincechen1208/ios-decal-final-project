//
//  HistoricTourViewController.swift
//  TravelTainan
//
//  Created by Vincent Chen on 4/17/18.
//  Copyright © 2018 Vincent Chen. All rights reserved.
//

import UIKit
import GoogleMaps

class HistoricSiteDestination: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let imageArray: [UIImage]
    
    init(name: String, location: CLLocationCoordinate2D, imageArray: [UIImage]) {
        self.name = name
        self.location = location
        self.imageArray = imageArray
    }
}

class HistoricTourViewController: UIViewController, GMSMapViewDelegate {
    
    var mapView: GMSMapView?
    
    var currentDestination: HistoricSiteDestination?
    
    var siteArray = [HistoricSiteDestination(name: "Chikan Tower", location: CLLocationCoordinate2D(latitude: 22.997484, longitude: 120.202546), imageArray: Constants().ckImages), HistoricSiteDestination(name: "Confucius Temple", location: CLLocationCoordinate2D(latitude: 22.990467, longitude: 120.204307), imageArray: Constants().ctImages), HistoricSiteDestination(name: "Grand Matsu Temple", location: CLLocationCoordinate2D(latitude: 22.996678, longitude: 120.201542), imageArray: Constants().gmImages), HistoricSiteDestination(name: "Wufei Temple", location: CLLocationCoordinate2D(latitude: 22.9816674, longitude: 120.204516), imageArray: Constants().fiveImages), HistoricSiteDestination(name: "Zheng Chenggong Shrine", location: CLLocationCoordinate2D(latitude: 22.987819, longitude: 120.207764), imageArray: Constants().zhengImages), HistoricSiteDestination(name: "Anping Old Fort", location: CLLocationCoordinate2D(latitude: 23.001549, longitude: 120.160624), imageArray: Constants().anpingImages), HistoricSiteDestination(name: "Eternal Golden Castle", location: CLLocationCoordinate2D(latitude: 22.987932, longitude: 120.159244), imageArray: Constants().goldImages)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GMSServices.provideAPIKey("AIzaSyDVXHP_kVTT3B25AbGn-whzkFgmzBAm9Rg")
        
        let coord = CLLocationCoordinate2D(latitude: 23.010228, longitude: 120.202547)
        let camera = GMSCameraPosition.camera(withTarget: coord, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.zoomGestures = true
        
        mapView.delegate = self
        self.view = mapView
        
        for dest in siteArray {
            let marker = GMSMarker()
            marker.position = dest.location
            marker.title = dest.name
            marker.snippet = "First Class National Historic Site"
            marker.map = mapView
        }
    
        navigationItem.title = "Tainan Historic Tour"
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        if let i = siteArray.index(where: { $0.name == marker.title! }) {
            currentDestination = siteArray[i]
        }
        performSegue(withIdentifier: "mapToInfoView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? HistoricSiteInfoViewController {
            vc.currSite = currentDestination
            vc.selectedIndex = siteArray.index(of: currentDestination!)
        }
    }
    
//    @objc func nextDest(_ sender:UIBarButtonItem!) {
//
//        if currentDestination == nil {
//            currentDestination = siteArray.first
//        } else {
//            if let index = siteArray.index(of: currentDestination!), index < siteArray.count - 1 {
//                currentDestination = siteArray[index + 1]
//            }
//        }
//
//        setMapCamera()
//    }
//
//    private func setMapCamera() {
//        CATransaction.begin()
//        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
//        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: 10))
//        CATransaction.commit()
//
//        let marker = GMSMarker(position: currentDestination!.location)
//        marker.title = currentDestination?.name
//        marker.map = mapView
//    }
}

