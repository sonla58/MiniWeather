//
//  DashboardView.swift
//  MiniWeather
//
//  Created by Anh Son Le on 11/03/2023.
//

import SwiftUI
import CoreLocation

import Model
import WeatherRepository
import UI
import CoreFeature

struct DashboardView: View {
    @StateObject private var viewModel: DashboardViewModel = DashboardViewModel()
    @EnvironmentObject private var router: RoutePath
    
    var body: some View {
        List(Array(viewModel.dailyWeather.enumerated()), id: \.element.date.timeIntervalSince1970) { index, weather in
            GeometryReader { geometry in
                HStack {
                    Group {
                        if index == 0 {
                            Text("Today")
                        } else {
                            Text(weather.date.formatted(.dateTime.weekday(.abbreviated)))
                        }
                        Spacer()
                        Image(systemName: weather.condition)
                            .frame(width: 48)
                    }
                    
                    TemperatureRangeBar(outerTemperatureRange: viewModel.temperatureRange, innerTemperatureRange: weather.lowTemperature...weather.highTemperature)
                        .frame(maxWidth: .infinity)
                        .frame(width: geometry.size.width * 0.6)
                }
            }
            .onTapGesture {
                router.present(with: .dayDetail(weather.date, weather))
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("10 days forecast")
        .task {
            viewModel.fetchData()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
        
        DashboardView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
