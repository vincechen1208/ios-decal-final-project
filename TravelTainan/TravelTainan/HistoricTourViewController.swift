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
    
    init(name: String, location: CLLocationCoordinate2D) {
        self.name = name
        self.location = location
    }
}

class HistoricTourViewController: UIViewController {
    
    var mapView: GMSMapView?
    
    var currentDestination: HistoricSiteDestination?
    
    let destinations = [HistoricSiteDestination(name: "Confucius Temple", location: CLLocationCoordinate2D(latitude: 22.990467, longitude: 120.204307)), HistoricSiteDestination(name: "Grand Matsu Temple", location: CLLocationCoordinate2D(latitude: 22.996678, longitude: 120.201542)), HistoricSiteDestination(name: "Temple of the Five Concubines", location: CLLocationCoordinate2D(latitude: 22.9816674, longitude: 120.204516)), HistoricSiteDestination(name: "Zheng Chenggong Shrine", location: CLLocationCoordinate2D(latitude: 22.987819, longitude: 120.207764))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GMSServices.provideAPIKey("AIzaSyDVXHP_kVTT3B25AbGn-whzkFgmzBAm9Rg")
        
        let coord = CLLocationCoordinate2D(latitude: 23.010228, longitude: 120.202547)
        let camera = GMSCameraPosition.camera(withTarget: coord, zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        self.view = mapView
        
        for dest in destinations {
            let marker = GMSMarker()
            marker.position = dest.location
            marker.title = dest.name
            marker.snippet = "Historic Site"
            marker.map = mapView
        }
        
        navigationItem.title = "Tainan Historic Tour"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(HistoricTourViewController.nextDest(_:)))
    }
    
//    @objc func nextDest(_ sender:UIBarButtonItem!) {
//
//        if currentDestination == nil {
//            print("here")
//            currentDestination = destinations.first
//        } else {
//            if let index = destinations.index(of: currentDestination!), index < destinations.count - 1 {
//                currentDestination = destinations[index + 1]
//            }
//        }
//
//        setMapCamera()
//    }
    
//    private func setMapCamera() {
//        CATransaction.begin()
//        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
//        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom))
//        CATransaction.commit()
//
//        let marker = GMSMarker(position: currentDestination!.location)
//        marker.title = currentDestination?.name
//        marker.map = mapView
//    }


}

