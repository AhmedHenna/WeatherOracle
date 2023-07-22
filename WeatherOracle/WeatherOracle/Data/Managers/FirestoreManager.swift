//
//  FirestoreManager.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 7/22/23.
//

// FirestoreManager.swift (Data Manager)
import Firebase
import FirebaseFirestore

class FirestoreManager {
    private var db: Firestore

    static let shared = FirestoreManager() // Singleton instance

    private init() {
        db = Firestore.firestore()
    }

    func fetchCities(completion: @escaping ([City]) -> Void) {
        db.collection("cities").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            var fetchedCities: [City] = []

            for document in documents {
                let data = document.data()

                if let country = data["country"] as? String,
                   let cityName = data["name"] as? String,
                   let lat = data["lat"] as? String,
                   let long = data["lng"] as? String {

                    let city = City(country: country, cityName: cityName, lat: Double(lat)!, long: Double(long)!)
                    fetchedCities.append(city)
                }
            }
            completion(fetchedCities)
        }
    }
}
