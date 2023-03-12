//
//  DashboardViewModel.swift
//  MiniWeather
//
//  Created by Anh Son Le on 11/03/2023.
//

import Combine
import CoreLocation
import SwiftUI

import Model
import WeatherRepository
import DI

@MainActor
class DashboardViewModel: ObservableObject {
    @Published private(set) var dailyWeather: [DayWeatherDTO] = []
    @Published private(set) var temperatureRange: ClosedRange<Double> = 0...0
    
    @Injectable private var weatherService: WeatherRepository
    
    init() {
        self.$dailyWeather
            .map { days in
                let min = days.map { $0.lowTemperature }.min() ?? 0
                let max = days.map { $0.highTemperature }.max() ?? 0
                return min...max
            }
            .assign(to: &$temperatureRange)
    }
}

extension DashboardViewModel {
    func fetchData() {
        Task {
            do {
                let weathers = try await weatherService
                    .weather(from: Date(),
                             to: Date().addingTimeInterval(86400 * 10),
                             in: CLLocation(latitude: 0, longitude: 0))
                self.dailyWeather = weathers
            } catch {
                print(error)
            }
        }
    }
}
