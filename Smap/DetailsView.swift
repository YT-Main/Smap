//
//  DetailsView.swift
//  Smap
//
//  Created by Yash Trivedi on 2021-09-17.
//
import MapKit
import SwiftUI

struct DetailsView: View {
    let places = [
        Place(name: "SLC", latitude: 43.4716, longitude: -80.5453),
    ]
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.4723, longitude: -80.5449), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
    var body: some View {
        NavigationView{
            VStack{
                Map(coordinateRegion: $region, showsUserLocation: false,  annotationItems: places){ place in
                        MapMarker(coordinate: place.coordinate)
                        //MapMarker(coordinate: place.coordinate)

                }.edgesIgnoringSafeArea(.all)
                .frame(height: 100)
                VStack{
                    Text("Student Life Center (SLC)")
                        .font(.largeTitle)
                        .bold()
                    HStack{
                        Image("dual-profile")
                            .resizable()
                            .frame(width: 60, height: 55)
                        Text("Yash, Dwayne, and 6+ others in this study space")
                    }
                    Link("Take Me There", destination: URL(string: "https://www.google.com/maps/place/Turnkey+Desk/@43.4716415,-80.5453385,15z/data=!4m5!3m4!1s0x0:0x6a103714f7b2accf!8m2!3d43.4716415!4d-80.5453385")!)
                    
                }
                Spacer()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
