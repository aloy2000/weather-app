//
//  ContentView.swift
//  SwiftUi-Wheater
//
//  Created by RAMANANDRAIBE Nirintsoa on 12/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Antananarivo")
                
                VStack(spacing: 10) {
                    MaintWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                    
                    HStack(spacing: 10) {
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                        WeatherDayView(dayOfWeek: "WED",imageName: "sun.max.fill", temperature:88)
                        WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow",temperature: 55)
                        WeatherDayView(dayOfWeek: "FRI" ,imageName: "sunset.fill",temperature: 60)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "snow",temperature: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                        print("tapped")
                    } label: {
                        Text("Change date time.")
                            .frame(width: 280, height: 50)
                            .background(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct WeatherDayView: View {
        
        var dayOfWeek:String
        var imageName: String
        var temperature: Int
        
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 40, height: 40, alignment: .center )
                
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
    
    struct BackgroundView: View {
        
        var topColor: Color;
        var bottomColor: Color
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
        }
    }
    
    struct CityTextView: View {
        var cityName: String
        
        //view
        var body: some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
    }
    
    struct MaintWeatherStatusView: View {
        
        var imageName:String
        var temperature: Int
        
        var body: some View {
            VStack(spacing: 10) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 180, height: 180, alignment: .center )
                
                Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
            }
            .padding(.bottom, 50)
            
        }
    }
}
