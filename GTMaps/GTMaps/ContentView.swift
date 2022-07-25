//
//  ContentView.swift
//  transportation-app
//
//  Created by Omar Jimenez on 6/20/22.
//

//

import MapKit
import SwiftUI
import UIKit
import Foundation
import UserNotifications
import UserNotificationsUI

enum NotificationAction: String{
    case dismiss
}

enum NotificationCategory: String{
    case general
}

struct ContentView: View {

  @State private var directions: [String] = []
  @State private var walkdirections: [String] = []
  @State private var showCarDirections = false
  @State private var showBusDirections = false
  @State private var showRideshareDirections = false
  @State private var showWalkDirections = false
  @State private var showRealDirections = false
  @State var isOn: Bool = false
    

  var body: some View {
     
/*
      // Initial notifications (TOCHECK)
      VStack (spacing: 0){
          Button("Notifications") {
              
              let content = UNMutableNotificationContent()
              content.title = "Suggested Route"
              content.subtitle = "TOADD"
              content.sound = UNNotificationSound.default

              // Show notification 5 secs after
              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)

              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

              // add our notification request
              UNUserNotificationCenter.current().add(request)
              
            }
          //.font(.system(size: 3))
          .foregroundColor(.black)
          }
*/
      
      VStack (spacing: 10) {
 /*
          VStack (spacing: 0){
              Image("gt-maps")
                  .resizable()
                  .frame(height: 80)
          }
*/
   
          Button("Notifications") {
              
              let content = UNMutableNotificationContent()
              content.title = "GTMaps"
              //content.subtitle = "Suggested Route: We've noticed you drive to campus often. Save over $800/year by walking instead."
              //content.subtitle = "Warning: Walking by area with high crime rate recently. Press for a safer route with similar ETA."
              content.subtitle = "Warning: Covid cases are high in Atlanta. Avoid crowded transportation options if possible."
              content.sound = UNNotificationSound.default

              // Show notification 5 secs after
              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)

              let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

              // add our notification request
              UNUserNotificationCenter.current().add(request)
              
            }
          //.font(.system(size: 3))
          .foregroundColor(.black)
          MapView(directions: $directions, walkdirections: $walkdirections)
          
        
    //let covidCases: Int32 = 69
      VStack (spacing: 15){
          
          (Text("\n⚠️ Warning: 300 new COVID-19 cases in Atlanta this week"))
             .font(.system(size: 18))
             
          Divider().background(Color.gray)
              //.background(Color.green)
          }
          
     let foregroundColor = Color.blue
     //let foregroundColor = Color("CustomGold")

     HStack (spacing: 7) {
 
          Button(action: {
            self.showCarDirections.toggle()
          }, label: {
              Text(Image(systemName: "car.fill"))
                  .foregroundColor(foregroundColor)
                    +
              Text("\n 4 min")
                  .foregroundColor(foregroundColor)
                  .bold()
                  +
              Text("\n $3.13")
                  .foregroundColor(foregroundColor)
                  
          }).buttonStyle(.bordered)
          Button(action: {
          self.showWalkDirections.toggle()
        }, label: {
            Text(Image(systemName: "figure.walk"))
                .foregroundColor(foregroundColor)
                +
            Text("\n 16 min").bold()
                .foregroundColor(foregroundColor)
                +
            Text(" \n $0.00 ")
                .foregroundColor(foregroundColor)
                
        }).buttonStyle(.bordered)
          Button(action: {
             self.showBusDirections.toggle()
           }, label: {
              Text(Image(systemName: "bus"))
                   .foregroundColor(foregroundColor)
                    +
               Text("\n 12 min").bold()
                   .foregroundColor(foregroundColor)
                    +
               Text("\n $2.50")
                   .foregroundColor(foregroundColor)
           }).buttonStyle(.bordered)
          .disabled(directions.isEmpty)
        Button(action: {
                self.showRideshareDirections.toggle()
              }, label: {
                 Text(Image(systemName: "figure.wave"))
                      .foregroundColor(foregroundColor) +
                  Text("\n 10 min").bold()
                      .foregroundColor(foregroundColor) +
                 Text("\n $10.18")
                      .foregroundColor(foregroundColor)
              }).buttonStyle(.bordered)
             .disabled(directions.isEmpty)
    
         
    // ***************** WALK OPTIONS ********************
    }.sheet(isPresented: $showWalkDirections, content: {
      VStack(spacing: 0) {
               Text(Image(systemName: "figure.walk"))
              .font(.largeTitle)
              .foregroundColor(foregroundColor)
              .padding()
        Divider().background(Color.gray)

          List { VStack (spacing: 8){
              HStack (spacing: 105) {
                  (Text("Safest Route").bold().foregroundColor(.green) +
                  Text("\n16 min").bold() +
                  Text("\n2.3 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.walkdirections.count, id: \.self){ i in
                                   Text(self.walkdirections[i]).padding()
                               }
                               
                           }
                      })
              }
              Divider().background(Color.gray)
              HStack (spacing: 80) {
                  (Text("Alternate Route").bold() +
                  Text("\n15 min").bold() +
                  Text("\n2.2 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.walkdirections.count, id: \.self){ i in
                                   Text(self.walkdirections[i]).padding()
                               }
                               
                           }
                      })
              }
              Divider().background(Color.gray)
              HStack (spacing: 80) {
                  (Text("Alternate Route").bold() +
                  Text("\n15 min").bold() +
                   Text("\n2.2 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.walkdirections.count, id: \.self){ i in
                                   Text(self.walkdirections[i]).padding()
                               }
                               
                           }
                      })
              }
              VStack (spacing: 0){
                  Text("⚠ Warning: 7 reported crimes near area during past week")
                      .font(.system(size: 18))
                      .padding()
                      .background(Color.orange.opacity(0.4))
                      .cornerRadius(10)
                      //.foregroundColor(Color.orange)
              }
          }
          }
          
          /*
          List {
              Text(self.directions[0]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[1]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[2]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[3]).padding()
                  //.foregroundColor(.blue)
              Text("\(self.directions[4]) (⚠️ Warning: 4 people have been killed near this street in the past week)")
                  //.bold()
                  .padding()
                  //.foregroundColor(.blue)
                
              Text(self.directions[5]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[6]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[7]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[8]).padding()
                  //.foregroundColor(.blue)
              Text(self.directions[11]).padding()
                  //.foregroundColor(.blue)
          }
          */


        
      }
    // **************************************************
        
    // ****************** CAR OPTIONS ********************
        
    })
    .sheet(isPresented: $showCarDirections, content: {
      VStack(spacing: 0) {
          Text(Image(systemName: "car.fill"))
          .font(.largeTitle)
          .foregroundColor(foregroundColor)
          .padding()
        Divider().background(Color.gray)
        //Divider().background(Color.blue)

          List { VStack (spacing: 8){
                  //.foregroundColor(.blue)
              HStack (spacing: 105) {
                  (Text("Safest Route").bold().foregroundColor(.green) +
                  Text("\n7 min").bold() +
                  Text("\n3.6 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.directions.count, id: \.self){ i in
                                   Text(self.directions[i]).padding()
                               }
                               
                           }
                      })
              }
              Divider().background(Color.gray)
              HStack (spacing: 80) {
                  (Text("Alternate Route").bold() +
                  Text("\n7 min").bold() +
                  Text("\n3.4 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.directions.count, id: \.self){ i in
                                   Text(self.directions[i]).padding()
                               }
                               
                           }
                      })
              }
              Divider().background(Color.gray)
              HStack (spacing: 80) {
                  (Text("Alternate Route").bold() +
                  Text("\n6 min").bold() +
                   Text("\n3.5 km")).padding()
                  Button(action: {
                          self.showRealDirections.toggle()
                        }, label: {
                            Text("GO").bold()
                        }).padding()
                      .background(Color.green)
                      .foregroundColor(Color.white)
                      .cornerRadius(10)
                      .sheet(isPresented: $showRealDirections, content: {
                           VStack(spacing: 10) {
                               Text("Directions")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding()
                               
                               // Loop to automatically show directions
                               List(0..<self.directions.count, id: \.self){ i in
                                   Text(self.directions[i]).padding()
                               }
                               
                           }
                      })
              }
              VStack (spacing: 0){
                  Text("⚠ Warning: 2 carjackings reported near area this week")
                      .font(.system(size: 18))
                      .padding()
                      .background(Color.orange.opacity(0.4))
                      .cornerRadius(10)
                      //.foregroundColor(Color.orange)
              }
          }
          }
          
      }
    
    // ***************** BUS OPTIONS *********************
          }).sheet(isPresented: $showBusDirections, content: {
            VStack(spacing: 0) {
                Text(Image(systemName: "bus"))
                .font(.largeTitle)
                .foregroundColor(foregroundColor)
                .padding()
              Divider().background(Color.gray)
              //Divider().background(Color.blue)

                List { VStack (spacing: 8){
                        //.foregroundColor(.blue)
                    HStack (spacing: 30) {
                        (Text("Safest Route").bold().foregroundColor(.green) +
                         Text("\nBus scheduled 2:49pm") +
                         Text(Image(systemName: "figure.walk")).foregroundColor(Color.gray) +
                         Text("2 min ").foregroundColor(Color.gray) +
                         Text(Image(systemName: "arrowtriangle.forward.fill")).foregroundColor(Color.gray) +
                         Text(Image(systemName: "bus")).foregroundColor(Color.gray) +
                         Text(" 3 min").foregroundColor(Color.gray))
                            .padding()
                        Button(action: {
                            self.showRealDirections.toggle()
                              }, label: {
                                  Text("GO").bold()
                              }).padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .sheet(isPresented: $showRealDirections, content: {
                                 VStack(spacing: 10) {
                                     Text("Directions")
                                         .font(.largeTitle)
                                         .bold()
                                         .padding()
                                     
                                     // Loop to automatically show directions
                                     List(0..<self.directions.count, id: \.self){ i in
                                         Text(self.directions[i]).padding()
                                     }
                                     
                                 }
                            })
                    }
                    Divider().background(Color.gray)
                    HStack (spacing: 30) {
                        (Text("Alternate Route").bold() +
                         Text("\nBus scheduled 2:53pm") +
                         Text(Image(systemName: "figure.walk")).foregroundColor(Color.gray) +
                         Text("2 min ").foregroundColor(Color.gray) +
                         Text(Image(systemName: "arrowtriangle.forward.fill")).foregroundColor(Color.gray) +
                         Text(Image(systemName: "bus")).foregroundColor(Color.gray) +
                         Text(" 4 min").foregroundColor(Color.gray))
                            .padding()
                        Button(action: {
                                self.showRealDirections.toggle()
                              }, label: {
                                  Text("GO").bold()
                              }).padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .sheet(isPresented: $showRealDirections, content: {
                                 VStack(spacing: 10) {
                                     Text("Directions")
                                         .font(.largeTitle)
                                         .bold()
                                         .padding()
                                     
                                     // Loop to automatically show directions
                                     List(0..<self.directions.count, id: \.self){ i in
                                         Text(self.directions[i]).padding()
                                     }
                                     
                                 }
                            })
                    }
                    Divider().background(Color.gray)
                    HStack (spacing: 30) {
                        (Text("Alternate Route").bold() +
                         Text("\nBus scheduled 2:51pm") +
                         Text(Image(systemName: "figure.walk")).foregroundColor(Color.gray) +
                         Text("2 min ").foregroundColor(Color.gray) +
                         Text(Image(systemName: "arrowtriangle.forward.fill")).foregroundColor(Color.gray) +
                         Text(Image(systemName: "bus")).foregroundColor(Color.gray) +
                         Text(" 4 min").foregroundColor(Color.gray))
                            .padding()
                        Button(action: {
                            self.showRealDirections.toggle()
                              }, label: {
                                  Text("GO").bold()
                              }).padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .sheet(isPresented: $showRealDirections, content: {
                                 VStack(spacing: 10) {
                                     Text("Directions")
                                         .font(.largeTitle)
                                         .bold()
                                         .padding()
                                     
                                     // Loop to automatically show directions
                                     List(0..<self.directions.count, id: \.self){ i in
                                         Text(self.directions[i]).padding()
                                     }
                                     
                                 }
                            })
                    }
                    VStack (spacing: 0){
                        Text("⚠ Warning: This bus is usually crowded at this time of the day")
                            .font(.system(size: 18))
                            .padding()
                            .background(Color.orange.opacity(0.4))
                            .cornerRadius(10)
                            //.foregroundColor(Color.orange)
                    }
                }
                }
                
            }
      // **************************************************
    
      // ***************** RIDESHARE OPTIONS *********************
            }).sheet(isPresented: $showRideshareDirections, content: {
              VStack(spacing: 0) {
                  Text(Image(systemName: "figure.wave"))
                  .font(.largeTitle)
                  .foregroundColor(foregroundColor)
                  .padding()
                Divider().background(Color.gray)
                //Divider().background(Color.blue)

                  List { VStack (spacing: 20){
                      
                      HStack (spacing: 80) {
                          (Text("UberX ").bold() +
                           Text(Image(systemName:"person.fill")) +
                               Text("2-3").bold() +
                           Text("\n8 min away") +
                           Text("\n$10.89")).padding()
                          Button(action: {
                                  self.showRideshareDirections.toggle()
                                }, label: {
                                    Text("UBER").bold()
                                }).padding()
                              .background(Color.black)
                              .foregroundColor(Color.white)
                              .cornerRadius(10)
                      }
                      Divider().background(Color.gray)
                      HStack (spacing: 70) {
                          (Text("UberXL ").bold() +
                           Text(Image(systemName:"person.fill")) +
                               Text("4-5").bold() +
                           Text("\n9 min away") +
                           Text("\n$15.89")).padding()
                          Button(action: {
                                  self.showRideshareDirections.toggle()
                                }, label: {
                                    Text("UBER").bold()
                                }).padding()
                              .background(Color.black)
                              .foregroundColor(Color.white)
                              .cornerRadius(10)
                      }
                      Divider().background(Color.gray)
                      HStack (spacing: 40) {
                          (Text("Uber Black ").bold() + Text(Image(systemName:"person.fill")) +
                              Text("2-3").bold() +
                           Text("\n12 min away") +
                           Text("\n$45.45")).padding()
                          Button(action: {
                                  self.showRideshareDirections.toggle()
                                }, label: {
                                    Text("UBER").bold()
                                }).padding()
                              .background(Color.black)
                              .foregroundColor(Color.white)
                              .cornerRadius(10)
                      }
                      
                  }
                  //.background(Color.accentColor)
                  }
 
              }
              //.background(Color.accentColor)
          // **************************************************
    })
      //.background(Color.accentColor.edgesIgnoringSafeArea(.all))
      
  }
      //.background(Color.accentColor.edgesIgnoringSafeArea(.all))
    
  }


}

