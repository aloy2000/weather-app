//
//  ContentView.swift
//  SwiftUi-Wheater
//
//  Created by RAMANANDRAIBE Nirintsoa on 12/04/2025.
//

import SwiftUI

struct ContentView: View {
    private let weatherService = WeatherService()
    
    @State private var isNight = false
    @State private var temperature = 0.0
    @State private var isLoading = false
    @State private var errorMessage = "";
    
    
    private func getWeather() {
        weatherService.fetchWeather(latitude: -18.8792, longitude: 47.5079) { result in
            switch result {
            case .success(let weather):
                self.temperature = weather.temperature
                self.isLoading = false
            case .failure(let error):
               self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Antananarivo")
                
                VStack(spacing: 10) {
                    MaintWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature:Int(temperature))
                    
                    HStack(spacing: 10) {
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                        WeatherDayView(dayOfWeek: "WED",imageName: "sun.max.fill", temperature:88)
                        WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow",temperature: 55)
                        WeatherDayView(dayOfWeek: "FRI" ,imageName: "sunset.fill",temperature: 60)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "snow",temperature: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isNight.toggle()
                        }
                    } label: {
                        WeathButton(title: "Change day time", textColor: .blue, backgroundColor: .white)
                    }
                    
                    Spacer()
                }
            }.onAppear() {
                getWeather()
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
        
        @Binding var isNight: Bool
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [isNight ?.black: .blue, isNight ? .gray: Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
                .animation(.easeInOut(duration: 1.0), value: isNight)
            
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
                    .frame(width: 180, height: 180, alignment: .center)
                
                Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
            }
            .padding(.bottom, 50)
            
        }
    }
    
    struct WeathButton: View {
        var title: String
        var textColor: Color
        var backgroundColor: Color
        
        var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
                .foregroundColor(textColor)
        }
    }
}
