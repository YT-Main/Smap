//
//  ContentView.swift
//  Smap
//
//  Created by Yash Trivedi on 2021-09-17.
//

import SwiftUI
import CoreLocation
import MapKit
struct Place: Identifiable{
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D{CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
}


struct ContentView: View {
    let places = [
        Place(name: "SLC", latitude: 43.4716, longitude: -80.5453),
        Place(name: "SLC 2", latitude: 43.472, longitude: -80.5453),
        Place(name: "SLC 3", latitude: 43.471, longitude: -80.5453)
    ]
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.4723, longitude: -80.5449), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
    var body: some View {
        NavigationView{
            VStack{
                Map(coordinateRegion: $region, showsUserLocation: false,  annotationItems: places){ place in
                        MapMarker(coordinate: place.coordinate)
                        //MapMarker(coordinate: place.coordinate)

                }.edgesIgnoringSafeArea(.all)
                List{
                    ForEach(places){ place in
                        NavigationLink(place.name, destination: DetailsView())
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
