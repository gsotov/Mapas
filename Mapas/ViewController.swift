//
//  ViewController.swift
//  Mapas
//
//  Created by Tecnova on 1/9/19.
//  Copyright © 2019 Gabriel Soto Valenzuela. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var buscador: UISearchBar!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        buscador.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        buscador.resignFirstResponder()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscador.text!, completionHandler: {(places:[CLPlacemark]?, error: Error?  ) in
            if error == nil{
                let place = places?.first
                let anotation = MKPointAnnotation()
                
                anotation.coordinate = (place?.location?.coordinate)!
                anotation.title = self.buscador.text
                
                let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
                let region = MKCoordinateRegion(center: anotation.coordinate, span: span)
                self.mapa.setRegion(region, animated: true)
                
                self.mapa.addAnnotation(anotation)
                self.mapa.selectAnnotation(anotation, animated: true)
                
                
            }else{
                print("hubo un error")
            }
            
        })
    }

}

