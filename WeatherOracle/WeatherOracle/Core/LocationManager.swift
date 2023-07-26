//
//  LocationManager.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/23/23.
//

import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var coordinates: (lat: Double, lon: Double) = (0, 0)
    private var locationUpdateHandler: ((Double, Double) -> Void)?

    init(locationUpdateHandler: @escaping (Double, Double) -> Void) {
        super.init()
        self.locationUpdateHandler = locationUpdateHandler
    }

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
    }()

    func requestLocationUpdates() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            print("Default")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        default:
            manager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        coordinates = (location.coordinate.latitude, location.coordinate.longitude)
        locationUpdateHandler?(location.coordinate.latitude, location.coordinate.longitude)
    }
}