struct MapView: UIViewRepresentable {

  typealias UIViewType = MKMapView

  @Binding var directions: [String]
  @Binding var walkdirections: [String]
  //@Binding var covidCases: [Int32]

  func makeCoordinator() -> MapViewCoordinator {
    return MapViewCoordinator()
  }

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
      
    // Initial map region before zooming in
    let region = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 33.1, longitude: -84.2),
      span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    mapView.setRegion(region, animated: true)

    // Source Location
    let source = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 33.783, longitude: -84.3831))

    // Destination
    let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963))
      
    // Request Car Directions (and transportation type)
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: source)
    request.destination = MKMapItem(placemark: destination)
    request.transportType = .automobile
    //request.transportType = .walking
    request.requestsAlternateRoutes = true
    //request.transportType = .transit
      
    // Get Directions
    let directions = MKDirections(request: request)
      directions.calculate { response, error in
      guard let route = response?.routes.first else { return }
      mapView.addAnnotations([source, destination]) // adds pins
      mapView.addOverlay(route.polyline) // adds line
      // Adjusts map after retrieving directions
      mapView.setVisibleMapRect(
        route.polyline.boundingMapRect,
        edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50),
            animated: true)
      // obtains directions
      self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }

        
        //*************
        // Write directions to text file (for Python scripts)
        // Make sure to modify path if intend to run app

        let directionsList = self.directions.description
        let filePath = "/Users/omarjimenez/Desktop/transportation-app/directions/directions.txt"
            FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
            do {
                // Write contents to file
                try directionsList.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
            }
            catch let error as NSError {
                print("Error: \(error)")
            }
        //*************

      }
      // Get Walk Directions
        let walkrequest = MKDirections.Request()
        walkrequest.source = MKMapItem(placemark: source)
        walkrequest.destination = MKMapItem(placemark: destination)
        walkrequest.transportType = .walking
        walkrequest.requestsAlternateRoutes = true
        
        let walkdirections = MKDirections(request: walkrequest)
        walkdirections.calculate { response, error in
          guard let walkroute = response?.routes.first else { return }
          // obtains directions
          self.walkdirections = walkroute.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
    return mapView
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
    
  // Map Rendering
  class MapViewCoordinator: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      let renderer = MKPolylineRenderer(overlay: overlay)
      renderer.strokeColor = .systemBlue
      renderer.lineWidth = 4
      return renderer
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
