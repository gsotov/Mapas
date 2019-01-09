//
//  MapaViewController.swift
//  Mapas
//
//  Created by Tecnova on 1/9/19.
//  Copyright © 2019 Gabriel Soto Valenzuela. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    var manager = CLLocationManager()
    
    var latitudMapa : CLLocationDegrees!
    var longitudMapa : CLLocationDegrees!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        //PERMISSION
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let localizacion = CLLocationCoordinate2DMake(latitudMapa, longitudMapa)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: localizacion, span: span)
        self.mapa.setRegion(region, animated: true)
        
        self.mapa.showsUserLocation = true
    }
}
